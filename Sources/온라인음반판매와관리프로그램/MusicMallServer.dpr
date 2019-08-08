program MusicMallServer;

uses
  Forms,
  uServerForm in 'uServerForm.pas' {Server},
  uServerMethodsUnit in 'uServerMethodsUnit.pas' {ServerMethods: TDSServerModule},
  uServerContainerUnit in 'uServerContainerUnit.pas' {ServerContainer: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '::: MusicMall Server';
  Application.CreateForm(TServer, Server);
  Application.CreateForm(TServerContainer, ServerContainer);
  Application.Run;
end.

