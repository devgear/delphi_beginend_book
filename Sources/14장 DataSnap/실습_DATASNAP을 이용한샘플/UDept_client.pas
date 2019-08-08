unit UDept_client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, ExtCtrls, DBCtrls, DB, DBTables, FMTBcd,
  SqlExpr, StdCtrls,COMOBJ;

type
  TDeptForm = class(TForm)
    DBGrid1: TDBGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBNavigator1: TDBNavigator;
    DBGrid3: TDBGrid;
    DBGrid2: TDBGrid;
    StringGrid1: TStringGrid;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    SqlServerMethod1: TSqlServerMethod;
    SqlServerMethod2: TSqlServerMethod;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeptForm: TDeptForm;

implementation

uses Udm_client, Uclientclass;
Var
  v:variant;
  demo : TServerMethods1Client;
{$R *.dfm}

procedure TDeptForm.Button1Click(Sender: TObject);
begin
  if edit1.Text = '' then
     raise einput.Create('부서코드 입력 꼭 ');

  if dm.Dept.Locate('code', edit1.Text,[])  then
     raise einput.Create('이미 등록된 부서코드입니다');

  with SqlServerMethod2 do
  begin
      ParamByname('pCODE').asString := Edit1.Text;
      ParamByname('pDept').asString := Edit2.Text;
      ParamByname('pSection').asString := Edit3.Text;
      ExecuteMethod;
  end;

  dm.Dept.Refresh;
end;

procedure TDeptForm.Button2Click(Sender: TObject);
var
  i:byte;
begin
  v := CreateOleObject('Excel.application');
  v.workbooks.add;
  v.visible := true;
  for i:=0 to stringgrid1.rowcount do
  begin
   v.cells[i+1,1].formula := stringgrid1.Cells[0,i];
   v.cells[i+1,2].formula := stringgrid1.Cells[1,i];
   v.cells[i+1,3].formula := stringgrid1.Cells[2,i];
  end;
end;

procedure TDeptForm.Edit1Change(Sender: TObject);
begin
  if (sender as tedit).MaxLength = length((sender as tedit).Text) then
     selectnext(sender as twincontrol, true, true);
end;

procedure TDeptForm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case  key of
   vk_return : selectnext(sender as twincontrol, true, true);
   vk_up :selectnext(sender as twincontrol, false, true);
   vk_down:selectnext(sender as twincontrol, true, true);
  end;
end;

procedure TDeptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := CaFree;
end;

procedure TDeptForm.FormCreate(Sender: TObject);
var
  i:Byte;
begin
  with StringGrid1 do
  Begin
    Rowcount  := Dm.Dept.RecordCount + 2;
    Cells[0,0] := '부서명';
    Cells[1,0] := '과  명';
    Cells[2,0] := '인원수';
    for i := 1 to Dm.Dept.RecordCount do
    Begin
      Cells[0,i] := '';
      Cells[1,i] := '';
      Cells[2,i] := '';
    End;
    DM.Dept.First;
    for i := 1 to Dm.Dept.RecordCount do
    Begin
      Cells[0,i] := Dm.Dept.FieldByName('Dept').AsString;
      Cells[1,i] := Dm.Dept.FieldByName('Section').AsString;
      sqlservermethod1.Close;
      sqlservermethod1.params[0].asstring := Dm.Dept.FieldByName('CODE').AsString;
      sqlservermethod1.executemethod;
      Cells[2,i] := sqlservermethod1.params[1].asstring;
      Dm.Dept.Next;
    End;
    cells[0,i] := '총인원수';
    sqlservermethod1.Close;
    sqlservermethod1.params[0].asstring := '%';
    sqlservermethod1.executemethod;
    Cells[2,i] := sqlservermethod1.params[1].asstring;
  End;
end;

procedure TDeptForm.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s :string;
  pos:integer;
  oldalign:word;
begin
  s := stringgrid1.Cells[acol,arow];
  with stringgrid1.Canvas do
  begin
    Fillrect(RECT);
    if arow = 0 then
    begin
       Font.Color := clBlue;
       Font.Size := Font.Size + 4;
    end;
    if (acol = 2) and (arow <> 0) then
    BEGIN
       Font.Color := clRed;
       Font.Size := Font.Size + 4;
       s := s + '명';
       OLDalign := SetTextAlign(Handle, ta_right);
       TextRect(Rect,Rect.Right, Rect.Top +3, s);
       SetTextAlign(Handle, oldalign);
    end
    else
    begin
       pos := ((rect.right  - rect.Left) - textwidth(s)) div 2;
       TextRect(Rect,Rect.left+pos, Rect.Top +3, s);

    end;
  end;
end;

end.
