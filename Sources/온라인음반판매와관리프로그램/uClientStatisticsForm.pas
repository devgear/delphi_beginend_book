unit uClientStatisticsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, DB, DBClient, DBGrids, Buttons, TeEngine, Series,
  ExtCtrls, TeeProcs, Chart, DBChart, TeeDBEdit, TeeDBCrossTab;

type
  TStatisticsForm = class(TForm)
    GroupBox6: TGroupBox;
    StringGrid1: TStringGrid;
    OrderedProductByMonth: TClientDataSet;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ViewYearLabel: TLabel;
    ViewMonthLabel: TLabel;
    BitBtn5: TBitBtn;
    GroupBox1: TGroupBox;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    DBCrossTabSource1: TDBCrossTabSource;
    Series2: TLineSeries;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    procedure ChageViewDate(V: integer);
    procedure QueryExecute;
  public
    { Public declarations }
  end;

var
  StatisticsForm: TStatisticsForm;

implementation

uses uClientModuleUnit, ComObj;

var
  ViewDate: TDate;


{$R *.dfm}

procedure TStatisticsForm.BitBtn1Click(Sender: TObject);
begin
  ChageViewDate(-12);
end;

procedure TStatisticsForm.BitBtn2Click(Sender: TObject);
begin
  ChageViewDate(-1);
end;

procedure TStatisticsForm.BitBtn3Click(Sender: TObject);
begin
  ChageViewDate(1);
end;

procedure TStatisticsForm.BitBtn4Click(Sender: TObject);
begin
  ChageViewDate(12);
end;

procedure TStatisticsForm.BitBtn5Click(Sender: TObject);
var
  V: Variant;
  I: Byte;
begin
  V := CreateOleObject('Excel.Application');
  V.WorkBooks.Add;
  V.Visible := True;

  for I := 0 to StringGrid1.RowCount do
    begin
      V.Cells[I+1,1].Formula := StringGrid1.Cells[0,I];
      V.Cells[I+1,2].Formula := StringGrid1.Cells[1,I];
      V.Cells[I+1,3].Formula := StringGrid1.Cells[2,I];
    end;
end;

procedure TStatisticsForm.BitBtn6Click(Sender: TObject);
begin
  DBChart1.PreviousPage;
end;

procedure TStatisticsForm.BitBtn7Click(Sender: TObject);
begin
  DBChart1.NextPage;
end;

procedure TStatisticsForm.ChageViewDate(V: integer);
var
  NewMonth, NewYear, I: integer;
begin
  { 변경된 연도, 월 계산 }
  NewMonth := StrToInt(FormatDateTime('mm', ViewDate)) + V;
  NewYear := StrToInt(FormatDateTime('yyyy', ViewDate));
  if NewMonth = 0 then begin
    NewMonth := 12;
    Dec(NewYear);
  end;
  if NewMonth = 13 then begin
    NewMonth := 1;
    Inc(NewYear);
  end;

  if NewMonth < 1 then begin
    NewMonth := NewMonth - V;
    Dec(NewYear);
  end;
  if NewMonth > 12 then begin
    NewMonth := NewMonth - V;
    Inc(NewYear);
  end;


  ViewDate := StrToDate(IntToStr(NewYear)+'-'+IntToStr(NewMonth)+'-15');

  ViewYearLabel.Caption := FormatDateTime('yyyy', ViewDate) + '년';
  ViewMonthLabel.Caption := FormatDateTime('mm', ViewDate) + '월';

  { 선택한 연도, 월로 쿼리 }
  QueryExecute;

  { 스트링 그리드에 내용 표시 }
  with StringGrid1 do begin
    RowCount := OrderedProductByMonth.RecordCount + 1;

    Cells[0,0] := '순 위';
    Cells[1,0] := '상   품   명';
    Cells[2,0] := '판매량';
    ColWidths[1] := 320;
    ColWidths[2] := 80;
    RowHeights[0] := 25;
    for I := 1 to OrderedProductByMonth.RecordCount do begin
      Cells[0,I] := IntToStr(I);
      Cells[1,I] := OrderedProductByMonth.FieldByName('name').AsString;
      Cells[2,I] := OrderedProductByMonth.FieldByName('sum').AsString + '개';
      OrderedProductByMonth.Next;
    end;
  end;
end;

procedure TStatisticsForm.FormActivate(Sender: TObject);
begin
  ChageViewDate(0);
end;

procedure TStatisticsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TStatisticsForm.QueryExecute;
var
  BeginDate, EndDate, LastDay: string;
begin
  case StrToInt(FormatDateTime('mm', ViewDate)) of
  1: LastDay := '31';
  2: LastDay := '28';
  3: LastDay := '31';
  4: LastDay := '30';
  5: LastDay := '31';
  6: LastDay := '30';
  7: LastDay := '31';
  8: LastDay := '31';
  9: LastDay := '30';
  10: LastDay := '31';
  11: LastDay := '30';
  12: LastDay := '31';
  end;

  BeginDate := FormatDateTime('yyyy-mm-', ViewDate) + '01';
  EndDate := FormatDateTime('yyyy-mm-', ViewDate) + LastDay;
  OrderedProductByMonth.Close;
  OrderedProductByMonth.Params[0].AsDate := StrToDate(BeginDate);
  OrderedProductByMonth.Params[1].AsDate := StrToDate(EndDate);
  OrderedProductByMonth.Open;
end;

procedure TStatisticsForm.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  pos: integer;
  s: string;
begin
  s := StringGrid1.Cells[ACol, ARow];

  with StringGrid1.Canvas do begin
    FillRect(Rect);
    if (ARow > 0) and (ARow mod 2 = 0) then begin
      Brush.Color := clMoneyGreen;
    end;

    if ARow = 0 then begin
      Brush.Color := clGreen;
      Font.Style := [fsBold];
      Font.Size := 9;
      Font.Color := clWhite;
    end;

    if (ACol < 2) or (ARow = 0) then begin
      pos := ((Rect.Right - Rect.Left) - TextWidth(s)) div 2;
      TextRect(Rect, Rect.Left + pos, Rect.Top + 5, s);
    end;

    if (ACol = 2) and (ARow > 0) then begin
      pos := ((Rect.Right - Rect.Left) - TextWidth(s)) - 5;
      TextRect(Rect, Rect.Left + pos, Rect.Top + 5, s);
    end;

  end;
end;

initialization
  ViewDate := Now;

end.
