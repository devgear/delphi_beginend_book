unit ServerMethodsUnit;

interface

uses
  SysUtils, Classes, DSServer, DBXInterBase, FMTBcd, SqlExpr, Provider, DB;

type
  TServerMethods1 = class(TDSServerModule)
    SQLConnection1: TSQLConnection;
    dept: TSQLTable;
    deptprovider: TDataSetProvider;
    insaQuery: TSQLQuery;
    insaqueryprovider: TDataSetProvider;
    totQuery: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function get_dept:tdataset;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function getcount(code: String): Integer;

  end;

implementation

{$R *.dfm}

uses StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.getcount(code: String): Integer;
begin
   totquery.Close;
   totquery.Params[0].AsString := code;
   totquery.open;
   result := totquery.fieldbyname('total').AsInteger;
end;

function TServerMethods1.get_dept: tdataset;
begin
   if dept.State = dsinactive then
      dept.Open;

   result := dept;
end;


function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := StrUtils.ReverseString(Value);
end;

end.

