program Pwebbroker1;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  Uwebmodule1 in 'Uwebmodule1.pas' {WebModule8: TWebModule};

{$R *.res}

begin
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  Application.Run;
end.
