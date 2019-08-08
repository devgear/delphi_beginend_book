unit Umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, ExtCtrls, DBCtrls, Grids, DBGrids, DB;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  ADOQuery1.Close;
  ADOQuery1.Parameters[0].Value :=
  ADOTable1.FieldByName('code').AsString;
  ADOQuery1.Open;
end;

end.
