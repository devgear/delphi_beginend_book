unit Uinsa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, ComCtrls, StdCtrls, ExtCtrls, DBCtrls, Mask,
  TeEngine, Series, TeeProcs, Chart, DBChart,dbtables, Word2000, OleServer;

type
  TinsaForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TABSHEET3: TTabSheet;
    TabControl1: TTabControl;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    edit1: TEdit;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Label10: TLabel;
    DBImage1: TDBImage;
    DBRadioGroup1: TDBRadioGroup;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    Series2: TLineSeries;
    ComboBox3: TComboBox;
    RadioGroup1: TRadioGroup;
    Button9: TButton;
    WordApplication1: TWordApplication;
    WordDocument1: TWordDocument;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure edit1Change(Sender: TObject);
    procedure edit1KeyPress(Sender: TObject; var Key: Char);
    procedure TabControl1Change(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure PageControl1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure PageControl1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure PageControl1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PageControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PageControl1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PageControl1StartDrag(Sender: TObject;
      var DragObject: TDragObject);
  private
    FDraging: Boolean;
    FDragPos: TPoint;
    FDragTop: Integer;
    FDragLeft:Integer;
    { Private declarations }
  public
    function add(x,y:integer):integer;
    { Public declarations }
  end;

var
  insaForm: TinsaForm;

implementation

uses bde,Udm;
//7.0 delphi/doc/bde.ini :bde를 사용할때 필요한 구조체,상수 ,변수
{$R *.dfm}
type
  TTabDragObject = class(TBaseDragControlObject)
  private
    PageControl: TPageControl;
    DragImageList: TImageList;
    PageIndex: Integer;
    CurrentWnd: HWnd;
  protected
    procedure WndProc(var Msg: TMessage); override;
    function GetDragCursor(Accepted: Boolean; X, Y: Integer): TCursor; override;
  end;

procedure TTabDragObject.WndProc(var Msg: TMessage);
var
  Wnd: HWnd;
begin
  inherited;

  case Msg.Msg of
  WM_MOUSEMOVE: begin
                  Wnd := WindowFromPoint( Mouse.CursorPos );

                  if Wnd <> CurrentWnd then
                   begin
                     if Wnd <> TWinControl(Control).Handle then
                      DragImageList.HideDragImage;

                     CurrentWnd := Wnd;
                   end;
                end;
  end;
end;

function TTabDragObject.GetDragCursor(Accepted: Boolean; X, Y: Integer): TCursor;
begin
  if Accepted then Result := crArrow
              else Result := crNoDrop;
end;

function TinsaForm.add(x, y: integer): integer;
begin
  result  := x + y;
end;

procedure TinsaForm.Button1Click(Sender: TObject);
begin
  dm.insa.Insert;
end;

procedure TinsaForm.Button2Click(Sender: TObject);
begin
  caption := inttostr(add(2,3));


  if messagedlg('정말 삭제 할래?', mtconfirmation,[mbyes, mbno],0) = mryes then
     try
       dm.insa.Delete;
       DM.INSA.ApplyUpdates(-1);
     except
       on e:EXCEPTION do
          showmessage(e.message);
     end;

end;

procedure TinsaForm.Button3Click(Sender: TObject);
begin
  dm.insa.Cancel;
  dm.INSA.CancelUpdates;
end;

procedure TinsaForm.Button4Click(Sender: TObject);
begin
try
  dm.insa.Post;
  dm.INSA.ApplyUpdates(-1);
except
  on e:exception do
     showmessage(e.message);
end;
// e.errors
// e.errorcount
// e.errors[0].categorycode
// e.errors[0].errorcode :hex로 값을 바꾸면
// e.errors[0].subocde
// e.errors[1].nativeerror :db의 오류코드
// e.errors[0].message

end;

procedure TinsaForm.Button5Click(Sender: TObject);
begin
  dbchart1.Page := 1;
end;

procedure TinsaForm.Button6Click(Sender: TObject);
begin
  dbchart1.PreviousPage;
end;

procedure TinsaForm.Button7Click(Sender: TObject);
begin
  dbchart1.NextPage;
end;

procedure TinsaForm.Button8Click(Sender: TObject);
begin
  dbchart1.Page := dbchart1.NumPages;
end;

procedure TinsaForm.Button9Click(Sender: TObject);
var
 template, newtemplate,documenttype,visible,itemindex:olevariant;
begin
 try
    wordapplication1.Connect;
 except
    raise EXCEPTION.create('word가 설치 안됨');
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

procedure TinsaForm.CheckBox1Click(Sender: TObject);
begin
  dbchart1.View3D := checkbox1.checked;

end;

procedure TinsaForm.ComboBox1Change(Sender: TObject);
begin
  case combobox1.ItemIndex of
    0: begin
       dm.insa.IndexName := 'i_id';
       dm.insaID.Index :=   0;
       dm.insaname.Index :=  1;
       end;
    1: begin
       dm.insa.IndexName := 'i_name';
       dm.insaID.Index := 1;
       dm.insaname.Index := 0;
       end;
    2: dm.insa.IndexName := 'i_dept';
  end;
end;

procedure TinsaForm.ComboBox2Change(Sender: TObject);
begin
  dbchart1.ZoomPercent(strtoint(combobox2.Items[combobox2.ItemIndex]));
end;

procedure TinsaForm.ComboBox3Change(Sender: TObject);
var
  s:tchartseries;
begin
  s := dbchart1.Series[radiogroup1.ItemIndex];
  case combobox3.itemindex of
    0:s.color := clred;
    1:s.color := clblue;
    2:s.color := clyellow;
    3:s.color := clgreen;
    4:s.color := claqua;
  end;
end;

procedure TinsaForm.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
     selectnext(sender as twincontrol,true,true);
end;

procedure TinsaForm.edit1Change(Sender: TObject);
begin
  dm.insa.IndexFieldNames := 'name';
  dm.insa.FindNearest([edit1.Text]);
end;

procedure TinsaForm.edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
    if not dm.insa.FindKey([EDIT1.Text]) then
       Showmessage('그런 사람 없음');
//if not dm.insa.locate('name', edit1.text, [locaseinsensitive,lopartialkey])
end;

procedure TinsaForm.FormActivate(Sender: TObject);
begin
  dm.insaSourceStateChange(dm.insasource);
  dm.insaSourceDataChange(dm.insaSource, dm.insaid );
end;

procedure TinsaForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  savechanges, originalformat,routedocument:olevariant;
begin
  savechanges := wddonotsavechanges;
  originalformat := unassigned;
  routedocument := unassigned;
  wordapplication1.quit(savechanges, originalformat,routedocument);
  wordapplication1.disconnect;

  dm.insaSource.OnStateChange := nil;
  dm.insaSource.OnDataChange := nil;
  action := cafree;
end;

procedure TinsaForm.FormCreate(Sender: TObject);
var
  t:TTabsheet;
begin
  t := ttabsheet.Create(pagecontrol1);
  t.Caption := '기타';
  t.Pagecontrol := Pagecontrol1;
  Pagecontrol1.ActivePage := T;
  dm.insaSource.OnStateChange := dm.insaSourceStateChange;
  dm.insaSource.OnDataChange := dm.insaSourceDataChange;
end;

procedure TinsaForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
     selectnext(activecontrol as twincontrol, true,true);
end;

procedure TinsaForm.PageControl1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  HitTests: THitTests;
  SourceIndex, DestIndex: Integer;
begin
  HitTests := TPageControl(Sender).GetHitTestInfoAt( X, Y );
  if ( htOnItem in HitTests ) and ( Source is TTabDragObject ) and ( TTabDragObject(Source).PageControl = Sender ) then
   begin
     SourceIndex := TTabDragObject(Source).PageIndex;
     DestIndex := TPageControl(Sender).IndexOfTabAt( X, Y );

     TPageControl(Sender).Pages[ SourceIndex ].PageIndex := DestIndex;
   end;

end;

procedure TinsaForm.PageControl1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  HitTests: THitTests;
  DestIndex: Integer;
begin
  HitTests := TPageControl(Sender).GetHitTestInfoAt( X, Y );
  DestIndex := TPageControl(Sender).IndexOfTabAt( X, Y );
  Accept :=  ( htOnItem in HitTests ) and
             ( Source is TTabDragObject ) and
             ( TTabDragObject(Source).PageControl = Sender ) and
             ( TTabDragObject(Source).PageIndex <> TPageControl(Sender).Pages[ DestIndex ].PageIndex );
end;

procedure TinsaForm.PageControl1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDraging := Button = mbLeft;
  if FDraging then
  FDragPos := Mouse.CursorPos;
end;
procedure TinsaForm.PageControl1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  Bitmap: TBitmap;
  Rect: TRect;
  DC: HDC;
begin
  if FDraging and ( TPageControl(Sender).ActivePage <> nil ) then
   begin
     if ( Abs( FDragPos.X -  Mouse.CursorPos.X ) >= 5 ) or ( Abs( FDragPos.Y -  Mouse.CursorPos.Y ) >= 5 ) then
      begin
        TControl(Sender).BeginDrag( False );

        Bitmap := TBitmap.Create;
        Bitmap.PixelFormat := pf32Bit;

        Rect := TPageControl(Sender).TabRect( TPageControl(Sender).ActivePageIndex );

        InflateRect( Rect, 2, 2 );
        FDragTop := Rect.Top;
        FDragLeft := X - Rect.Left;
        Bitmap.Width := Rect.Right - Rect.Left;
        Bitmap.Height := Rect.Bottom - Rect.Top;

        DC := GetDC( TWinControl(Sender).Handle );
        BitBlt( Bitmap.Canvas.Handle, 0, 0, Bitmap.Width, Bitmap.Height, DC, Rect.Left, Rect.Top, SRCCOPY );
        ReleaseDC( TWinControl(Sender).Handle, DC );

//        Dark( Bitmap );
        ShowCursor( True );
      end;

end;
end;
procedure TinsaForm.PageControl1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then FDraging := False;
end;

procedure TinsaForm.PageControl1StartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  DragObject := TTabDragObject.Create( TPageControl(Sender) );
  TTabDragObject(DragObject).PageControl := TPageControl(Sender);
  TTabDragObject(DragObject).PageIndex := TPageControl(Sender).ActivePageIndex;
end;

procedure Dark(Bitmap: TBitmap);
type
  PPixels = ^TPixels;
  TPixels = array[0..0] of TRGBQuad;
var
  Pixels: PPixels;
  Col, Row: Integer;
procedure DarkByte(var B: Byte);
  const
    DarkValue = 50;
  begin
    if B > DarkValue then Dec( B, DarkValue )
                     else B := 0;
  end;
begin
  for Row := 0 to Bitmap.Height - 1 do
   begin
     Pixels := Bitmap.ScanLine[ Row ];
     for Col := 0 to Bitmap.Width - 1 do
      begin
        DarkByte( Pixels^[ Col ].rgbRed );
        DarkByte( Pixels^[ Col ].rgbGreen );
        DarkByte( Pixels^[ Col ].rgbBlue );
      end;
   end;
end;


procedure TinsaForm.RadioGroup1Click(Sender: TObject);
begin
  case radiogroup1.itemindex of
    0:begin
      series1.Visible := true;
      series2.Visible := false;
      end;
    1:begin
      series1.Visible := false;
      series2.Visible := true;
      end;
  end;
end;

procedure TinsaForm.SpeedButton1Click(Sender: TObject);
begin
  DM.insa.First;
end;
procedure TinsaForm.SpeedButton2Click(Sender: TObject);
begin
  if not dm.insa.eof then
     dm.insa.next;

end;
procedure TinsaForm.SpeedButton3Click(Sender: TObject);
begin
  if not dm.insa.bof then
     dm.insa.Prior;
end;

procedure TinsaForm.SpeedButton4Click(Sender: TObject);
begin
  dm.insa.Last;
end;

procedure TinsaForm.TabControl1Change(Sender: TObject);
begin
  if tabcontrol1.TabIndex = 0 then
   dm.insa.Filtered := false
  else
  begin
   dm.insa.Filtered := true;
   dm.insa.Filter :=
   'class = ' + '''' + tabcontrol1.Tabs[tabcontrol1.TabIndex]
    +'''';
  end;
end;

end.
