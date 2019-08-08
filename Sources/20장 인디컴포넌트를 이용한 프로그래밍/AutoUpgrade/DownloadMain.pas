unit DownloadMain;

interface

uses
  Windows, Messages, Classes, Controls, Forms, ComCtrls, StdCtrls, Dialogs,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

const
  WM_FORMINIT  = WM_USER + 1003;

type
  TDownFileRec = record
    Path: string;
    Size: integer;
    DateTime: TDateTime;
  end;

  TDownloadMainForm = class(TForm)
    Animate1: TAnimate;
    CurrProgressBar: TProgressBar;
    TotalProgressBar: TProgressBar;
    MsgLabel: TLabel;
    StatusLabel: TLabel;
    IdHTTP1: TIdHTTP;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    UpgradeUrl, UpgradeBaseUrl: string;
    ProgramToRun: string;
    SystemDirectory: string;
    CurPath: string;
    procedure FileSizeChange(Sender: TObject; OldPos, NewPos: integer);
    function DownloadFile(ADownRec: TDownFileRec; BaseUrl, CurPath: string): int64;
    function GetLocalPath(ServerPath: string): string;
    procedure WMFormInit(var Msg: TMessage); message WM_FORMINIT;
  public
    UserID, UserPass: string;
    function DownloadProduct(FolderName: string): integer;
  end;

var
  DownloadMainForm: TDownloadMainForm;

implementation

{$R *.dfm}

uses SysUtils, IniFiles, DateUtils, IdException, ImpFileStream, TlHelp32;

const
  SAutoUpgradeHeader = 'AutoUpgrade Server';
  SSysDirSymbol = '@system';
  SDefaultProgramToRun = 'SampleProgram.exe';
  SDefaultUpgradeUrl = 'http://www.devgear.co.kr/AutoUpgradeServer/AutoUpgradeServer.dll?path=vcl120';

procedure TDownloadMainForm.FormCreate(Sender: TObject);
var
  len: integer;
