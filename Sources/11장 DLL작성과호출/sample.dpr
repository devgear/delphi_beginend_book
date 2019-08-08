program sample;

uses
  Forms,
  Usplash in 'Usplash.pas' {splashform},
  udm in 'udm.pas' {Dm: TDataModule},
  Utree in 'Utree.pas' {treeform},
  Umain in 'Umain.pas' {mainform},
  UDept in 'UDept.pas' {DeptForm},
  uinsa in 'uinsa.pas' {InsaForm};

{$R *.res}

begin
  Application.Initialize;
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.ReFresh;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tmainform, mainform);
  Application.CreateForm(TDm, Dm);
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.
