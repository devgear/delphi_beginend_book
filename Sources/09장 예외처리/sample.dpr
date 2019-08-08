program sample;

uses
  Forms,
  Umain in 'Umain.pas' {MainForm},
  Usplash in 'Usplash.pas' {splashform},
  uABOUT in 'uABOUT.pas' {AboutBox},
  udm in 'udm.pas' {Dm: TDataModule},
  Utree in 'Utree.pas' {treeform},
  UDept in 'UDept.pas' {DeptForm},
  uinsa in 'uinsa.pas' {InsaForm};

{$R *.res}

begin
  Application.Initialize;
  splashform := tsplashform.create(application);
  splashform.show;
  splashform.refresh;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDm, Dm);
  splashform.hide;
  splashform.free;
  Application.Run;
end.
