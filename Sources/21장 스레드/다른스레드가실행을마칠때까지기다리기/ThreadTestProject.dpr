program ThreadTestProject;

uses
  Forms,
  UnitFormMain in 'UnitFormMain.pas' {FormMain},
  UnitFormLogin in 'UnitFormLogin.pas' {FormLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  LoginCheck;
  Application.CreateForm(TFormMain, FormMain);
  LoginThread.WaitFor;
  if Start then
  begin
     Application.Run;
  end;
end.
