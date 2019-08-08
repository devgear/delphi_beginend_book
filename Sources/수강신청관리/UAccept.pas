unit UAccept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm_Accept = class(TForm)
    GroupBox1: TGroupBox;
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
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label13: TLabel;
    DBGrid1: TDBGrid;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    BalloonHint1: TBalloonHint;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Accept: TForm_Accept;

implementation

uses Udm;

{$R *.dfm}

procedure TForm_Accept.Button1Click(Sender: TObject);
begin
  If Edit1.Text = '' then
  Begin
     Edit1.SetFocus;
     Raise Exception.Create('과목코드를 반드시 입력하십시오');
  End;

  If Edit2.Text = '' then
  Begin
     Edit2.SetFocus;
     Raise Exception.Create('신청인을  반드시 입력하십시오');
 End;

  If Edit3.Text = '' then
  Begin
     Edit3.SetFocus;
     Raise Exception.Create('주민등록번호를  반드시 입력하십시오');
  End;

  if Button1.Caption = '입력' then
  Begin
     Dm.CustTemp.Insert;
     Dm.CustTemp.FieldByName('regdate').asdatetime := now;
  End
  Else
     Dm.CustTemp.Edit;
  With Dm.CustTemp Do
  Begin
    FieldByName('ctcode').AsString := Edit1.Text;
    FieldByName('name').AsString := Edit2.Text;
    FieldByName('pno').AsString := Edit3.Text;
    FieldByName('addr').AsString :=Edit4.Text;
    FieldByName('tel').AsString := Edit5.Text;
    FieldByName('company').AsString := Edit6.Text;
    FieldByName('cCode').AsString := Edit7.Text;
    FieldByName('cBoss').AsString := Edit8.Text;
    FieldByName('cTel').AsString := Edit9.Text;
    FieldByName('cAddr').AsString := Edit10.Text;
    FieldByName('cFax').AsString := Edit11.Text;
    FieldByName('Email').AsString := Edit12.Text;
    Try
      Post;
      ApplyUpdates(-1);
      Showmessage(Format('%s 완료되었습니다',[button1.Caption]));
    Except
      on e:Exception do
         ShowMessage(e.Message);
    End;
    Refresh;
  End;
end;

procedure TForm_Accept.Button2Click(Sender: TObject);
begin
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  Edit5.Text := '';
  Edit6.Text := '';
  Edit7.Text := '';
  Edit8.Text := '';
  Edit9.Text := '';
  Edit10.Text := '';
  Edit11.Text := '';
  Edit12.Text := '';
  Edit1.SetFocus;
end;

procedure TForm_Accept.Button3Click(Sender: TObject);
var
  cno:String;
begin
  DM.SQLConnection1.StartTransaction(udm.TD);
try
  cno := dm.Reg_Customer(dm.customer,
                         dm.CustTemp.FieldByName('name').AsString,
                         dm.CustTemp.FieldByName('pno').AsString,
                         dm.CustTemp.FieldByName('tel').AsString,
                         dm.CustTemp.FieldByName('addr').AsString,
                         dm.CustTemp.FieldByName('company').AsString,
                         dm.CustTemp.FieldByName('cCode').AsString,
                         dm.CustTemp.FieldByName('cBoss').AsString,
                         dm.CustTemp.FieldByName('cAddr').AsString,
                         dm.CustTemp.FieldByName('cTel').AsString,
                         dm.CustTemp.FieldByName('cFax').AsString,
                         dm.CustTemp.FieldByName('Email').AsString);

  dm.Reg_Order(dm.orders,dm.CustTemp.FieldByName('ctcode').AsString,cno);
  dm.CustTemp.Delete;
  dm.CustTemp.ApplyUpdates(-1);
  DM.SQLConnection1.Commit(udm.td);
  showmessage('접수처리 완료');
Except
  DM.SQLConnection1.Rollback(udm.TD);
End;

end;

procedure TForm_Accept.Button4Click(Sender: TObject);
begin
  Dm.CustTemp.Delete;
  Dm.CustTemp.ApplyUpdates(-1);
end;

procedure TForm_Accept.DBGrid1DblClick(Sender: TObject);
begin
 GroupBox1.Caption := '수강신청을 수정하십시요';
 Button1.Caption := '수정';
 Edit1.Text := dm.CustTemp.FieldByName('ctcode').AsString;
 Edit2.Text := dm.CustTemp.FieldByName('name').AsString;
 Edit3.Text := dm.CustTemp.FieldByName('pno').AsString;
 Edit4.Text := dm.CustTemp.FieldByName('addr').AsString;
 Edit5.Text := dm.CustTemp.FieldByName('tel').AsString;
 Edit6.Text := dm.CustTemp.FieldByName('company').AsString;
 Edit7.Text := dm.CustTemp.FieldByName('cCode').AsString;
 Edit8.Text := dm.CustTemp.FieldByName('cBoss').AsString;
 Edit9.Text := dm.CustTemp.FieldByName('cTel').AsString;
 Edit10.Text := dm.CustTemp.FieldByName('cAddr').AsString;
 Edit11.Text := dm.CustTemp.FieldByName('cFax').AsString;
 Edit12.Text := dm.CustTemp.FieldByName('Email').AsString;
end;

procedure TForm_Accept.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
     SelectNext(Sender As TWincontrol, True,True);
end;

procedure TForm_Accept.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := CaFree;
end;

end.
