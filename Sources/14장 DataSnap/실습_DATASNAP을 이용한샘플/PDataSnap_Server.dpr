program PDataSnap_Server;

uses
  Forms,
  Umain_server in 'Umain_server.pas' {Form8},
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas' {ServerMethods1: TDSServerModule},
  ServerContainerUnit1 in 'ServerContainerUnit1.pas' {ServerContainer1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TServerMethods1, ServerMethods1);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.




