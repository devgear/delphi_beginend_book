unit uHomeForm;

interface

uses
  Classes, Graphics, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWHTMLControls,
  Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompLabel, DBXDataSnap, DBXCommon, DB, IWGrids, IWDBGrids, DBClient,
  DSConnect, SqlExpr, FMTBcd, IWCompButton, IWCompEdit, IWCompCheckbox,
  IWDBStdCtrls, IWExtCtrls, IWDBExtCtrls, jpeg, IWCompListbox;

type
  THomeForm = class(TIWAppForm)
    SQLConnection: TSQLConnection;
    DSProvider: TDSProviderConnection;
    ProductData: TClientDataSet;
    ProductDataproduct_num: TIntegerField;
    ProductDataname: TStringField;
    ProductDataimage: TBlobField;
    ProductDatagenre: TIntegerField;
    ProductDatamedia: TStringField;
    ProductDatascreen: TStringField;
    ProductDataaudio: TStringField;
    ProductDataartist: TStringField;
    ProductDatamaker: TStringField;
    ProductDatarelease_date: TDateField;
    ProductDataprice: TIntegerField;
    ProductDatamileage_rate: TSmallintField;
    ProductDatadetail_infor: TStringField;
    ProductDatastock_num: TIntegerField;
    ProductDatagenretext: TStringField;
    ProductDatamediatext: TStringField;
    AddToCartMethod: TSqlServerMethod;
    lkOrder: TIWButton;
    TitleImage: TIWImage;
    ItemCountPerAPage: TIWComboBox;
    TitleLabel: TIWLabel;
    lkLogin: TIWButton;
    procedure IWAppFormCreate(Sender: TObject);
    procedure lkLoginClick(Sender: TObject);
    procedure ProductDataCalcFields(DataSet: TDataSet);
    procedure lkOrderClick(Sender: TObject);
    procedure PlusMinusClick(Sender: TObject);
    procedure AddToCartClick(Sender: TObject);
    procedure PageNumberClick(Sender: TObject);
    procedure ItemCountPerAPageChange(Sender: TObject);
  private
    miPageNum       : Array[1..100] of TIWLink;      // 페이지 번호
    miProductNum    : Array[1.. 20] of Integer;      // 상품 번호
    miImage         : Array[1.. 20] of TIWImage;     // 상품 이미지
    miName          : Array[1.. 20] of TIWLabel;     // 상품명
    miEtcInfo       : Array[1.. 20] of TIWLabel;     // 상품 기타 정보
    miPrice         : Array[1.. 20] of TIWLabel;     // 상품 가격
    miInput         : Array[1.. 20] of TIWLabel;     // 수량 텍스트
    miInputQuantity : Array[1.. 20] of TIWEdit;      // 수량 입력칸
    miInputPlus     : Array[1.. 20] of TIWButton;    // 수량 +
    miInputMinus    : Array[1.. 20] of TIWButton;    // 수량 -
    miAddToCart     : Array[1.. 20] of TIWButton;    // '카트에 추가' 버튼
    procedure ReDrawPage;
  end;

implementation

uses uLoginForm, uVars, uOrderForm;

const
  PLUS_BTN = 100;
  MINUS_BTN = 101;

var
  HomeForm: THomeForm;

{$R *.dfm}

procedure THomeForm.IWAppFormCreate(Sender: TObject);
var
  I : Integer;
  BlobStream : TStream;
  LastPage : Integer;
