program sample;

uses
  Forms,
  Umain in 'Umain.pas' {mainForm},
  Udm in 'Udm.pas' {dm: TDataModule},
  Uinsa in 'Uinsa.pas' {insaForm},
  Udept in 'Udept.pas' {DEPTForm},
  Utree in 'Utree.pas' {TreeForm},
  Utrans in 'Utrans.pas' {TransForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
