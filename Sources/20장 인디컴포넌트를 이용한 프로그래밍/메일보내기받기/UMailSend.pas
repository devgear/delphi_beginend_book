unit UMailSend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP, IdBaseComponent, IdMessage, ExtCtrls,idattachment;

type
  TForm_MailSend = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    editFrom: TEdit;
    editTo: TEdit;
    editSubject: TEdit;
    editReferences: TEdit;
    Label5: TLabel;
    Editbcc: TEdit;
    Msg: TIdMessage;
    SMTP: TIdSMTP;
    OpenDialog1: TOpenDialog;
    GroupBox1: TGroupBox;
    ListView1: TListView;
    SpeedButton1: TSpeedButton;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure ResetAttachmentListView;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_MailSend: TForm_MailSend;


implementation

uses Umail;

{$R *.dfm}

procedure TForm_MailSend.Button1Click(Sender: TObject);
begin
  editFrom.Text  := '';
  editSubject.Text := '';
  memo1.Lines.clear;
  listview1.Items.clear;
end;

procedure TForm_MailSend.Button2Click(Sender: TObject);
begin
   with Msg do
   begin
      Clear;
      From.Text := Trim(editFrom.Text);
      Recipients.EMailAddresses := Trim(editFrom.Text);
      Subject := Trim(editSubject.Text);
      Body.Assign(memo1.Lines);
      if CheckBox1.Checked then
         ReceiptRecipient.text := From.text
      else
         ReceiptRecipient.text := '';
   end;
   with smtp do
   begin
     UserName := smtpServerUser;
     Password := smtpServerPassword;
     Host := smtpServerName;
     Port := smtpServerPort;
     Connect;
     try
       Send(msg);
     finally
       Disconnect;
     end;
   end;
end;

procedure TForm_MailSend.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TForm_MailSend.ResetAttachmentListView;
var
   listitem: TListItem;
   idx: Integer;
begin
   listview1.Items.Clear;
   for idx := 0 to Pred(Msg.MessageParts.Count) do
      begin
         listitem := listview1.Items.Add;
         if Msg.MessageParts.Items[idx] is TIdAttachment then
            begin
               listitem.ImageIndex := 0;
               listitem.Caption := TIdAttachment(Msg.MessageParts.Items[idx]).Filename;
               listitem.SubItems.Add(TIdAttachment(Msg.MessageParts.Items[idx]).ContentType);
            end
      end;
end;

procedure TForm_MailSend.SpeedButton1Click(Sender: TObject);
var
  listitem:tlistitem;
begin
  if opendialog1.execute then
  begin
     TIdAttachment.Create(Msg.MessageParts).FileName :=
     OpenDialog1.FileName;
     ResetAttachmentListView;
  end;
end;

end.
