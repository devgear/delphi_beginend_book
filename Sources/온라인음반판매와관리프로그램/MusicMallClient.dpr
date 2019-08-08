program MusicMallClient;

uses
  Forms,
  uClientClassesUnit in 'uClientClassesUnit.pas',
  uClientModuleUnit in 'uClientModuleUnit.pas' {ClientModule: TDataModule},
  uClientMainForm in 'uClientMainForm.pas' {ClientMainForm},
  uClientOrderForm in 'uClientOrderForm.pas' {ClientOrderForm},
  uClientProductForm in 'uClientProductForm.pas' {ClientProductForm},
  uClientStatisticsForm in 'uClientStatisticsForm.pas' {StatisticsForm},
  uClientMemberForm in 'uClientMemberForm.pas' {ClientMemberForm},
  uSPForm in 'uSPForm.pas' {SPForm},
  Windows;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  // 스플래시 보임
  SPForm := TSPForm.Create(Application);
  SPForm.Show;
  SPForm.Refresh;


  Application.CreateForm(TClientModule, ClientModule);
  Application.CreateForm(TClientMainForm, ClientMainForm);

  // 스플래시를 보이기 위한 지연 -_-;
  Sleep(2000);
  // 스플래시 닫음
  SPForm.Hide;
  SPForm.Free;

  Application.Run;
end.
