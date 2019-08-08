program pLecture;

uses
  Forms,
  Ucustomer in 'Ucustomer.pas' {Form_Customer},
  Umain in 'Umain.pas' {mainForm},
  Udm in 'Udm.pas' {Dm: TDataModule},
  UAccept in 'UAccept.pas' {Form_Accept},
  UGridforCurri in 'UGridforCurri.pas' {Form_GridforCurri},
  Umail in 'Umail.pas' {Form_Mail},
  UMailSend in 'UMailSend.pas' {Form_MailSend};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TForm_MailSend, Form_MailSend);
  Application.Run;
end.
