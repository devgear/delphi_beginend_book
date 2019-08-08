unit uClientOrderForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, DB, DBClient, ComCtrls,
  Buttons;

type
  TClientOrderForm = class(TForm)
    OrderDataSet: TClientDataSet;
    OrderDataSetorder_num: TStringField;
    OrderDataSetid: TStringField;
    OrderDataSetnon_member_num: TIntegerField;
    OrderDataSetdate: TDateField;
    OrderDataSetdelivery_charge: TIntegerField;
    OrderDataSetdelivery_state: TStringField;
    OrderDataSettotal_charge: TIntegerField;
    OrderSource: TDataSource;
    OrderedProductsDataSet: TClientDataSet;
    OrderedProductsSource: TDataSource;
    InvoiceDataSet: TClientDataSet;
    InvoiceSource: TDataSource;
    OrderDataSettotal_mileage: TIntegerField;
    OrderDataSetdelivery_state_dp: TStringField;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    lblMemberState: TLabel;
    Label8: TLabel;
    lblID: TLabel;
    lblName: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    lblResidentNum: TLabel;
    Label12: TLabel;
    lblTel: TLabel;
    Label13: TLabel;
    lblEmail: TLabel;
    Label14: TLabel;
    lblAddress: TLabel;
    Label16: TLabel;
    lblMileage: TLabel;
    lblNonMemberNum_c: TLabel;
    lblNonMemberNum: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    lblInvoiceNum: TLabel;
    lblInvoiceName: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    lblInvoiceAddress: TLabel;
    lblInvoiceTel: TLabel;
    GroupBox3: TGroupBox;
    cbxDeliveryState: TComboBox;
    Button1: TButton;
    GroupBox4: TGroupBox;
    lvProductList: TListView;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    lblTotMileage: TLabel;
    Label17: TLabel;
    lblTotCharge: TLabel;
    GroupBox6: TGroupBox;
    DBGrid1: TDBGrid;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure OrderDataSetCalcFields(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure OrderNavigated;
    procedure OrderSourceDataChange(Sender: TObject; Field: TField);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientOrderForm: TClientOrderForm;

implementation

uses uClientModuleUnit;

{$R *.dfm}

procedure TClientOrderForm.BitBtn1Click(Sender: TObject);
begin
  OrderDataSet.First;
  OrderNavigated;
end;

procedure TClientOrderForm.BitBtn2Click(Sender: TObject);
begin
  if not OrderDataSet.Bof then begin
    OrderDataSet.Prior;
    OrderNavigated;
  end;
end;

procedure TClientOrderForm.BitBtn3Click(Sender: TObject);
begin
  if not OrderDataSet.Eof then begin
    OrderDataSet.Next;
    OrderNavigated;
  end;
end;

procedure TClientOrderForm.BitBtn4Click(Sender: TObject);
begin
  OrderDataSet.Last;
  OrderNavigated;
end;

procedure TClientOrderForm.Button1Click(Sender: TObject);
var
  DS: Integer;
begin

  DS := cbxDeliveryState.ItemIndex; // 아이템 인덱스 미리 담아둠

  OrderDataSet.Edit;                // 여기서 아이템 인덱스 돌아가 버리니까;
  OrderDataSet.FieldByName('delivery_state').AsInteger := DS;
  OrderDataSet.Post;
  OrderDataSet.ApplyUpdates(-1);

  // 배송 완료로 바꾸면서 회원이라면 마일리지 누적
  if (DS = 2) and (OrderDataSetid <> nil) then begin
    ClientModule.MemberQueryDataSet.Edit;
    ClientModule.MemberQueryDataSet.FieldByName('mileage').AsInteger :=
      ClientModule.MemberQueryDataSet.FieldByName('mileage').AsInteger +
      OrderDataSet.FieldByName('total_mileage').AsInteger;
    ClientModule.MemberQueryDataSet.Post;
    ClientModule.MemberQueryDataSet.ApplyUpdates(-1);
  end;

  OrderDataSet.Refresh;


end;

procedure TClientOrderForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OrderDataSet.Active := False;
  Action := caFree;
end;

procedure TClientOrderForm.FormCreate(Sender: TObject);
begin
  OrderDataSet.Active := True;
end;



procedure TClientOrderForm.OrderDataSetCalcFields(DataSet: TDataSet);
begin
  case OrderDataSetdelivery_state.AsInteger of
    0: OrderDataSetdelivery_state_dp.AsString := '배송전';
    1: OrderDataSetdelivery_state_dp.AsString := '배송중';
    2: OrderDataSetdelivery_state_dp.AsString := '배송완료';
  end;
end;

procedure TClientOrderForm.OrderNavigated;
var
  ListItem: TListItem;
begin

  { 선택된 주문 관련 쿼리 }

  // 주문 상품 쿼리
  OrderedProductsDataSet.Close;
  OrderedProductsDataSet.Params[0].AsString := OrderDataSet.FieldByName('order_num').AsString;
  OrderedProductsDataSet.Open;

  // 회원 정보 쿼리
  ClientModule.MemberQueryDataSet.Close;
  ClientModule.MemberQueryDataSet.Params[0].AsString := OrderDataSet.FieldByName('id').AsString;
  ClientModule.MemberQueryDataSet.Open;


  // 배송 정보 쿼리
  InvoiceDataSet.Close;
  InvoiceDataSet.Params[0].AsString := OrderDataSet.FieldByName('order_num').AsString;
  InvoiceDataSet.Open;

  { 상세정보 출력 }

  // 배송상태 정보
    cbxDeliveryState.Enabled := True;
    cbxDeliveryState.ItemIndex := OrderDataSetdelivery_state.AsInteger;
    if cbxDeliveryState.ItemIndex = 2 then
      cbxDeliveryState.Enabled := False;

  // 구매자 정보
  if OrderDataSetid <> nil then begin
    // 회원
    lblNonMemberNum_c.Visible := False;
    lblNonMemberNum.Visible := False;

    lblMemberState.Caption := '회원';
    lblID.Caption := OrderDataSetid.AsString;
    lblMileage.Caption := ClientModule.MemberQuerySource.DataSet.FieldByName('mileage').AsString;
    lblName.Caption := ClientModule.MemberQuerySource.DataSet.FieldByName('name').AsString;
    lblResidentNum.Caption := ClientModule.MemberQuerySource.DataSet.FieldByName('resident_num').AsString;
    lblTel.Caption := ClientModule.MemberQuerySource.DataSet.FieldByName('tel').AsString;
    lblEmail.Caption := ClientModule.MemberQuerySource.DataSet.FieldByName('email').AsString;
    lblAddress.Caption := ClientModule.MemberQuerySource.DataSet.FieldByName('address').AsString;
  end else begin
    // 비회원
    lblID.Caption := '-';   lblMileage.Caption := '-';
    lblNonMemberNum_c.Visible := True;
    lblNonMemberNum.Visible := True;

    lblMemberState.Caption := '비회원';
    lblNonMemberNum.Caption := OrderDataSetnon_member_num.AsString;

  end;

  // 배송 정보
  lblInvoiceNum.Caption := InvoiceSource.DataSet.FieldByName('invoice_num').AsString;
  lblInvoiceName.Caption := InvoiceSource.DataSet.FieldByName('name').AsString;
  lblInvoiceTel.Caption := InvoiceSource.DataSet.FieldByName('tel').AsString;
  lblInvoiceAddress.Caption := InvoiceSource.DataSet.FieldByName('address').AsString;

  // 상품 정보
  lvProductList.Items.Clear;
  while not OrderedProductsDataSet.Eof do begin
    ListItem := lvProductList.Items.Add;
    ListItem.Caption := OrderedProductsDataSet.FieldByName('product_num').AsString;
    ListItem.SubItems.Add(OrderedProductsDataSet.FieldByName('name').AsString);
    ListItem.SubItems.Add(OrderedProductsDataSet.FieldByName('quantity').AsString);
    ListItem.SubItems.Add(Format('%.0n', [OrderedProductsDataSet.FieldByName('price').AsFloat])+'원');
    OrderedProductsDataSet.Next;
  end;

  // 결제 정보
  lblTotMileage.Caption := Format('%.0n', [OrderDataSettotal_mileage.AsFloat]) + '점';
  lblTotCharge.Caption := Format('%.0n', [OrderDataSettotal_charge.AsFloat]) + '원';
end;


procedure TClientOrderForm.OrderSourceDataChange(Sender: TObject;
  Field: TField);
begin
  OrderNavigated;
end;

end.
