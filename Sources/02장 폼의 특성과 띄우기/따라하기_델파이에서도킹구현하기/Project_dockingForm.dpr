program Project_dockingForm;

uses
  Forms,
  UDockingUnit in 'UDockingUnit.pas' {Docking_Form},
  UDockedUnit in 'UDockedUnit.pas' {Docked_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDocking_Form, Docking_Form);
  Application.Run;
end.
