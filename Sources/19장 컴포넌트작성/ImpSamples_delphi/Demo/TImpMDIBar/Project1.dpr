program Project1;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  Inventory in 'Inventory.pas' {InventoryForm},
  Personnel in 'Personnel.pas' {PersonnelForm},
  Account in 'Account.pas' {AccountForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
