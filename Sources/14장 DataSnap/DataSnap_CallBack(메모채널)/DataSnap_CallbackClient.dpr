program DataSnap_CallbackClient;

uses
  Forms,
  UMain_Client in 'UMain_Client.pas' {MainForm_Client};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm_Client, MainForm_Client);
  Application.Run;
end.
