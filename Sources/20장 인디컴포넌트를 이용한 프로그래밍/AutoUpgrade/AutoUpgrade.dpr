program AutoUpgrade;

uses
  Forms,
  DownloadMain in 'DownloadMain.pas' {DownloadMainForm},
  ImpFileStream in 'ImpFileStream.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '자동 업그레이드';
  Application.CreateForm(TDownloadMainForm, DownloadMainForm);
  Application.Run;
end.
