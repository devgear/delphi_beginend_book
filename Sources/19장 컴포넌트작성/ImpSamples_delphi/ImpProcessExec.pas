// 이 컴포넌트는 제가 몇년 전에 볼랜드포럼에 C++ 코드로 올렸던 팁의 내용을
// 쓰레드 방식으로 바꾸어서 컴포넌트화한 것입니다.
// http://www.borlandforum.com/impboard/impboard.dll?action=read&db=bcb_tip&no=37
unit ImpProcessExec;

interface

uses
  SysUtils, Classes, Windows;

type
  TImpProcessExec = class(TComponent)
  private
    hProcess: THandle;
    FCommandLine: string;
    FOnProcessTerminate: TNotifyEvent;
  protected
  public
    constructor Create(AOwner: TComponent); override;
    function Execute: boolean;
  published
    property CommandLine: string read FCommandLine write FCommandLine;
    property OnProcessTerminate: TNotifyEvent read FOnProcessTerminate write FOnProcessTerminate;
  end;

  TProcessWaitThread = class(TThread)
  private
    FProcessExec: TImpProcessExec;
    procedure DoProcessTerminate;
  protected
    procedure Execute; override;
  public
    constructor Create(AProcessExec: TImpProcessExec);
  end;

procedure Register;

implementation

uses Dialogs;

procedure Register;
begin
  RegisterComponents('ImpSamples', [TImpProcessExec]);
end;

{ TImpProcessExec }

constructor TImpProcessExec.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCommandLine := '';
  hProcess := 0;
end;

function TImpProcessExec.Execute: boolean;
var
  start: TStartupInfo;
  sec: TSecurityAttributes;
  pinfo: TProcessInformation;
begin
  result := false;
  FillChar(start, sizeof(STARTUPINFO), 0);
  start.cb := sizeof(start);
  start.wShowWindow := SW_SHOWDEFAULT;
  sec.nLength := sizeof(sec);
  sec.lpSecurityDescriptor := nil;
  sec.bInheritHandle := true;

  if CreateProcess(PChar(FCommandLine), nil, @sec, @sec, true, 0, nil, nil, start, pinfo)<>true then
    exit;
  hProcess := pinfo.hProcess;
  TProcessWaitThread.Create(self);
  // FreeOnTerminate 덕분에 이 쓰레드에 대해 아무 관리를 할 필요가 없습니다.
  result := true;
end;

{ TProcessWaitThread }

constructor TProcessWaitThread.Create(AProcessExec: TImpProcessExec);
begin
  inherited Create(false);
  FProcessExec := AProcessExec;
  FreeOnTerminate := true;
end;

procedure TProcessWaitThread.DoProcessTerminate;
begin
  if Assigned(FProcessExec.OnProcessTerminate) then
    FProcessExec.OnProcessTerminate(FProcessExec);
end;

procedure TProcessWaitThread.Execute;
var
  waitresult: Dword;
begin
  repeat
    waitresult := WaitForSingleObject(FProcessExec.hProcess, INFINITE);
  until waitresult <> WAIT_TIMEOUT;
  Synchronize(DoProcessTerminate);
  CloseHandle(FProcessExec.hProcess);
  FProcessExec.hProcess := 0;
end;

end.
