program Project_IntraWeb;

uses
  Forms,
  IWStart,
  UTF8ContentParser,
  Unit1 in 'Unit1.pas' {IWForm1: TIWAppForm},
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  Unit2 in 'Unit2.pas' {IWForm2: TIWAppForm};

{$R *.res}

begin
  TIWStart.Execute(True);
end.
