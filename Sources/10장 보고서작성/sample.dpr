program sample;

uses
  Forms,
  Umain in 'Umain.pas' {MainForm},
  Usplash in 'Usplash.pas' {splashform},
  uABOUT in 'uABOUT.pas' {AboutBox},
  udm in 'udm.pas' {Dm: TDataModule},
  uinsa in 'uinsa.pas' {InsaForm},
  Utree in 'Utree.pas' {treeform},
  UDept in 'UDept.pas' {DeptForm};

{$R *.res}

begin
  Application.Initialize;
  splashform := tsplashform.create(application);
  splashform.show;
  splashform.refresh;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TDeptForm, DeptForm);
  splashform.hide;
  splashform.free;
  Application.Run;
end.
