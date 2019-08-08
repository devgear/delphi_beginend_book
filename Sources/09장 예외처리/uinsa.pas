unit uinsa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, Buttons, StdCtrls, ExtDlgs, ExtCtrls,
  DBCtrls, Mask,db, TeEngine, Series, TeeProcs, Chart, DBChart,dbtables,
  Word2000, OleServer, WordXP, Spin, GestureMgr, DBActns, ActnList,
  PlatformDefaultStyleActnCtrls, ActnMan;

type
  TInsaForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabControl1: TTabControl;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    dbedit2:tdbedit;
    dbedit3:tdbedit;
    dbedit4:tdbedit;
    dbedit5:tdbedit;
    dbimage1:tdbimage;
    dbcombobox1:tdbcombobox;
    dblookupcombobox1:tdblookupcombobox;
    dbradiogroup1:tdbradiogroup;
    button1:tbutton;
    button2:tbutton;
    button3:tbutton;
    button4:tbutton;
    DBGrid1: TDBGrid;
    OpenPictureDialog1: TOpenPictureDialog;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    CheckBox1: TCheckBox;
    DBEdit1: TDBEdit;
    SpinButton1: TSpinButton;
    RadioGroup1: TRadioGroup;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    Series2: TLineSeries;
    ComboBox2: TComboBox;
    Label11: TLabel;
    ActionManager1: TActionManager;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    GestureManager1: TGestureManager;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure TabControl1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpinButton1DownClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InsaForm: TInsaForm;

implementation

uses udm;
var
 t:TTabSheet;
 S:TChartSeries;
{$R *.dfm}

procedure TInsaForm.Button1Click(Sender: TObject);
begin
  Dm.Insa.Insert;
end;
procedure TInsaForm.Button2Click(Sender: TObject);
begin
   if MessageDlg('삭제할래 ?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
      Dm.Insa.Delete;
end;
procedure TInsaForm.Button3Click(Sender: TObject);
begin
  Dm.Insa.Cancel;
end;
procedure TInsaForm.Button4Click(Sender: TObject);
begin
   Dm.Insa.Post;
end;
procedure TInsaForm.Button5Click(Sender: TObject);
begin
  DBChart1.Page := 1;
end;
procedure TInsaForm.Button6Click(Sender: TObject);
begin
  DBChart1.PreviousPage;
end;
procedure TInsaForm.Button7Click(Sender: TObject);
begin
  DBChart1.NextPage;
end;
procedure TInsaForm.Button8Click(Sender: TObject);
begin
  DBChart1.Page := DBChart1.NumPages;
end;

procedure TInsaForm.CheckBox1Click(Sender: TObject);
begin
   DBChart1.View3D := CheckBox1.Checked;
end;

procedure TInsaForm.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
   0: Dm.Insa.IndexName := 'i_id';
   1: Dm.Insa.Indexname := 'i_name';
   2: Dm.Insa.IndexName := 'i_dept';
  end;
end;

procedure TInsaForm.ComboBox2Change(Sender: TObject);
begin
  S := DBChart1.Series[RadioGroup1.ItemIndex];
  case ComboBox2.Itemindex of
    0:S.Color := clRed;
    1:S.Color := clBlue;
    2:S.Color := clYellow;
    3:S.Color := clGreen;
    4:S.Color := clAqua;
  end;
end;

procedure TInsaForm.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = vk_Return then
      SelectNext(Sender as TWincontrol, True, True);
end;

procedure TInsaForm.Edit1Change(Sender: TObject);
begin
  Dm.Insa.IndexFieldNames := 'Name';
  Dm.Insa.FindNearest([Edit1.Text]);
end;

procedure TInsaForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     if not Dm.Insa.FindKey([Edit1.Text]) then
        ShowMessage('그런 사람 없음');

end;

procedure TInsaForm.FormActivate(Sender: TObject);
begin
 Dm.InsaSourceDataChange(Dm.InsaSource,TField(Dm.InsaId));
 Dm.InsaSourcestatechange(Dm.InsaSource);
end;

procedure TInsaForm.FormClose(Sender: TObject; var Action: TCloseAction);
Begin
  Dm.InsaSource.OnDataChange := nil;
  Dm.InsaSource.OnstateChange := nil;
  Action := caFree;
end;

procedure TInsaForm.FormCreate(Sender: TObject);
begin

 t := TTabSheet.Create(PageControl1);
 t.Caption := '기타';
 t.PageControl := PageControl1;
 PageControl1.ActivePage := t;
 Dm.insaSource.OnDataChange := Dm.InsaSourceDataChange;
 Dm.insaSource.OnStateChange := Dm.InsaSourceStateChange;

end;

procedure TInsaForm.Label10Click(Sender: TObject);
begin
 if OpenPictureDialog1.Execute then
    DBImage1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

end;

procedure TInsaForm.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
     Series1.Visible := True;
     Series2.Visible := False;
  end
  else
  begin
     Series2.Visible := True;
     Series1.Visible := False;
  end;

end;

procedure TInsaForm.SpeedButton1Click(Sender: TObject);
begin
  Dm.Insa.First;
end;

procedure TInsaForm.SpeedButton2Click(Sender: TObject);
begin
  if not Dm.Insa.Bof  then
     Dm.Insa.Prior;
end;

procedure TInsaForm.SpeedButton3Click(Sender: TObject);
begin
  if not Dm.Insa.Eof then
     Dm.Insa.Next;
end;

procedure TInsaForm.SpeedButton4Click(Sender: TObject);
begin
    Dm.Insa.Last;
end;

procedure TInsaForm.SpeedButton6Click(Sender: TObject);
begin
  DBChart1.ZoomPercent(115);  //115% 확대
end;

procedure TInsaForm.SpinButton1DownClick(Sender: TObject);
begin
   DBChart1.ZoomPercent(75);  // 75% 축소
end;

procedure TInsaForm.TabControl1Change(Sender: TObject);
begin
  if Tabcontrol1.TabIndex = 0  then
     Dm.Insa.Filtered := False
  else
  begin
     Dm.Insa.Filtered := True;
     Dm.Insa.Filter :=
      'class = ' + '''' + Tabcontrol1.Tabs[Tabcontrol1.TabIndex] + '''';
  end;

end;

end.
