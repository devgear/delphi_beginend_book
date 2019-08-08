unit uServerMethodsUnit;

interface

uses
  SysUtils, Classes, DSServer, DBXInterBase, DB, SqlExpr, FMTBcd, Provider, SqlTimSt;

type
  TServerMethods = class(TDSServerModule)
    SQLConnection: TSQLConnection;
    OrderTable: TSQLTable;
    OrderTableProvider: TDataSetProvider;
    OrderedProductsQuery: TSQLQuery;
    OrderedProductsQueryProvider: TDataSetProvider;
    InvoiceQuery: TSQLQuery;
    InvoiceQueryProvider: TDataSetProvider;
    MemberQuery: TSQLQuery;
    MemberQueryProvider: TDataSetProvider;
    InsertOrderQuery: TSQLQuery;
    GetOrderNumQuery: TSQLQuery;
    InsertInvoiceQuery: TSQLQuery;
    InsertOrderedProductsSQLQuery: TSQLQuery;
    CartQuery: TSQLQuery;
    ProductQuery: TSQLQuery;
    InsertProductToCartQuery: TSQLQuery;
    ProductStockUpdateQuery: TSQLQuery;
    CartDelQuery: TSQLQuery;
    CartUpateQuery: TSQLQuery;
    ProductTable: TSQLTable;
    ProductTableProvider: TDataSetProvider;
    CartQueryProvider: TDataSetProvider;
    CartProductDelQuery: TSQLQuery;
    ProductQueryProvider: TDataSetProvider;
    OrderedProductByMonth: TSQLQuery;
    OrderedProductByMonthProvider: TDataSetProvider;
    VisitCountTable: TSQLTable;
    VisitCountProvider: TDataSetProvider;
    MemberTable: TSQLTable;
    MemberTableProvider: TDataSetProvider;
  private
    function GetOrderNum: String; // 주문 번호 생성해서 리턴
  public
    procedure InsertProductToCart(Id: String; ProductNum, Quantity: Integer); // 카트에 물품 추가
    function InsertOrder(Id, ivcName, ivcTel, ivcAddress: string): Boolean; // 주문서 작성
    procedure CartProductDel(ID: String; ProductNum: Integer);  // 카트의 물품 삭제
  end;

implementation

{$R *.dfm}

uses StrUtils;


{ TServerMethods }

procedure TServerMethods.CartProductDel(ID: String; ProductNum: Integer);
begin
  CartProductDelQuery.Close;
  CartProductDelQuery.ParamByName('pid').AsString := ID;
  CartProductDelQuery.ParamByName('pnum').AsInteger := ProductNum;
  CartProductDelQuery.ExecSQL;
end;

function TServerMethods.GetOrderNum: String;
var
  T, I: Integer;
  Tmp, R: String;
