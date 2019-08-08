program Project_Client;

uses
  Forms,
  UMain_Client in 'UMain_Client.pas' {Form1},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule},
  RecError in 'RecError.pas' {ReconcileErrorForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
