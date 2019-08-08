unit Umail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ToolWin, ActnMan, ActnCtrls, ComCtrls, IdMessage,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdPOP3, ImgList, ActnList,
  PlatformDefaultStyleActnCtrls,inifiles,idattachment;

type
  TForm_Mail = class(TForm)
    StatusBar1: TStatusBar;
    ActionManager1: TActionManager;
    Check_Action: TAction;
    Retrieve_Action: TAction;
    Delete_Action: TAction;
    Purge_Action: TAction;
    Disconnect_Action: TAction;
    Setup_Action: TAction;
    Send_Action: TAction;
    ImageList1: TImageList;
    pop3: TIdPOP3;
    msg: TIdMessage;
    ListView1: TListView;
    ActionToolBar1: TActionToolBar;
    ActionToolBar2: TActionToolBar;
    Panel1: TPanel;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ListBox1: TListBox;
    Label17: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Check_ActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Disconnect_ActionExecute(Sender: TObject);
    procedure Retrieve_ActionExecute(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure Delete_ActionExecute(Sender: TObject);
    procedure Purge_ActionExecute(Sender: TObject);
    procedure Send_ActionExecute(Sender: TObject);
  private
    FMsgCount: Integer;
    FMsgNo: Integer;
    MailIni :TIniFile;

    { Private declarations }
  public
    procedure  ClearFields;
    { Public declarations }
  end;

var
  Form_Mail: TForm_Mail;
  Pop3ServerName :String;
  Pop3ServerPort :integer;
  Pop3ServerUser :String;
  Pop3ServerPassword :String;
  SmtpServerName :String;
  SmtpServerPort :integer;
  SmtpServerUser :String;
  SmtpServerPassword :String;

  UserEmail :String;
  Filestr:string;

implementation

uses UMailSend;

{$R *.dfm}

procedure TForm_Mail.ClearFields;
begin
   Memo1.Lines.Clear;
   listbox1.Items.Clear;
   Label9.caption := '';
   Label10.caption := '';
   Label11.caption := '';
   Label12.caption := '';
   Label13.caption := '';
   Label14.caption := '';
   Label15.caption := '';
   Label16.caption := '';
end;

procedure TForm_Mail.Delete_ActionExecute(Sender: TObject);
begin
  pop3.Delete(FMsgNo);
  listview1.Items.Delete(listview1.ItemIndex);
  FMsgNo := -1;
end;

procedure TForm_Mail.Disconnect_ActionExecute(Sender: TObject);
begin
  Pop3.Disconnect;
end;

procedure TForm_Mail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if pop3.Connected then
     pop3.Disconnect;
  Action := CaFree;
end;

procedure TForm_Mail.FormCreate(Sender: TObject);
begin
  FMsgNo := -1;
  MailIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Mail.ini');
  with MailIni Do
  Begin
    Pop3ServerName := ReadString('Pop3','ServerName','mail.embarcadero.kr');
    Pop3ServerPort := StrToint(ReadString('Pop3','ServerPort','110'));
    Pop3ServerUser :=  ReadString('Pop3','ServerUser','kwk');
    Pop3ServerPassword := ReadString('Pop3','ServerPassword','ibbi0716');
    UserEmail := ReadString('Email','PersonalEmail','kwk@embarcadero.kr');
    SmtpServerName := ReadString('Smtp','ServerName','mail.embarcadero.kr');
    SmtpServerPort := StrToint(ReadString('Smtp','ServerPort','25'));
    SmtpServerUser :=  ReadString('Smtp','ServerUser','kwk');
    SmtpServerPassword := ReadString('Smtp','ServerPassword','ibbi0716');
  End;
end;

procedure TForm_Mail.FormDestroy(Sender: TObject);
begin
FreeAndNil(Mailini);
end;

procedure TForm_Mail.ListView1Click(Sender: TObject);
begin
  FmsgNo := listview1.itemindex + 1;
  Retrieve_ActionExecute(Sender);
end;

procedure TForm_Mail.Purge_ActionExecute(Sender: TObject);
var
  i: Integer;
begin
   for i := listview1.Items.Count - 1 downto 0 do begin
      Application.ProcessMessages;
      Application.ProcessMessages;
      Application.ProcessMessages;
      Application.ProcessMessages;
      pop3.Delete(i);
      listview1.Items.Delete(i);
    end;
    Caption := Application.Title;
    ClearFields;
    FMsgNo := -1;
end;

procedure TForm_Mail.Retrieve_ActionExecute(Sender: TObject);
var
  j:byte;
begin
    pop3.Retrieve(FMsgno, Msg);
    Label9.caption := Msg.From.Address;
    Label10.caption := Msg.Recipients.Items[0].Address;
    Label11.caption := msg.References;
    Label12.caption := Msg.Subject;
    Label13.caption := datetimetostr(Msg.Date);
//    Label14.caption := inttostr(Msg.Priority.TidmessagePriority);
    Label15.caption := Msg.Recipients.Items[0].Address;
    Label16.caption := Msg.Organization;
    Memo1.Lines.Assign(Msg.Body);
    for j := 1 to Msg.MessageParts.Count  do
        if (Msg.MessageParts.Items[j] is TIdAttachment) then
          listbox1.Items.add(TIdAttachment(Msg.MessageParts.Items[j]).Filename);
end;

procedure TForm_Mail.Send_ActionExecute(Sender: TObject);
begin
  Form_MailSend := TForm_MailSend.Create(Application);
  Form_MailSend.Show;
end;

procedure TForm_Mail.Check_ActionExecute(Sender: TObject);
var
  i,j :byte;
  listitem:tlistitem;
begin
  Pop3.Host := Pop3ServerName;
  Pop3.Port :=  Pop3ServerPort;
  Pop3.Username := Pop3ServerUser;
  Pop3.Password := Pop3ServerPassword;
  Pop3.Connect;

  FMsgCount := Pop3.CheckMessages;
  ClearFields;
  if FMsgCount = 0 then
     Raise Exception.Create('서버에 메일이 없습니다');

  for i := 0 to FMsgCount - 1 do
  begin
      pop3.Retrieve(i+1, Msg);
      Listitem := Listview1.Items.add;
      Listitem.Caption := Msg.Subject;
      Listitem.SubItems.Add(Msg.From.Text);
      Listitem.SubItems.Add(datetimetostr(Msg.Date));
      Listitem.SubItems.Add(Msg.UID);
    end;
    pop3.Retrieve(1, Msg);
    Label9.caption := Msg.From.Address;
    Label10.caption := Msg.Recipients.Items[0].Address;
    Label11.caption := msg.References;
    Label12.caption := Msg.Subject;
    Label13.caption := datetimetostr(Msg.Date);
//    Label14.caption := IntToStr(Msg.Priority);
    Label15.caption := Msg.Recipients.Items[0].Address;
    Label16.caption := Msg.Organization;
    Memo1.Lines.Assign(Msg.Body);
    for j := 1 to Msg.MessageParts.Count  do
        if (Msg.MessageParts.Items[j] is TIdAttachment) then
          listbox1.Items.add(TIdAttachment(Msg.MessageParts.Items[j]).Filename);

  end;

end.
