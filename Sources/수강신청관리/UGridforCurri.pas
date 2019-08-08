unit UGridforCurri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, ComCtrls, DBCtrls, Spin;

type
  TForm_GridforCurri = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button1: TButton;
    Button2: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    DateTimePicker3: TDateTimePicker;
    SpinEdit1: TSpinEdit;
    procedure DateTimePicker1UserInput(Sender: TObject;
      const UserString: string; var DateAndTime: TDateTime;
      var AllowChange: Boolean);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_GridforCurri: TForm_GridforCurri;

implementation

uses Udm;

{$R *.dfm}

procedure TForm_GridforCurri.Button1Click(Sender: TObject);
var
  s:string;
  s1:string;
  s2:string;
  i :integer;
begin
  Dm.Query_CurriList.Last;
  s := dm.Query_CurriList.FieldByname('ctcode').asstring;
  s1 := copy(s,3);
  i := strtoint(s1);
  i := i + 1;
  With Dm.Curritb Do
  Begin
    Insert;
    FieldByName('Ctcode').Asstring := dblookupcombobox1.KeyValue + formatfloat('000',i);
    FieldByName('Start').asdatetime := datetimepicker3.Date;
    FieldByName('Limit').asinteger := strtoint(edit5.text);
    FieldByName('Pcount').asinteger := 0;
    FieldByName('During').asinteger := spinedit1.value;
    FieldByName('Teacher').asstring := edit4.text;
    FieldByName('Price').asinteger := strtoint(edit6.text);
    FieldByName('Room').asinteger := strtoint(edit3.text);
    Post;
    ApplyUpdates(-1);
  End;
end;

procedure TForm_GridforCurri.Button2Click(Sender: TObject);
begin
  datetimepicker3.date := date;
  spinedit1.value := 4;
  edit3.Text := '';
  edit4.Text := '';
  edit5.Text := '';
  edit6.Text := '';
end;

procedure TForm_GridforCurri.DateTimePicker1Change(Sender: TObject);
begin
//  if (sender as TDateTimePicker).Date > Now then
//     raise Exception.Create('선택한 날자가 오늘 날자보다 클수없습니다');
  if DateTimePicker1.Date > DateTimePicker2.Date then
     raise Exception.Create('From 일자가 To 일자보다 큽니다 ');
end;

procedure TForm_GridforCurri.DateTimePicker1UserInput(Sender: TObject;
  const UserString: string; var DateAndTime: TDateTime;
  var AllowChange: Boolean);
begin
  DateAndTime := StrtoDateTime(UserString);
  AllowChange := True;
end;

procedure TForm_GridforCurri.DBLookupComboBox1CloseUp(Sender: TObject);
begin
  Dm.query_CurriList.Close;
  Dm.query_CurriList.DataSet.ParamByName('p_code').AsString :=
  DbLookupCombobox1.KeyValue + '%';
  Dm.query_CurriList.DataSet.ParamByName('p_date1').AsDate := trunc(datetimepicker1.Date);
  Dm.query_CurriList.DataSet.ParamByName('p_date2').AsDate := trunc(datetimepicker2.Date);
  Dm.query_CurriList.Open;
end;

procedure TForm_GridforCurri.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
