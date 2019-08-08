unit Uwebmodule1;

interface

uses
  SysUtils, Classes, HTTPApp, DBWeb, DB, DBTables, DBBdeWeb,httpprod, DSProd,
  DBXInterBase, FMTBcd, DBXpressWeb, SqlExpr;

type
  TWebModule8 = class(TWebModule)
    SQLConnection1: TSQLConnection;
    Dept: TSQLTable;
    InsaQuery: TSQLQuery;
    Insa: TSQLTable;
    DataSetTableProducer1: TDataSetTableProducer;
    DataSetPageProducer1: TDataSetPageProducer;
    SQLQueryTableProducer1: TSQLQueryTableProducer;
    PageProducer1: TPageProducer;
    DeptCODE: TStringField;
    DeptDEPT: TStringField;
    DeptSECTION: TStringField;
    procedure DataSetTableProducer1FormatCell(Sender: TObject; CellRow,
      CellColumn: Integer; var BgColor: THTMLBgColor; var Align: THTMLAlign;
      var VAlign: THTMLVAlign; var CustomAttrs, CellData: string);
    procedure WebModule8WebActionItem2Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure SQLQueryTableProducer1FormatCell(Sender: TObject; CellRow,
      CellColumn: Integer; var BgColor: THTMLBgColor; var Align: THTMLAlign;
      var VAlign: THTMLVAlign; var CustomAttrs, CellData: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule8;

implementation

{$R *.dfm}


procedure TWebModule8.DataSetTableProducer1FormatCell(Sender: TObject; CellRow,
  CellColumn: Integer; var BgColor: THTMLBgColor; var Align: THTMLAlign;
  var VAlign: THTMLVAlign; var CustomAttrs, CellData: string);
begin
  if (CellColumn=0) and (CellRow <> 0) then
     CellData := '<a href= http://localhost:/80/kwk/PwebBroker.exe/Insa?Code='+ Deptcode.value+ '>' + CellData+'</a>';

end;

procedure TWebModule8.SQLQueryTableProducer1FormatCell(Sender: TObject; CellRow,
  CellColumn: Integer; var BgColor: THTMLBgColor; var Align: THTMLAlign;
  var VAlign: THTMLVAlign; var CustomAttrs, CellData: string);
begin
  if (CellColumn = 0) and (CellRow <> 0) then
     CellData :=
     '<a href = http://localhost:80/kwk/pWebBroker.exe/Etc?Name='+CellData+'>'
     +CellData+'</a>';
end;

procedure TWebModule8.WebModule8WebActionItem2Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  InsaQuery.Close;
  InsaQuery.Params[0].AsString := Request.QueryFields.Values['Code'];
  InsaQuery.Open;
  Response.Content := SQLQueryTableProducer1.Content;
end;

end.
