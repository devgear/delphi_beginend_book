unit uClientMemberForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBClient;

type
  TClientMemberForm = class(TForm)
    GroupBox6: TGroupBox;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    MemberData: TClientDataSet;
    MemberSource: TDataSource;
    MemberDataid: TStringField;
    MemberDatapassword: TStringField;
    MemberDataname: TStringField;
    MemberDataresident_num: TStringField;
    MemberDataaddress: TStringField;
    MemberDatazip_code: TStringField;
    MemberDatatel: TStringField;
    MemberDataemail: TStringField;
    MemberDatamileage: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientMemberForm: TClientMemberForm;

implementation

uses uClientModuleUnit;

{$R *.dfm}

procedure TClientMemberForm.BitBtn1Click(Sender: TObject);
begin
  MemberData.First;
end;

procedure TClientMemberForm.BitBtn2Click(Sender: TObject);
begin
  if not MemberData.Bof then
    MemberData.Prior;
end;

procedure TClientMemberForm.BitBtn3Click(Sender: TObject);
begin
  if not MemberData.Eof then
    MemberData.Next;
end;

procedure TClientMemberForm.BitBtn4Click(Sender: TObject);
begin
  MemberData.Last;
end;

procedure TClientMemberForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
