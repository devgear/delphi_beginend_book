unit uOrderForm;

interface

uses
  Classes, Graphics, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, FMTBcd,
  DBXDataSnap, DBXCommon, DBClient, DSConnect, DB, SqlExpr, IWGrids, IWDBGrids,
  IWCompButton, IWCompEdit, Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompLabel, jpeg, IWExtCtrls, IWCompCheckbox;

type
  TOrderForm = class(TIWAppForm)
    DelSelectedItemButton: TIWButton;
    CartData: TClientDataSet;
    CartItemDelMethod: TSqlServerMethod;
    SQLConnection: TSQLConnection;
    DSProvider: TDSProviderConnection;
    ProductData: TClientDataSet;
    BackToHomeButton: TIWButton;
    OrderButton: TIWButton;
    TitleLabel: TIWLabel;
    TitleImage: TIWImage;
    procedure DelSelectedItemButtonClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure BackToHomeButtonClick(Sender: TObject);
    procedure OrderButtonClick(Sender: TObject);
  private
    CartItemCount : Integer;                      // 카트 아이템 갯수
    miProductNum  : Array[1..20] of Integer;      // 상품 번호
    miImage       : Array[1..20] of TIWImage;     // 상품 이미지
    miName        : Array[1..20] of TIWLabel;     // 상품명
    miPrice       : Array[1..20] of TIWLabel;     // 상품가격
    miDelCheck    : Array[1..20] of TIWCheckBox;  // 삭제 선택 체크박스
    miTotalCharge : TIWLabel;                     // 가격 합계
    procedure ReDrawPage;
    procedure CartRefresh;
    procedure ProductQuery(PNum: Integer);
  end;

implementation

uses uVars, uHomeForm, uOrderFinalForm;

var
  OrderForm: TOrderForm;

{$R *.dfm}

procedure TOrderForm.IWAppFormCreate(Sender: TObject);
var
  I : Integer;
  ItemCharge, TotalCharge : Real;
  BlobStream : TStream;
  miTermCart, miTopCart : Integer;
begin
  BlobStream  := nil;
  miTermCart  := miTerm - 50;
  miTopCart   := miTop + 50;
  TotalCharge := 0;
  CartRefresh;
  CartItemCount := CartData.RecordCount;

  // 구분선
  with TIWLabel.Create(WebApplication) do begin
    Caption   := '. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ';
    Left      := miLeft;
    Top       := miTopCart + miTermCart - 20;
    Width     := 600;
    Font.Size := 8;
    Parent    := Self;
  end;

  for I := 1 to CartItemCount do begin
    miProductNum[I] := CartData.FieldByName('product_num').AsInteger;
    // 상품 정보 쿼리
    ProductQuery(miProductNum[I]);

    // 이미지
    miImage[I] := TIWImage.Create(WebApplication);
    with miImage[I] do begin
      Left    := miLeft ;
      Top     := miTopCart + I * miTermCart;
      UseSize := True;
      Width   := 50;
      Height  := 50;
      if not ProductData.FieldByName('image').IsNull then begin
        try
          BlobStream := ProductData.CreateBlobStream(ProductData.FieldByName('image'), bmRead);
          Picture.Bitmap.LoadFromStream(BlobStream);
        finally
          BlobStream.Free;
        end;
      end;
      Parent  := Self;
    end;

    // 상품명
    miName[I] := TIWLabel.Create(WebApplication);
    with miName[I] do begin
      Caption       := ProductData.FieldByName('name').AsString;
      Left          := miLeft + 70;
      Top           := miTopCart + I * miTermCart + 5;
      Width         := 400;
      Font.FontName := '굴림';
      Font.Size     := 10;
      Font.Style    := Font.Style + [fsBold];
      Parent        := Self;
    end;

    // 가격, 수량, 아이템당 가격 계산
      // 상품 가격 x 수량
    ItemCharge := ProductData.FieldByName('price').AsFloat * CartData.FieldByName('quantity').AsFloat;
      // 가격 누적
    TotalCharge := TotalCharge + ItemCharge;

    miPrice[I] := TIWLabel.Create(WebApplication);
    with miPrice[I] do begin
      Caption := ' | ' + Format('%.0n', [ProductData.FieldByName('price').AsFloat]) + '원 x ' +
                 CartData.FieldByName('quantity').AsString + '개 = ' + Format('%.0n', [ItemCharge]) + '원';
      Left    := miLeft + 70;
      Top     := miTopCart + I * miTermCart + 28;
      Width   := 400;
      Parent  := Self;
    end;

    // 삭제 체크박스
    miDelCheck[I] := TIWCheckBox.Create(WebApplication);
    with miDelCheck[I] do begin
      Caption    := ': 삭제';
      StatusText := CartData.FieldByName('product_num').AsString;
      Left       := miLeft + 340;
      Top        := miTopCart + I * miTermCart + 26;
      Parent     := Self;
    end;

    // 구분선
    with TIWLabel.Create(WebApplication) do begin
      Caption   := '. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ';
      Left      := miLeft;
      Top       := miTopCart + I * miTermCart + 50;
      Width     := 600;
      Font.Size := 8;
      Parent    := Self;
    end;

    CartData.Next;
  end;

  // 총 가격
  miTotalCharge := TIWLabel.Create(WebApplication);
  with miTotalCharge do begin
    Caption    := '총계 : ' + Format('%.0n', [TotalCharge]) + '원';
    Left       := miLeft + 330;
    Top        := miTopCart + (CartItemCount + 1) * miTermCart + 5;
    Width      := 400;
    Font.Style := Font.Style + [fsBold];
    Parent     := Self;
  end;
end;

procedure TOrderForm.ReDrawPage;
begin
  Release;
  OrderForm := TOrderForm.Create(WebApplication);
  OrderForm.Show;
end;

procedure TOrderForm.CartRefresh;
begin
  CartData.Close;
  CartData.Params[0].AsString := UserID;
  CartData.Open;
end;

procedure TOrderForm.ProductQuery(PNum: Integer);
begin
  ProductData.Close;
  ProductData.Params[0].AsInteger := PNum;
  ProductData.Open;
end;

procedure TOrderForm.BackToHomeButtonClick(Sender: TObject);
begin
  Release;
  THomeForm.Create(WebApplication).Show;
end;

procedure TOrderForm.OrderButtonClick(Sender: TObject);
begin
  Release;
  TOrderFinalForm.Create(WebApplication).Show;
end;

procedure TOrderForm.DelSelectedItemButtonClick(Sender: TObject);
var
  I : Integer;
begin
  for I := 1 to CartItemCount do begin
    if miDelCheck[I].Checked = True then begin
      CartItemDelMethod.ParamByName('ID'        ).AsString  := UserID;
      CartItemDelMethod.ParamByName('ProductNum').AsInteger := miProductNum[I];
      CartItemDelMethod.ExecuteMethod;
    end;
  end;
  ReDrawPage;
end;

end.
