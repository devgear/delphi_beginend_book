program PDataSnap_Client;

uses
  Forms,
  uMain_client in 'uMain_client.pas' {mainform},
  UDM_client in 'UDM_client.pas' {DM: TDataModule},
  Uinsa_client in 'Uinsa_client.pas' {InsaForm},
  Utree_client in 'Utree_client.pas' {TreeForm},
  Utrans_client in 'Utrans_client.pas' {transForm},
  URecError in 'URecError.pas' {ReconcileErrorForm},
  UclientClass in 'UclientClass.pas',
  UDept_client in 'UDept_client.pas' {DeptForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tmainform, mainform);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
