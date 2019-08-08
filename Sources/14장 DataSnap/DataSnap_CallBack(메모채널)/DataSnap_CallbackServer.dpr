program DataSnap_CallbackServer;

uses
  Forms,
  UMain in 'UMain.pas' {MainForm_Server},
  ServerContainerUnit1 in 'ServerContainerUnit1.pas' {ServerContainer1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm_Server, MainForm_Server);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.

