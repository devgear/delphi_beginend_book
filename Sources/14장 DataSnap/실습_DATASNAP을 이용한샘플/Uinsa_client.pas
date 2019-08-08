unit Uinsa_client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Comctrls, Buttons, StdCtrls, DBCtrls, ExtCtrls, Mask,
  ExtDlgs, TeEngine, Series, TeeProcs, Chart, DBChart, Spin, WordXP, OleServer,
  Word2000;

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
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBImage1: TDBImage;
    DBRadioGroup1: TDBRadioGroup;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    DBEdit4: TDBEdit;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    CheckBox1: TCheckBox;
    SpinButton1: TSpinButton;
    ComboBox2: TComboBox;
    Label11: TLabel;
    RadioGroup1: TRadioGroup;
    Series2: TLineSeries;
    Button9: TButton;
    WordApplication1: TWordApplication;
    WordDocument1: TWordDocument;
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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpinButton1DownClick(Sender: TObject);
    procedure SpinButton1UpClick(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InsaForm: TInsaForm;

implementation

uses UDM_client;
Var
  t:TTabSheet;
  s:tchartseries;
{$R *.dfm}

procedure TInsaForm.Button1Click(Sender: TObject);
begin
  Dm.Insa.Insert;
end;

procedure TInsaForm.Button2Click(Sender: TObject);
begin
  if messagedlg('정말 삭제 할래 ?',mtconfirmation,[mbyes,mbno],0) = mryes  then
  Begin
     try
       Dm.Insa.Delete;
       Dm.insa.ApplyUpdates(-1);
     except
       showmessage('삭제 오류');
     end;
  End;
end;

procedure TInsaForm.Button3Click(Sender: TObject);
begin
  dm.Insa.Cancel;
end;

procedure TInsaForm.Button4Click(Sender: TObject);
begin
  try
    Dm.Insa.Post;
    Dm.insa.ApplyUpdates(-1);
  except
    showmessage('등록/편집오류');
  end;
end;

procedure TInsaForm.Button5Click(Sender: TObject);
begin
  DbChart1.Page := 1;
end;

procedure TInsaForm.Button6Click(Sender: TObject);
begin
  DbChart1.PreviousPage;
end;

procedure TInsaForm.Button7Click(Sender: TObject);
begin
  DbChart1.NextPage;
end;

procedure TInsaForm.Button8Click(Sender: TObject);
begin
 DbChart1.Page := DbChart1.NumPages;
end;

procedure TInsaForm.Button9Click(Sender: TObject);
var
 template, newtemplate,documenttype,visible,itemindex:olevariant;
begin

 try
    wordapplication1.connect;
 except
    raise einput.create('word가 설치 안됨');
 end;

 try
    wordapplication1.visible := true;
    wordapplication1.caption := '사원 이력서';
    itemindex := 1;
    template := emptyparam;
    newtemplate := false;
    documenttype := wdnewblankdocument;
    visible := true;
    wordapplication1.documents.add(template,newtemplate,documenttype,visible);
    worddocument1.connectto(wordapplication1.documents.item(itemindex));
//   dbimage1.copytoclipboard;
//    worddocument1.sentences.last.paste;
    worddocument1.range.insertafter(#13);
    worddocument1.range.insertafter('이    름 :' + dm.insaname.value + #13);
    worddocument1.range.insertafter('직    급 :' + dm.insaclass.value + #13);
    worddocument1.range.insertafter('나    이 :' + dm.insaage.asstring + #13);
    worddocument1.range.insertafter('부서코드 :' + dm.insadept_code.value + #13);
    worddocument1.range.insertafter('입사일자 :' + dm.insaipsa_date.asstring + #13);
    worddocument1.range.insertafter('급    여 :' + dm.insasalary.asstring + #13);
   except
      on e:exception do
      begin
        showmessage(e.message);
        wordapplication1.disconnect;
      end;
   end;
end;

procedure TInsaForm.CheckBox1Click(Sender: TObject);
begin
   DbChart1.View3D := CheckBox1.Checked;
end;

procedure TInsaForm.ComboBox1Change(Sender: TObject);
begin
  case Combobox1.ItemIndex of
    0: Begin
       dm.INSA.IndexName := 'i_id';
       Dm.INSAId.Index := 0;
       Dm.INSAName.Index := 1;
       End;
    1: Begin
       dm.INSA.IndexName := 'i_name';
       Dm.INSAId.Index := 1;
       Dm.INSAName.Index := 0;
       End;
    2: dm.INSA.IndexName := 'i_dept';
  end;
end;

procedure TInsaForm.ComboBox2Change(Sender: TObject);
begin
  s := dbchart1.Series[radiogroup1.ItemIndex];
  case Combobox2.ItemIndex of
    0: s.Color := clred;
    1: s.Color := clyellow;
    2: s.Color := clgreen;
    3: s.color := clblue;
    4: s.Color := claqua;
  end;
end;

procedure TInsaForm.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
     SelectNext(Sender as Twincontrol,True,True);
end;

procedure TInsaForm.Edit1Change(Sender: TObject);
begin
  DM.INSA.IndexFieldNames := 'NAME';
  dm.INSA.FindNearest([Edit1.text]);
end;

procedure TInsaForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
     if not dm.INSA.FindKey([Edit1.Text]) then
        ShowMessage('그럼 사람 없음');
// dm.insa.locate('name', edit1.text,[locaseinsensitive, lopartialkey]);
end;

procedure TInsaForm.FormActivate(Sender: TObject);
begin
  dm.INSASourceStateChange(dm.INSASource);
  Dm.INSASourceDataChange(dm.INSASource, dm.insaid);

end;

procedure TInsaForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  savechanges, originalformat,routedocument:olevariant;
begin
  savechanges := wddonotsavechanges;
  originalformat := unassigned;
  routedocument := unassigned;
  wordapplication1.quit(savechanges, originalformat,routedocument);
  wordapplication1.disconnect;

  dm.INSASource.OnStateChange := nil;
  DM.INSASource.OnDataChange := nil;
  Action := cafree;
end;

procedure TInsaForm.FormCreate(Sender: TObject);
begin
   t := TTabSheet.Create(pagecontrol1);
   t.PageControl := pagecontrol1;
   t.caption := '기타';
   PageControl1.ActivePage := T;
   dm.INSASource.OnStateChange := dm.INSASourceStateChange;
   DM.INSASource.OnDataChange := Dm.INSASourceDataChange;
end;

procedure TInsaForm.Label10Click(Sender: TObject);
begin
  if OpenPictureDialog1.execute then
     DbImage1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TInsaForm.RadioGroup1Click(Sender: TObject);
begin
  case radiogroup1.ItemIndex of
    0: begin
       series1.Visible := true;
       series2.Visible := false;
       end;
    1: begin
       series1.Visible := false;
       series2.Visible := true;
       end;
  end;
end;

procedure TInsaForm.SpeedButton1Click(Sender: TObject);
begin
  Dm.INSA.First;
end;
procedure TInsaForm.SpeedButton2Click(Sender: TObject);
begin
  if not dm.INSA.Bof  then
     Dm.INSA.Prior;
end;
procedure TInsaForm.SpeedButton3Click(Sender: TObject);
begin
  if Not Dm.INSA.Eof then
     Dm.INSA.Next;
end;

procedure TInsaForm.SpeedButton4Click(Sender: TObject);
begin
   Dm.INSA.Last;
end;

procedure TInsaForm.SpinButton1DownClick(Sender: TObject);
begin
  Dbchart1.ZoomPercent(75);
end;

procedure TInsaForm.SpinButton1UpClick(Sender: TObject);
begin
  dbchart1.ZoomPercent(115);
end;

procedure TInsaForm.TabControl1Change(Sender: TObject);
begin
  if tabcontrol1.TabIndex = 0 then
     Dm.INSA.Filtered := False
  else
  Begin
    Dm.INSA.Filtered := True;
    Dm.INSA.Filter :=
    'Class = ' + '''' +
    TabControl1.Tabs[TabControl1.TabIndex] + '''';
  End;
end;

end.
