unit ServerMethodsUnit1;

interface

uses
  SysUtils, Classes, DSServer,SqlExpr, WideStrings, DBXInterbase, FMTBcd,
  Provider, DB;

type
  TServerMethods1 = class(TDSServerModule)
    SQLConnection1: TSQLConnection;
    dept: TSQLTable;
    DeptProvider: TDataSetProvider;
    insa: TSQLTable;
    insaProvider: TDataSetProvider;
    dept_query: TSQLQuery;
    Dept_queryProvider: TDataSetProvider;
    SQLDataSet1: TSQLDataSet;
    SQLStoredProc1: TSQLStoredProc;
    SQLQuery1: TSQLQuery;
    Insa_Query: TSQLQuery;
    Insa_QueryProvider: TDataSetProvider;
    Tot_Query: TSQLQuery;
    SubInsa_Query: TSQLQuery;
    SubInsaProvider: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetCount(Value: String): Integer;
    function Dept_Delete(Value: String): Integer;
    function Dept_Insert(pCode, pDept, pSection: String): Integer;
    function EchoString(Value: string): string;
  end;

var
  ServerMethods1: TServerMethods1;
  td: TTransactionDesc;

implementation
{$R *.dfm}

function TServerMethods1.Dept_Delete(Value: String): Integer;
begin
  SQLConnection1.StartTransaction(td);
  try
    try
      SQLDataset1.Close;
      SQLDataset1.Params[0].AsString := Value;
      SQLDataset1.ExecSQL;
    except
      result := 0;
      raise;
    end;
    try
      SQLQuery1.Close;
      SQLQuery1.SQL.add('delete from dept where code =:code');
      SQLQuery1.Params[0].asString := Value;
      SQLQuery1.ExecSQL;
    except
      result := 2;
//    raise;
      abort;  // raise Eabort.create('xxxx');
    end;
    SQLConnection1.Commit(td);
    Result := 1;
  except
    SQLConnection1.Rollback(td);
  end;
end;

function TServerMethods1.Dept_Insert(pCode, pDept, pSection: String): Integer;
begin
try
  with SQLStoredProc1 do
  begin
    ParamByname('pCode').asString := pCode;
    ParamByname('pDept').asString := pDept;
    ParamByname('pSection').asString := pSection;
    Execproc;
    Result := 1;
  end;
except
  result := 0;
end;
end;

function TServerMethods1.EchoString(value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetCount(Value: String): Integer;
begin
  Tot_Query.Close;
  Tot_Query.Params[0].asString := Value;
  Tot_Query.Open;
  result := Tot_Query.FieldByName('total').asInteger;
end;

initialization
begin
  td.TransactionID := 1;
  td.IsolationLevel := xilReadCommitted;
end;
end.




