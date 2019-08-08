unit Udept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, ExtCtrls, DBCtrls, DB, DBTables, FMTBcd,
  SqlExpr, StdCtrls;

type
  TDEPTForm = class(TForm)
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    StringGrid1: TStringGrid;
    totquery: TSQLQuery;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    SQLStoredProc1: TSQLStoredProc;
    Button1: TButton;
    Button2: TButton;
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

var
  DEPTForm: TDEPTForm;

implementation

uses Udm,comobj;

{$R *.dfm}

procedure TDEPTForm.Button1Click(Sender: TObject);
begin
  if edit1.Text = '' then
  begin
     edit1.SetFocus;
     raise Exception.Create('부서코드는 반드시 입력하십시오 ');
  end;

  if edit2.Text = '' then
     raise Exception.Create('부서명은  반드시 입력하십시오 ');
  if edit3.Text = '' then
     raise Exception.Create('팀명은  반드시 입력');

  if dm.Dept.Locate('code', edit1.Text,[]) then
     raise Exception.Create('이미 등록된 부서코드입니다.');

  with sqlstoredproc1 do
  begin
    params[0].asstring := edit1.Text;
    params[1].asstring := edit2.Text;
    params[2].asstring := edit3.Text;
    execproc;
  end;
  dm.Dept.Refresh;
end;

procedure TDEPTForm.Button2Click(Sender: TObject);
var
  v:variant;
  I:INTEGER;
begin
  v := createoleobject('excel.application');
  v.workbooks.add;
  v.visible := true;
  for i:=0 to stringgrid1.rowcount do
  begin
   v.cells[i+1,1].formula := stringgrid1.Cells[0,i];
   v.cells[i+1,2].formula := stringgrid1.Cells[1,i];
   v.cells[i+1,3].formula := stringgrid1.Cells[2,i];
  end;
end;

procedure TDEPTForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TDEPTForm.FormCreate(Sender: TObject);
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
//      totquery.Close;
//      totquery.params[0].AsString :=
//      dm.dept.FieldByName('code').AsString;
//      totquery.open;
      cells[2,i] := totquery.FieldByName('total').AsString;
      dm.dept.Next;
   end;
   cells[0,i] := '총인원수';
   totquery.Close;
   totquery.params[0].AsString := '%';
   totquery.open;
   cells[2,i] := totquery.FieldByName('total').AsString;
 end;
end;

procedure TDEPTForm.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
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