begin
  SetLength(SystemDirectory, MAX_PATH+1);
  len := GetSystemDirectory(PChar(SystemDirectory), MAX_PATH);
  SetLength(SystemDirectory, len);

  CurPath := ExtractFilePath(ParamStr(0));

  with TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'server.ini') do try
    UpgradeUrl   := ReadString('AutoUpgrade', 'UpgradeUrl', SDefaultUpgradeUrl);
    ProgramToRun := ReadString('AutoUpgrade', 'ProgramToRun', SDefaultProgramToRun);
  finally
    Free;
  end;

  if (Pos('/', UpgradeUrl)=0) or (Pos('?', UpgradeUrl)=0) then
    ShowMessage('업그레이드 주소가 잘못되었습니다. server.ini를 확인하십시오.' + #13#10 + UpgradeBaseUrl);
  if LowerCase(Copy(UpgradeUrl, 1, 7))<>'http://' then
    UpgradeUrl := 'http://' + UpgradeUrl;

  // 개별 파일들을 다운받기 위한 폴더 경로 : http://www.devgear.co.kr/AutoUpgradeServer/vcl120
  UpgradeBaseUrl := Copy(UpgradeUrl, 1, LastDelimiter('/', UpgradeUrl)) + Copy(UpgradeUrl, Pos('=', UpgradeUrl)+1, 10000);
end;

procedure TDownloadMainForm.FormShow(Sender: TObject);  // 타이틀바의 닫기 버튼과 시스템메뉴의 닫기 메뉴 없애기
var
  hMnu: HMENU;
begin
  hMnu := GetSystemMenu(Handle, false);
  EnableMenuItem(hMnu, SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
  DrawMenuBar(Handle);
  hMnu := GetSystemMenu(Application.Handle, false);
  EnableMenuItem(hMnu, SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
  DrawMenuBar(Application.Handle);
end;

procedure TDownloadMainForm.FormActivate(Sender: TObject);
begin
  PostMessage(self.Handle, WM_FORMINIT, 0, 0);
end;

procedure TDownloadMainForm.WMFormInit(var Msg: TMessage);

  function GetProcessModule(dwPID: dword; ProcessName: string): boolean;
  var
    hModuleSnap: THandle;
    ModEntry: TModuleEntry32;
  begin
    result := false;
    hModuleSnap := CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, dwPID);
    if hModuleSnap = THandle(-1) then exit;
    ModEntry.dwSize := sizeof(TModuleEntry32);
    if Module32First(hModuleSnap, ModEntry) then
    begin
      repeat
        if ModEntry.szModule = ProcessName then
        begin
          CloseHandle(hModuleSnap);
          result := true;
          exit;
        end;
      until not Module32Next(hModuleSnap, ModEntry);
    end;
    CloseHandle(hModuleSnap);
  end;

  function KillProcess(ProcessName: string): integer;
  var
    hProcessSnap: THandle;
    ProcEntry: TProcessEntry32;
    bCurrent: boolean;
    hProcess: THandle;
    nCode: DWORD; //프로세스 종료 상태
  begin
    result := 0;
    hProcessSnap := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    if hProcessSnap = THandle(-1) then exit;
    ProcEntry.dwSize := sizeof(TProcessEntry32);
    if Process32First(hProcessSnap, ProcEntry) then
    begin
      repeat
        bCurrent := GetProcessModule(ProcEntry.th32ProcessID, ProcessName);
        if bCurrent then
        begin
          hProcess := OpenProcess(PROCESS_ALL_ACCESS, false, ProcEntry.th32ProcessID);
          if hProcess <> 0 then
          begin
            if TerminateProcess(hProcess, 0) then
              GetExitCodeProcess(hProcess, nCode);
            CloseHandle(hProcess);
            Inc(result);
          end;
        end;
      //다음 프로세스의 정보를 구하여 있으면 루프를 돈다.
      until not Process32Next(hProcessSnap, ProcEntry);
    end;
    CloseHandle(hProcessSnap);
  end;

var
  iRet: integer;
  bRet: boolean;
begin
  KillProcess(SDefaultProgramToRun);
  iRet := DownloadProduct('VCL120');
  if iRet>=0 then
  begin
    bRet := WinExec(PAnsiChar(SDefaultProgramToRun+' NOUPCHECK'), SW_SHOWNORMAL) > 31;
    if bRet=false then
      ShowMessage(SysErrorMessage(GetLastError));
  end;

  Application.Terminate;
end;

function TDownloadMainForm.DownloadProduct(FolderName: string): integer;

  function IsFileToDownload(LocalFilePath: string; RemoteFileTime: TDateTime): boolean;
  var
    LocalFileTime: TDateTime;
  begin
    result := true;
    if not FileExists(LocalFilePath) then exit;
    FileAge(LocalFilePath, LocalFileTime);
    if IncSecond(LocalFileTime, 1) < RemoteFileTime then exit;
    result := false;
  end;

var
  FileList, TmpList: TStringList;
  TotalSize, i: integer;
  AFilePath: string;
  DownList: array of TDownFileRec;
  ADownRec: TDownFileRec;
begin
  Animate1.Active := false;
  Animate1.Visible := false;
  Animate1.CommonAVI := aviFindFolder;
  Animate1.Active := true;
  Animate1.Visible := true;
  MsgLabel.Caption := '업그레이드 파일 확인중...';
  Application.ProcessMessages;

  FileList := TStringList.Create;
  try
    FileList.Text := idHTTP1.Get(UpgradeUrl);
  except
    on E: Exception do
    begin
      result := -1;
      exit;
    end;
  end;

  if (Trim(FileList.Text)='') or (FileList.Strings[0]<>SAutoUpgradeHeader) then
  begin
    ShowMessage('업그레이드 서버 주소가 잘못되었습니다.');
    result := 0;
    exit;
  end;
  FileList.Delete(0); // 헤더 날림

  TmpList  := TStringList.Create;
  TotalSize := 0;
  for i:=0 to FileList.Count-1 do
  begin
    TmpList.Text := StringReplace(FileList.Strings[i], #9, #13#10, [rfReplaceAll]);
    with ADownRec do
    begin
      // 디버그 목적 -> List index out of bounds (1)
      try
        Path := TmpList.Strings[0];
        Size := StrToInt(TmpList.Strings[1]);
        DateTime := StrToDateTime(TmpList.Strings[2]);
      except
        on E: Exception do
        begin
          ShowMessage('예상하지 못한 에러가 발생하였습니다.' + #13#10
                    + '아래는 에러 추적 목적입니다.' + #13#10 + #13#10
                    + 'URL: ' + UpgradeUrl + #13#10
                    + '[' + FileList.Text + ']'  );
          result := -1;
          exit;
        end;
      end;
    end;
    AFilePath := GetLocalPath(ADownRec.Path);
    if IsFileToDownload(AFilePath, ADownRec.DateTime) then
    begin
      SetLength(DownList, Length(DownList)+1);
      DownList[Length(DownList)-1] := ADownRec;
      TotalSize := TotalSize + ADownRec.Size;
    end;
  end;
  TmpList.Free;
  FileList.Free;

  result := Length(DownList);
  if Application.MainForm<>self then exit;

  Animate1.CommonAVI := aviCopyFile;
  Animate1.Active := true;
  TotalProgressBar.Position := 0;
  TotalProgressBar.Max := TotalSize;
  StatusLabel.Visible := true;


  Application.ProcessMessages;
  for i:=0 to Length(DownList)-1 do
  begin
    MsgLabel.Caption := DownList[i].Path + ' 다운로드중...';
    StatusLabel.Caption := IntToStr(i+1) + '/' + IntToStr(Length(DownList)) + '번째';
    CurrProgressBar.Position := 0;
    CurrProgressBar.Max := DownList[i].Size;
    Application.ProcessMessages;
    if DownloadFile(DownList[i], UpgradeBaseUrl, CurPath) < 0 then // 에러라도 0일 경우는 리스트의 다음 파일들을 다운로드 시도 계속
    begin
      result := -1;
      exit;
    end;
    Application.ProcessMessages;
  end;
  Close;
end;

function TDownloadMainForm.DownloadFile(ADownRec: TDownFileRec; BaseUrl, CurPath: string): int64;
var
  AStream: TImpFileStream;
  TempPath, RealPath: string;
begin
  TempPath := CurPath + 'temp\' + ADownRec.Path;
  ForceDirectories(ExtractFilePath(TempPath));
  AStream := TImpFileStream.Create(TempPath, fmCreate);
  try
    AStream.OnPositionChange := FileSizeChange;
    try
      idHTTP1.Get(BaseUrl + '/' + ADownRec.Path, AStream);
      result := AStream.Size;
    except
      on E: EIdConnClosedGracefully do
      begin
        MsgLabel.Caption := ADownRec.Path + ' 다운로드 에러 발생, 재시도중...';
        try
          idHTTP1.Get(BaseUrl + '/' + ADownRec.Path, AStream);
          result := AStream.Size;
        except
          on E: EIdConnClosedGracefully do
          begin
            ShowMessage('다운로드중에 네트워크 연결이 끊어졌습니다.' + #13#10 + '네트워크를 점검하신 후 잠시 후에 다시 시도해보십시오.');
            result := -1;
            exit;
          end;
        end;
      end;
      on E: EidHTTPProtocolException do
      begin
        ShowMessage(ADownRec.Path + ' 파일을 찾을 수 없습니다.');
        result := 0;
        exit;
      end;
      on E: Exception do
      begin
        ShowMessage('다운로드중에 시스템 에러가 발생했습니다.' + #13#10#13#10 + E.Message);
        result := -1;
        exit;
      end;
    end;
  finally
    AStream.Free;
  end;
  FileSetDate(TempPath, DateTimeToFileDate(ADownRec.DateTime));

  if ExtractFileName(ADownRec.Path)=ExtractFileName(ParamStr(0)) then exit;
  // 자기 자신은 이동시키지 않고 스킵한다 : ProgramToRun 프로그램에서 이동시켜야 할 것.

  RealPath := GetLocalPath(ADownRec.Path);
  if Copy(ADownRec.Path, 1, Length(SSysDirSymbol)+1) = SSysDirSymbol+'\' then
    RealPath := SystemDirectory + Copy(ADownRec.Path, Length(SSysDirSymbol)+1, 1000)
  else
    RealPath := CurPath + ADownRec.Path;
  ForceDirectories(ExtractFilePath(RealPath));
  if FileExists(RealPath) then DeleteFile(RealPath);
  MoveFile(PChar(TempPath), PChar(RealPath));
end;

function TDownloadMainForm.GetLocalPath(ServerPath: string): string;
begin
  if Copy(ServerPath, 1, Length(SSysDirSymbol)+1) = SSysDirSymbol+'\' then
    result := SystemDirectory + Copy(ServerPath, Length(SSysDirSymbol)+1, 1000)
  else
    result := CurPath + ServerPath;
  if LowerCase(ExtractFileExt(result))='.zip' then
    result := Copy(result, 1, Length(result)-4);
  // 압축된 파일로 업그레이드하는 방식은 소스 정리 관계로 지워짐. 향후 다시 추가 예정.
end;

procedure TDownloadMainForm.FileSizeChange(Sender: TObject; OldPos, NewPos: integer);
begin
  CurrProgressBar.Position := NewPos;
  TotalProgressBar.Position := TotalProgressBar.Position + (NewPos-OldPos);
  Application.ProcessMessages;
end;

end.