begin
  BlobStream  := nil;

  { 로그인 상태에 따라 버튼 캡션 전환 }
  if LogInState then lkLogin.Caption := '로그아웃'
                else lkLogin.Caption := '로그인';

  { 출력 갯수 변경 콤보박스 셋팅 }
  with ItemCountPerAPage do begin
    Left := miLeft + 420;
    Top  := miTop + miTerm - 52;
    case ItemViewCount of
       5 : ItemIndex := 0;
      10 : ItemIndex := 1;
      20 : ItemIndex := 2;
    end;
  end;

  { ---  상품 리스트 출력  -----------------------------------------------------
      * 전역 변수들(uVars.pas)을 참조해서 컴포넌트들을 동적으로 생성.
      * 컴포넌트들은 필드 단위의 배열로 관리됨.
          예) 상품명은 miName이라는 이름의 TIWLabel 배열로 관리.
      * 클릭 이벤트가 필요한 컴포넌트들(페이지 번호 링크, 수량 조절 버튼, 카트에
        추가 버튼)의 Tag 프로퍼티에는 자신이 속한 배열의 첨자를 저장해서 이벤트
        가 발생된 컴포넌트를 찾을 수 있도록 함.
    ---------------------------------------------------------------------------}

  // 페이지 번호
  LastPage := ProductData.RecordCount div ItemViewCount;
  if ProductData.RecordCount mod ItemViewCount > 0 then
    Inc(LastPage);

  for I := 1 to LastPage do begin
    miPageNum[I] := TIWLink.Create(WebApplication);
    with miPageNum[I] do begin
      Caption    := '[ ' + IntToStr(I) + ' ]';
      Left       := miLeft + I * 30 + 100;
      Top        := miTop + miTerm - 50;
      Tag        := I;
      Font.Color := clBlack;
      OnClick    := PageNumberClick;
      Parent     := Self;
    end;
  end;
  miPageNum[ClickedNumber].Font.Style :=
    miPageNum[ClickedNumber].Font.Style + [fsBold];   // 현재 페이지 번호 Bold

  // 레코드 포인터가 맨처음이 아니라면 가리키는 위치만큼 이동
  if RecordPointer > 0 then begin
    for I := 1 to RecordPointer do
      ProductData.Next;
  end;

  // 구분선
  with TIWLabel.Create(WebApplication) do begin
    Caption   := '. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ';
    Left      := miLeft;
    Top       := miTop + miTerm - 20;
    Width     := 600;
    Font.Size := 8;
    Parent    := Self;
  end;

  // 한 번에 출력할 상품갯수설정(ItemViewCount)만큼 출력
  for I := 1 to ItemViewCount do begin

    // 상품 번호 저장
    miProductNum[I] := ProductDataproduct_num.AsInteger;

    // 이미지
    miImage[I] := TIWImage.Create(WebApplication);
    with miImage[I] do begin
      Left    := miLeft ;
      Top     := miTop + I * miTerm;
      UseSize := True;
      Width   := 100;
      Height  := 100;
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

    // 상품명, 아티스트
    miName[I] := TIWLabel.Create(WebApplication);
    with miName[I] do begin
      Caption       := ProductDataname.AsString + ' (' + ProductDataartist.AsString + ')';
      Left          := miLeft + 120;
      Top           := miTop + I * miTerm + 5;
      Width         := 400;
      Font.FontName := '굴림';
      Font.Size     := 10;
      Font.Style    := Font.Style + [fsBold];
      Parent        := Self;
    end;

    // 제작사, 발매일, 재고 수량
    miEtcInfo[I] := TIWLabel.Create(WebApplication);
    with miEtcInfo[I] do begin
      Caption := ' | 제작 : ' + ProductDatamaker.AsString +
                 ' | 발매일 : ' + ProductDatarelease_date.AsString +
                 ' | 재고 : ' + ProductDatastock_num.AsString + ' |';
      Left    := miLeft + 130;
      Top     := miTop + I * miTerm + 32;
      Width   := 400;
      Parent  := Self;
    end;

    // 가격, 마일리지
    miPrice[I] := TIWLabel.Create(WebApplication);
    with miPrice[I] do begin
      Caption := ' | 가격 : '
                 + Format('%.0n', [ProductDataprice.AsFloat])
                 + '원 | 마일리지 : '
                 + Format('%.0n', [(ProductDatamileage_rate.AsFloat * ProductDataprice.AsFloat / 100)])
                 + '점 |';
      Left    := miLeft + 130;
      Top     := miTop + I * miTerm + 48;
      Width   := 400;
      Parent  := Self;
    end;

    // 수량
    miInput[I] := TIWLabel.Create(WebApplication);
    with miInput[I] do begin
      Caption := ' 수량 :';
      Left    := miLeft + 400;
      Top     := miTop + I * miTerm + 60;
      Width   := 400;
      Parent  := Self;
    end;

    // 수량 입력칸
    miInputQuantity[I] := TIWEdit.Create(WebApplication);
    with miInputQuantity[I] do begin
      Text      := '1';
      ReadOnly  := True;
      Font.Size := 9;
      Width     := 25;
      Height    := 20;
      Left      := miLeft + 435;
      Top       := miTop + I * miTerm + 57;
      Parent    := Self;
    end;

    // 수량 조절 버튼
      // + 버튼
    miInputPlus[I] := TIWButton.Create(WebApplication);
    with miInputPlus[I] do begin
      Text       := '+';
      Font.Size  := 7;
      Width      := 20;
      Height     := 20;
      Left       := miLeft + 460;
      Top        := miTop + I * miTerm + 57;
      Tag        := I;
      OnClick    := PlusMinusClick;
      StatusText := IntToStr(PLUS_BTN);
      Parent     := Self;
    end;
      // - 버튼
    miInputMinus[I] := TIWButton.Create(WebApplication);
    with miInputMinus[I] do begin
      Text       := '-';
      Font.Size  := 7;
      Width      := 20;
      Height     := 20;
      Left       := miLeft + 480;
      Top        := miTop + I * miTerm + 57;
      Tag        := I;
      OnClick    := PlusMinusClick;
      StatusText := IntToStr(MINUS_BTN);
      Parent     := Self;
    end;

    // 카트에 추가 버튼
    miAddToCart[I] := TIWButton.Create(WebApplication);
    with miAddToCart[I] do begin
      Text       := '카트에 추가';
      Font.Size  := 10;
      Width      := 110;
      Height     := 20;
      Left       := miLeft + 395;
      Top        := miTop + I * miTerm + 80;
      Tag        := I;
      OnClick    := AddToCartClick;
      Parent     := Self;
      // 재고 0이면 버튼 비활성화
      if ProductDatastock_num.AsInteger = 0 then begin
        Text     := '품  절';
        Enabled  := False;
      end;
    end;

    // 구분선
    with TIWLabel.Create(WebApplication) do begin;
      Caption   := '. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ';
      Left      := miLeft;
      Top       := miTop + I * miTerm + 100;
      Width     := 600;
      Font.Size := 8;
      Parent    := Self;
    end;

    ProductData.Next;
    // DB에 저장된 마지막 상품이었다면 그만 출력
    if ProductData.Eof then
      break;
  end;
