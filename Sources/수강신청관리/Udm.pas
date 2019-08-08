unit Udm;

interface

uses
  SysUtils, Classes, WideStrings, DB, SqlExpr, DbxDatasnap, DBXInterbase,
  DBClient, SimpleDS, FMTBcd,Dialogs;

type
  TDm = class(TDataModule)
    SQLConnection1: TSQLConnection;
    CustTemp_Source: TDataSource;
    CustTemp: TSimpleDataSet;
    CustTempREGDATE: TSQLTimeStampField;
    CustTempCTCODE: TStringField;
    CustTempNAME: TStringField;
    CustTempPNO: TStringField;
    CustTempTEL: TStringField;
    CustTempADDR: TStringField;
    CustTempCOMPANY: TStringField;
    CustTempCCODE: TStringField;
    CustTempCBOSS: TStringField;
    CustTempCADDR: TStringField;
    CustTempCTEL: TStringField;
    CustTempCFAX: TStringField;
    CustTempEMAIL: TStringField;
    curritb_Source: TDataSource;
    Curri: TSQLTable;
    Curri_Source: TDataSource;
    CurriCODE: TStringField;
    CurriKIND: TStringField;
    CurriNAME: TStringField;
    CurriLOGO: TBlobField;
    Currikind_name: TStringField;
    Customer: TSimpleDataSet;
    Customer_Source: TDataSource;
    query_CurriList: TSimpleDataSet;
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
    currilist_Source: TDataSource;
    SimpleDataSet1: TSimpleDataSet;
    orders: TSimpleDataSet;
    curritb: TSimpleDataSet;
    curritbCTCODE: TStringField;
    curritbSTART: TSQLTimeStampField;
    curritbLIMIT: TIntegerField;
    curritbPCOUNT: TIntegerField;
    curritbPRICE: TIntegerField;
    curritbTEACHER: TStringField;
    curritbDURING: TIntegerField;
    curritbROOM: TIntegerField;
    procedure CurriCalcFields(DataSet: TDataSet);
    procedure CurritbCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Function Reg_Customer(rDataset:TDataset;  rName,rPno,rTel,rAddr,rCompany,rcCode,rcBoss,rcAddr,rcTel,rcFax,rEmail:String):String;
    Procedure Reg_Order(rDataset:TDataset; rctCode,rCustno:string);
    { Public declarations }
  end;

var
  Dm: TDm;
  TD:TTransactionDesc;

implementation

{$R *.dfm}

procedure TDm.CurriCalcFields(DataSet: TDataSet);
begin
  currikind_name.Value := currikind.Value + curriname.Value;
end;

procedure TDm.CurritbCalcFields(DataSet: TDataSet);
begin
//  CurritbEnd.Value := CurritbStart.value + CurritbDuring.Value;
end;

function TDm.Reg_Customer(rDataset: TDataset; rName, rPno, rTel, rAddr,
  rCompany, rcCode, rcBoss, rcAddr, rcTel, rcFax, rEmail: String): String;
Var
  cno:integer;
begin
  if DM.Customer.Locate('pno',rPno,[])  then
  Begin
     cno := DM.Customer.FieldByName('custno').asInteger;
     Dm.Customer.Edit;
  End
  Else
  Begin
    if dm.Customer.IsEmpty then
       cno := 1
    else
    begin
      DM.Customer.Last;
      cno := Dm.Customer.FieldByName('custno').asinteger + 1;
    end;
    Dm.Customer.Insert;
  End;

  With Dm.Customer DO
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

procedure TDm.Reg_Order(rDataset: TDataset; rctCode, rCustno: string);
begin
  if dm.Orders.FindKey([rctCode,rCustno]) then
     raise Exception.Create('이미 수강 신청 되어있음');

   if not dm.Curritb.Locate('ctcode',rctcode,[]) then
      raise Exception.Create('해당과목코드가 없습니다');

   Try
     DM.Orders.append;
     DM.Orders.FieldByName('Regdate').asdatetime := now;
     DM.Orders.FieldByName('ctcode').asString := rctcode;
     DM.Orders.FieldByName('custno').asString := rcustno;
     DM.Orders.Post;
     DM.orders.ApplyUpdates(-1);
   Except
     on e:exception do
     begin
       showmessage(e.Message);
       Raise;
     end;
   End;
   Try
     DM.Curritb.Edit;
     DM.Curritb.FieldByName('pcount').asInteger :=
     DM.Curritb.FieldByName('pcount').asInteger + 1;
     DM.Curritb.Post;
     Dm.curritb.Applyupdates(-1);
   Except
     on e:exception do
     Begin
        showmessage(e.Message);
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
