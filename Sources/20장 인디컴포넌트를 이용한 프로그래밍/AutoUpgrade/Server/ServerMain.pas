unit ServerMain;

interface

uses
  SysUtils, Classes, HTTPApp;

type
  TAutoUpgradeWebModule = class(TWebModule)
    procedure WebModule4WebActionItem1Action(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    RootPath,
    FileList: string;
    procedure DoFindFiles(AFileMask: string);
  public
    { Public declarations }
  end;

var
  AutoUpgradeWebModule: TAutoUpgradeWebModule;

implementation

{$R *.dfm}

const
  SAutoUpgradeHeader = 'AutoUpgrade Server' + #13#10;

procedure TAutoUpgradeWebModule.WebModule4WebActionItem1Action(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  FolderToDownload: string;
begin
  Response.ContentType := 'text/plain';
  Response.Content := SAutoUpgradeHeader;

  FolderToDownload := Trim(Request.QueryFields.Values['path']);
  if Request.QueryFields.Values['path']='' then exit;

  RootPath := ExtractFilePath(GetModuleName(hinstance)) + FolderToDownload + '\';
  if Copy(RootPath, 1, 4)= '\\?\' then RootPath := Copy(RootPath, 5, 1000);

  FileList := '';
  DoFindFiles(RootPath + '*.*');

  Response.Content := Response.Content + FileList;
end;

procedure TAutoUpgradeWebModule.DoFindFiles(AFileMask: string);

  procedure DoFileFound(ACurrentPath: string; var SearchRec: TSearchRec);
  var
    APath: string;
    ADate: TDateTime;
  begin
    APath := Copy(ACurrentPath, Length(RootPath)+1, 100000);
    ADate := FileDateToDateTime(SearchRec.Time);
    FileList := FileList
              + APath + SearchRec.Name + #9
              + IntToStr(SearchRec.Size) + #9
              + FormatDateTime('yyyy-mm-dd hh:nn:ss', ADate) + #13#10;
  end;

var
  Sr: TSearchRec;
  CurrentPath: string;
begin
  CurrentPath := ExtractFilePath(AFileMask);
  if DirectoryExists(CurrentPath)=false then exit;

  // 파일 검색
  if SysUtils.FindFirst(AFileMask, faAnyFile and not faDirectory, Sr)=0 then
  begin
    repeat
      DoFileFound(CurrentPath, Sr);
    until SysUtils.FindNext(Sr)<>0;
    SysUtils.FindClose(Sr);
  end;

  // 서브디렉토리 검색
  if SysUtils.FindFirst(CurrentPath + '*.*', faDirectory, Sr) = 0 then
  begin
    repeat
      if ((Sr.Attr and faDirectory) = faDirectory) and (Sr.Name[1] <> '.') then
        DoFindFiles(CurrentPath + Sr.Name + '\' + ExtractFileName(AFileMask));
    until SysUtils.FindNext(Sr)<>0;
    SysUtils.FindClose(Sr);
  end;
end;

end.

// 이 ISAPI dll 모듈이 IIS 상에서 제대로 실행되기 위해서는, 이 모듈이 웹루트 이하의 디렉토리 혹은
// 웹 공유된 디렉토리에 위치여야 하며, 해당 디렉토리에는 "실행 (스크립트 포함)" 실행권한이 지정되어 있어야 합니다.

// 하지만 실제 다운로드 대상 파일들이 위치한 서브디렉토리들은 추가로 실행권한이 "없음"으로 지정되어야 합니다.
// 이렇게 해야 하는 이유는, 다운로드해야 할 파일들 중에 exe나 dll이 포함되어 있을 경우,
// 다운로드 요청을 받았을 때 해당 디렉토리가 실행 권한을 가지고 있으면 cgi인 것으로 오인하거나(.exe)
// 이 모듈처럼 ISAPI인 것으로 오인하여(.dll) 실행하려고 시도하기 때문입니다.
// 이 문제는 웹 서버의 보안과도 큰 관련이 있으므로 꼭 주의해야 합니다.

// IIS 6.0 (윈도우 2003 서버) 이상에서는 시스템에 이미 등록된 확장자(MIME 타입) 이외에는
// IIS에서 다운로드가 되지 않는 문제가 있습니다. 이 문제를 해결하려면,
//1. 윈도우 관리도구에서 인터넷 정보 서비스(IIS) 관리 도구를 실행시킵니다.
//2. 로컬 컴퓨터를 선택한 후 속성 창을 오픈합니다.
//3. MIME 형식 버튼을 클릭합니다.
//4. 새 형식 버튼을 클릭합니다.
//5. 확장명에 *를 입력합니다.
//6. MIME 형식에 application/octet-stream을 입력합니다.
//7. 설정 변경은 관리도구의 서비스 매니저에서 IIS Admin Service와 World Wide Web Publishing Service를 재시작해야 적용됩니다.

