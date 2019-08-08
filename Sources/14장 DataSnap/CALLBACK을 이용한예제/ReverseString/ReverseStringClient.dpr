program ReverseStringClient;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form1},
  ClientProxy in 'ClientProxy.pas',
  DSUtils in 'DSUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
