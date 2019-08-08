library AutoUpgradeServer;

uses
  ActiveX,
  ComObj,
  WebBroker,
  ISAPIApp,
  ISAPIThreadPool,
  ServerMain in 'ServerMain.pas' {AutoUpgradeWebModule: TWebModule};

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.CreateForm(TAutoUpgradeWebModule, AutoUpgradeWebModule);
  Application.Run;
end.
