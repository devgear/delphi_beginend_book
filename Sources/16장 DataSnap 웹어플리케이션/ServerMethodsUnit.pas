unit ServerMethodsUnit;

interface

uses
  SysUtils, Classes, DSServer, DBXInterBase, FMTBcd, DB, DBClient, SimpleDS,
  SqlExpr, DBWeb, DBXpressWeb, HTTPApp, HTTPProd, Provider;

type
  TServerMethods1 = class(TDSServerModule)
    SQLConnection1: TSQLConnection;
    query_kindcount: TSQLQuery;
    CustTemp: TSimpleDataSet;
    Query_curriname: TSQLQuery;
    Query_curridate: TSQLQuery;
    CustTempProvider: TDataSetProvider;
    Customer: TSimpleDataSet;
    CustomerCUSTNO: TStringField;
    CustomerNAME: TStringField;
    CustomerPNO: TStringField;
    CustomerTEL: TStringField;
    CustomerADDR: TStringField;
    CustomerCOMPANY: TStringField;
    CustomerCCODE: TStringField;
    CustomerCBOSS: TStringField;
    CustomerCADDR: TStringField;
    CustomerCTEL: TStringField;
    CustomerCFAX: TStringField;
    CustomerEMAIL: TStringField;
    orders: TSimpleDataSet;
    Curri: TSQLTable;
    CurriCODE: TStringField;
    CurriKIND: TStringField;
    CurriNAME: TStringField;
    CurriLOGO: TBlobField;
    Currikind_name: TStringField;
    curritb: TSimpleDataSet;
    curritbCTCODE: TStringField;
    curritbSTART: TSQLTimeStampField;
    curritbLIMIT: TIntegerField;
    curritbPCOUNT: TIntegerField;
    curritbPRICE: TIntegerField;
    curritbTEACHER: TStringField;
    curritbDURING: TIntegerField;
    curritbROOM: TIntegerField;
  private
    Function  Reg_Customer(rDataset:TDataset;  rName,rPno,rTel,rAddr,rCompany,rcCode,rcBoss,rcAddr,rcTel,rcFax,rEmail:String):String;
    Procedure Reg_Order(rDataset:TDataset; rctCode,rCustno:string);
    { Private declarations }
  public
    { Public declarations }
    Function  Reg_Accept(rpno:string):integer;
    function EchoString(Value: string): string;
  end;

var
  ServerMethods1: TServerMethods1;
  TD:TTransactionDesc;

  {$R *.dfm}
implementation


function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;


function TServerMethods1.Reg_Accept(rpno: string): integer;
var
  cno:String;
begin
  if not custtemp.Locate('pno',rpno,[]) then
  begin
     result := 1;                  //해당 자료가 없음
     exit;
  end;

  SQLConnection1.StartTransaction(TD);
try
  cno := Reg_Customer(customer,
                      CustTemp.FieldByName('name').AsString,
                      CustTemp.FieldByName('pno').AsString,
                      CustTemp.FieldByName('tel').AsString,
                      CustTemp.FieldByName('addr').AsString,
                      CustTemp.FieldByName('company').AsString,
                      CustTemp.FieldByName('cCode').AsString,
                      CustTemp.FieldByName('cBoss').AsString,
                      CustTemp.FieldByName('cAddr').AsString,
                      CustTemp.FieldByName('cTel').AsString,
                      CustTemp.FieldByName('cFax').AsString,
                      CustTemp.FieldByName('Email').AsString);

  Reg_Order(orders,CustTemp.FieldByName('ctcode').AsString,cno);
  CustTemp.Delete;
  CustTemp.ApplyUpdates(-1);
  SQLConnection1.Commit(td);
  result := 0;               //성공
Except
  SQLConnection1.Rollback(TD);
  result := 2;
end;
end;

function TServerMethods1.Reg_Customer(rDataset: TDataset; rName, rPno, rTel,
  rAddr, rCompany, rcCode, rcBoss, rcAddr, rcTel, rcFax,
  rEmail: String): String;
Var
  cno:integer;
begin
  if Customer.Locate('pno',rPno,[])  then
  Begin
     cno := Customer.FieldByName('custno').asInteger;
     Customer.Edit;
  End
  Else
  Begin
    if Customer.IsEmpty then
       cno := 1
    else
    begin
      Customer.Last;
      cno := Customer.FieldByName('custno').asinteger + 1;
    end;
    Customer.Insert;
  End;

  With Customer DO
  Begin
     FieldByName('custno').AsString := FormatFloat('0000000',cno);
     FieldByName('name').AsString := rName;
     FieldByName('pno').AsString := rPno;
     FieldByName('addr').AsString := rAddr;
     FieldByName('tel').AsString := rTel;
     FieldByName('company').AsString := rCompany;
     FieldByName('cCode').AsString := rcCode;
     FieldByName('cBoss').AsString := rcBoss;
     FieldByName('cAddr').AsString := rcAddr;
     FieldByName('cTel').AsString := rcTel;
     FieldByName('cFax').AsString := rcFax;
     FieldByName('email').AsString := rEmail;
     post;
     applyupdates(-1);
     result :=  FieldByName('custno').AsString;
  End;
end;

procedure TServerMethods1.Reg_Order(rDataset: TDataset; rctCode,
  rCustno: string);
begin
 if Orders.FindKey([rctCode,rCustno]) then
    abort;

   if not Curritb.Locate('ctcode',rctcode,[]) then
      abort;

   Try
     Orders.append;
     Orders.FieldByName('Regdate').asdatetime := now;
     Orders.FieldByName('ctcode').asString := rctcode;
     Orders.FieldByName('custno').asString := rcustno;
     Orders.Post;
     orders.ApplyUpdates(-1);
   Except
     on e:exception do
     begin
        Raise;
     end;
   End;
   Try
     Curritb.Edit;
     Curritb.FieldByName('pcount').asInteger :=
     Curritb.FieldByName('pcount').asInteger + 1;
     Curritb.Post;
     curritb.Applyupdates(-1);
   Except
     on e:exception do
     Begin
        Raise;
     End;
   End;
end;
Initialization
begin
  td.TransactionID := 1;
  td.IsolationLevel := xilREADCOMMITTED;
end;
end.




