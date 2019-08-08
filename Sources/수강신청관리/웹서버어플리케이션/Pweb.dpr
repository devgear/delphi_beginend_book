program Pweb;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  Umain_web in 'Umain_web.pas' {WebModule5: TWebModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule5, WebModule5);
  Application.Run;
end.

