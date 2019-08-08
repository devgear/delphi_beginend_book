program Pmemo;

uses
  Forms,
  windows,
  Umemo in 'Umemo.pas' {MemoForm},
  Usplash in 'Usplash.pas' {SplashForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Refresh;
  sleep(2000);
  Application.CreateForm(TMemoForm, MemoForm);
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.
