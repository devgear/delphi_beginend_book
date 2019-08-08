unit UDept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, DB, DBTables, Excel2000,
  OleServer, StdCtrls;

type
  TDeptForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    tot_Query: TQuery;
    StringGrid1: TStringGrid;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Button1: TButton;
    Button2: TButton;
    tabsheet1: TTabSheet;
    DBGrid2: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
  xWBATWorksheet = -4167;
var
  DeptForm: TDeptForm;
  Excel,V :Variant;
  Id:Integer;

implementation

uses Udm,ComObj;

{$R *.dfm}

procedure TDeptForm.Button1Click(Sender: TObject);
var
  i :Integer;
begin
  ExcelApplication1.Connect;
  Id := 1;
  ExcelApplication1.Visible[1] := True;
  ExcelWorkbook1.ConnectTo(ExcelApplication1.Workbooks.Add(xlWBATWorksheet,Id));
  ExcelWorksheet1.ConnectTo(ExcelWorkbook1.Worksheets[1]as _Worksheet);
  ExcelWorksheet1.Name := '컴포넌트를 이용한 엑셀';
  try
     ExcelApplication1.ScreenUpdating[Id] := False;
     for i:=0 to stringgrid1.rowcount do
     begin
     ExcelWorksheet1.cells.Item[i+1,1].Value := stringgrid1.Cells[0,i];
     ExcelWorksheet1.cells.Item[i+1,2].Value := stringgrid1.Cells[1,i];
     ExcelWorksheet1.cells.Item[i+1,3].Value := stringgrid1.Cells[2,i];
     end;
  finally
     ExcelApplication1.ScreenUpdating[Id] := True;
  end;
end;

procedure TDeptForm.Button2Click(Sender: TObject);
var
  i:Integer;
begin
  V := CreateOleObject('Excel.Application');
  V.Visible := True;
  V.Workbooks.Add[xWBATWorksheet];

  for i:=0 to StringGrid1.Rowcount do
  begin
   v.Cells[i+1,1].Formula := StringGrid1.Cells[0,i];
   v.Cells[i+1,2].Formula := StringGrid1.Cells[1,i];
   v.Cells[i+1,3].Formula := StringGrid1.Cells[2,i];
  end;
end;

procedure TDeptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not VarIsEmpty(V)then
  begin
    V.DisplayAlerts := False;
    V.Quit;
  end;
  ExcelApplication1.Disconnect;
  ExcelWorkbook1.Disconnect;
  ExcelWorksheet1.Disconnect;
  Action := caFree;
end;

procedure TDeptForm.FormCreate(Sender: TObject);
var
 i:byte;
begin
 with stringgrid1 do
 begin
   rowcount := dm.dept.RecordCount + 2;
   cells[0,0] := '부서명';
   cells[1,0] := '과  명';
   cells[2,0] := '인원수';
   for i := 1 to dm.dept.RecordCount do
   begin
      cells[0,i] := '';
      cells[1,i] := '';
      cells[2,i] := '';
   end;
   dm.dept.First;
   for i := 1 to dm.dept.RecordCount do
   begin
      cells[0,i] := dm.dept.FieldByName('dept').AsString;
      cells[1,i] := dm.dept.FieldByName('section').AsString;
      tot_query.Close;
      tot_query.params[0].AsString :=
      dm.dept.FieldByName('code').AsString;
      tot_query.open;
      cells[2,i] := tot_query.FieldByName('total').AsString;
      dm.dept.Next;
   end;
   cells[0,i] := '총인원수';
   tot_query.Close;
   tot_query.params[0].AsString := '%';
   tot_query.open;
   cells[2,i] := tot_query.FieldByName('total').AsString;
 end;
end;

procedure TDeptForm.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  pos:integer;
  oldalign :word;
  s:string;
begin
  s := stringgrid1.Cells[acol,arow];
  with stringgrid1.canvas do
  begin
    fillrect(rect);

    if arow = 0 then
    begin
       font.Size := font.Size + 4;
       font.Color := clblue;
       brush.Color := clyellow;
    end;

    if (ACol = 2) and (arow <>0)then
    begin
      font.Color := clred;
      font.Size := font.Size + 4;
      s := s + '명';
      oldalign := settextalign(handle, ta_right);
      textrect(rect, rect.right, rect.Top+3, s);
      settextalign(handle, oldalign);
    end
    else
    begin
      pos := ((rect.right - rect.Left) - textwidth(s)) div 2;
      textrect(rect, rect.Left+pos, rect.Top+3, s);
    end;
  end;
end;

end.