begin

  { 오늘 날짜에 해당하는 주문 일련번호를 받아옴 }

  // 오늘 날짜에 해당하는 Serial 쿼리
  GetOrderNumQuery.Close;
  GetOrderNumQuery.SQL.Clear;
  GetOrderNumQuery.SQL.Add('SELECT "serial" FROM "ordernum" WHERE "date" = '+ FormatDateTime('yymmdd', Now));
  GetOrderNumQuery.Open;

  // 오늘 날짜에 대한 레코드가 없으면 생성
  if GetOrderNumQuery.IsEmpty then begin
    GetOrderNumQuery.Close;
    GetOrderNumQuery.SQL.Clear;
    GetOrderNumQuery.SQL.Add('INSERT INTO "ordernum" ("date", "serial") VALUES ('''+ FormatDateTime('yymmdd', Now) +''', 0)');
    GetOrderNumQuery.ExecSQL;
  end;

  // 오늘 날짜에 해당하는 Serial 쿼리해서 T에 담기
  GetOrderNumQuery.Close;
  GetOrderNumQuery.SQL.Clear;
  GetOrderNumQuery.SQL.Add('SELECT "serial" FROM "ordernum" WHERE "date" = '+ FormatDateTime('yymmdd', Now));
  GetOrderNumQuery.Open;
  T := GetOrderNumQuery.FieldByName('serial').AsInteger;

  // 6자리에 맞춰 0채운 문자열로 변환
  Tmp := IntToStr(T);
  if Length(Tmp) < 6 then begin
    for I := 1 to 6-Length(Tmp) do
      R := R + '0';
  end;
  R := R + Tmp;

  // Serial 1 증가 시킴
  GetOrderNumQuery.Close;
  GetOrderNumQuery.SQL.Clear;
  GetOrderNumQuery.SQL.Add('UPDATE "ordernum" SET "serial" = '+ IntToStr(T+1)
                        + ' WHERE "date" = ' + FormatDateTime('yymmdd', Now));
  GetOrderNumQuery.ExecSQL;

  // 날짜 붙여서 리턴
  Result := FormatDateTime('yymmdd', Now) + R;

end;

function TServerMethods.InsertOrder(Id, ivcName, ivcTel, ivcAddress: string): Boolean;
var
  OrderNumber: String;
  Mileage, TotalCharge, A_Unit_Mileage: Integer;
  Stock: Integer;
  TransDesc: TTransactionDesc;
begin
  Mileage := 0;
  TotalCharge := 0;
  Stock := 0;


    { 주문 번호 받아오기 }
    OrderNumber := GetOrderNum;

    { 카트의 담긴 물건 조회 }
    CartQuery.Close;
    CartQuery.ParamByName('pid').AsString := Id;
    CartQuery.Open;


    { 주문 물품 목록 작성  --------------------------------------------------- }
    while not CartQuery.Eof do begin

      // 카트에 담긴 물품 번호로 상품 상세정보 조회
      ProductQuery.Close;
      ProductQuery.ParamByName('pproduct_num').AsInteger := CartQuery.FieldByName('product_num').AsInteger;
      ProductQuery.Open;
      Stock := ProductQuery.FieldByName('stock_num').AsInteger;   // 재고 수량

      // 작성 쿼리
      with InsertOrderedProductsSQLQuery do begin
        Close;
        ParamByName('porder_num').AsString := OrderNumber;
        ParamByName('pdate').AsSQLTimeStamp := DateTimeToSQLTimeStamp(Now);
        ParamByName('pproduct_num').AsInteger := CartQuery.FieldByName('product_num').AsInteger;
        ParamByName('pname').AsString := ProductQuery.FieldByName('name').AsString;
        ParamByName('pprice').AsInteger := ProductQuery.FieldByName('price').AsInteger;
        A_Unit_Mileage := ProductQuery.FieldByName('price').AsInteger * ProductQuery.FieldByName('mileage_rate').AsInteger div 100;
        ParamByName('pa_unit_mileage').AsInteger := A_Unit_Mileage;
        ParamByName('pquantity').AsInteger := CartQuery.FieldByName('quantity').AsInteger;
        ParamByName('preturn').AsBoolean := False;
        ExecSQL;
      end;

      // 물품 주문 수량만큼 재고에서 빼기
    
      
      Stock := Stock - CartQuery.FieldByName('quantity').AsInteger;
      ProductStockUpdateQuery.Close;
      ProductStockUpdateQuery.ParamByName('pnewstock').AsInteger := Stock;
      ProductStockUpdateQuery.ParamByName('pproduct_num').AsInteger := CartQuery.FieldByName('product_num').AsInteger;
      ProductStockUpdateQuery.ExecSQL;  
     
 

      // 주문 물품 가격, 마일리지 누적
      TotalCharge := TotalCharge + (ProductQuery.FieldByName('price').AsInteger * CartQuery.FieldByName('quantity').AsInteger);
      Mileage := Mileage +  A_Unit_Mileage * CartQuery.FieldByName('quantity').AsInteger;

      // 다음 물품~
      CartQuery.Next;
    end;

    { 주문서 작성 ------------------------------------------------------------ }
    with InsertOrderQuery do begin
      Close;
      ParamByName('porder_num').AsString := OrderNumber;
      ParamByName('pid').AsString := Id;
      ParamByName('pdate').AsSQLTimeStamp := DateTimeToSQLTimeStamp(Now);
      ParamByName('pdelivery_charge').AsInteger := 2500;
      TotalCharge := TotalCharge + 2500;
      ParamByName('pdelivery_state').AsString := '0';
      ParamByName('ptotal_mileage').AsInteger := Mileage;
      ParamByName('ptotal_charge').AsInteger := TotalCharge;
      ExecSQL;
    end;

    { 배송장 작성 ------------------------------------------------------------ }
    with InsertInvoiceQuery do begin
      Close;
      ParamByName('porder_num').AsString := OrderNumber;
      ParamByName('pinvoice_num').AsString := OrderNumber;
      ParamByName('pname').AsString := ivcName;
      ParamByName('ptel').AsString := ivcTel;
      ParamByName('paddress').AsString := ivcAddress;
      ExecSQL;
    end;

    { 카트 비우기 }
    with CartDelQuery do begin
      Close;
      ParamByName('pid').AsString := Id;
      ExecSQL;
    end;
    
    Result := True;

end;

procedure TServerMethods.InsertProductToCart(Id: String; ProductNum, Quantity: Integer);
var
  NewQuantity: Integer;
begin
  { 카트에 있는 물품이라면 수량만 합산 }
  // 해당 ID 카트의 담긴 물건 조회
  CartQuery.Close;
  CartQuery.ParamByName('pid').AsString := Id;
  CartQuery.Open;
  
  while not CartQuery.Eof do begin
    if CartQuery.FieldByName('product_num').AsInteger = ProductNum then begin
      NewQuantity := CartQuery.FieldByName('quantity').AsInteger;
      NewQuantity := NewQuantity + Quantity;
      with CartUpateQuery do begin
        Close;
        ParamByName('pquantity').AsInteger := NewQuantity;
        ParamByName('pproduct_num').AsInteger := ProductNum;
        ExecSQL;
      end;      
      exit;
    end; //if
    
    CartQuery.Next
  end; // while


  { 카트에 없는 물품이라면 새 레코드 추가 }
  with InsertProductToCartQuery do begin
    Close;
    ParamByName('pid').AsString := Id;
    ParamByName('pproduct_num').AsInteger := ProductNum;
    ParamByName('quantity').AsInteger := Quantity;
    ExecSQL;
  end;
end;

end.

