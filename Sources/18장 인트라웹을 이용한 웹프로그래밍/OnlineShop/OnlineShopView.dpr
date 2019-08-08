program OnlineShopView;

uses
  Forms,
  IWMain,
  UTF8ContentParser,
  ViewMain in 'ViewMain.pas' {IWForm1: TIWAppForm},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformIWMain, formIWMain);
  Application.Run;
end.