end;

procedure THomeForm.ItemCountPerAPageChange(Sender: TObject);
begin
  // 한 페이지에 출력할 아이템 갯수 변경
  case ItemCountPerAPage.ItemIndex of
    0 : ItemViewCount := 5;
    1 : ItemViewCount := 10;
    2 : ItemViewCount := 20;
  end;
  ClickedNumber := 1;
  RecordPointer := 0;
  ReDrawPage;
end;

{ 카트에 물품 추가 버튼 }
procedure THomeForm.AddToCartClick(Sender: TObject);
var
  I, ProductNum, Quantity : Integer;
begin
  if not LogInState then begin
    WebApplication.ShowMessage('로그인 후 이용하세요.');
    Exit;
  end;

  // 눌린 버튼이 가리키는 상품 번호와 수량을 찾음
  I := (Sender as TIWButton).Tag;
  ProductNum := miProductNum[I];
  Quantity := StrToInt(miInputQuantity[I].Text);
  // 카트에 추가 메소드 실행
  with AddToCartMethod do begin
    ParamByName('Id'        ).AsString  := UserID;
    ParamByName('ProductNum').AsInteger := ProductNum;
    ParamByName('Quantity'  ).AsInteger := Quantity;
    ExecuteMethod;
  end;
  WebApplication.ShowMessage('카트에 추가되었습니다.');
end;

{ 수량 조절 버튼 }
procedure THomeForm.PlusMinusClick(Sender: TObject);
var
  I : Integer;
begin
  // 눌린 버튼에 해당하는 수량 입력칸을 찾음
  I := (Sender as TIWButton).Tag;

  with miInputQuantity[I] do begin
    case StrToInt((Sender as TIWButton).StatusText) of
      PLUS_BTN  : Text := IntToStr(StrToInt(Text) + 1);
      MINUS_BTN : if StrToInt(Text) > 1 then
                    Text := IntToStr(StrToInt(Text) - 1);
    end;
  end;
end;

{ 로그인/로그아웃 버튼 }
procedure THomeForm.lkLoginClick(Sender: TObject);
begin
  // 로그 아웃
  if LogInState = True then begin
    LogInState := False;
    UserID := '';
    lkLogin.Caption := '로그인';
    Exit;
  end;

  // 로그인 페이지로 이동
  Release;
  TLoginForm.Create(WebApplication).Show;
end;

{ 카트보기/주문 버튼 }
procedure THomeForm.lkOrderClick(Sender: TObject);
begin
  if not LogInState then begin
    WebApplication.ShowMessage('로그인 후 이용하세요.');
    Exit;
  end;

  TOrderForm.Create(WebApplication).Show;
end;

{ 페이지 번호 링크 }
procedure THomeForm.PageNumberClick(Sender: TObject);
begin
  // 눌린 페이지 번호와 한 번에 출력할 아이템 갯수에 따라 상품 레코드 포인터 변경
  ClickedNumber := (Sender as TIWLink).Tag;

  RecordPointer := (ClickedNumber - 1) * ItemViewCount;
  ReDrawPage;
end;

procedure THomeForm.ProductDataCalcFields(DataSet: TDataSet);
var
  GenreName : String;
  MediaName : String;
begin
  { DB에 코드로 저장된 장르, 미디어 구분을 출력용 텍스트로 저장 }
  case ProductData.FieldByName('genre').AsInteger of
     0 : GenreName := '가요';
     1 : GenreName := 'POP';
     2 : GenreName := 'J-POP';
     3 : GenreName := 'ROCK';
     4 : GenreName := '클래식';
     5 : GenreName := '국악';
     6 : GenreName := 'JAZZ';
     7 : GenreName := 'NEW AGE';
     8 : GenreName := 'WORLD MUSIC';
     9 : GenreName := '종교음악';
    10 : GenreName := 'SOUNDTRACK';
    11 : GenreName := '유아/어린이';
  end;

  case ProductData.FieldByName('media').AsInteger of
     0 : MediaName := 'CD';
     1 : MediaName := 'DVD';
  end;

  ProductDatagenretext.AsString := GenreName;
  ProductDatamediatext.AsString := MediaName;
end;

procedure THomeForm.ReDrawPage;
begin
  Release;
  HomeForm := THomeForm.Create(WebApplication);
  HomeForm.Show;
end;

initialization
  THomeForm.SetAsMainForm;
end.
