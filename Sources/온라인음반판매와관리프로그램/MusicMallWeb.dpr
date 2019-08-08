program MusicMallWeb;

uses
  Forms,
  IWStart,
  UTF8ContentParser,
  uHomeForm in 'uHomeForm.pas' {HomeForm: TIWAppForm},
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  uLoginForm in 'uLoginForm.pas' {LoginForm: TIWAppForm},
  ClientClassesUnit in 'ClientClassesUnit.pas',
  uVars in 'uVars.pas',
  uOrderForm in 'uOrderForm.pas' {OrderForm: TIWAppForm},
  uOrderFinalForm in 'uOrderFinalForm.pas' {OrderFinalForm: TIWAppForm};

{$R *.res}

begin
  TIWStart.Execute(True);
end.

