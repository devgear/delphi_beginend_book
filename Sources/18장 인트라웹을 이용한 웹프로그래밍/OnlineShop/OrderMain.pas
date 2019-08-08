unit OrderMain;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, FMTBcd,
  WideStrings, DB, SqlExpr, Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWGrids, IWDBGrids, IWCompButton, IWExtCtrls,
  IWCompLabel, jpeg, IWCompText, IWCompTabControl, Forms, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion,
  IWCompOrderedListbox, IWDynGrid, IWDBStdCtrls, IWCSStdCtrls, Provider,
  DBClient, IWCompEdit, IWCompCheckbox, DBXFirebird, UTF8ContentParser, GIFImg;

type
  TMainForm = class(TIWAppForm)
    SQLDataSet: TSQLDataSet;
    SQLConnection: TSQLConnection;
    DataSource1: TDataSource;
    SQLDataSetITEMID: TIntegerField;
    SQLDataSetITEMNAME: TStringField;
    SQLDataSetPRICE: TIntegerField;
    cdsList: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    SQLDataSetCalc: TStringField;
    IWImage2: TIWImage;
    IWDBGrid2: TIWDBGrid;
    cdsCart: TClientDataSet;
    DataSource2: TDataSource;
    cdsListITEMID: TIntegerField;
    cdsListITEMNAME: TStringField;
    cdsListPRICE: TIntegerField;
    cdsListCalc: TStringField;
    IWLabel1: TIWLabel;
    lblTotal: TIWLabel;
    IWLabel2: TIWLabel;
    IWTabControl1: TIWTabControl;
    IWTabControl1Page0: TIWTabPage;
    IWTabControl1Page1: TIWTabPage;
    IWDBGrid1: TIWDBGrid;
    IWText1: TIWText;
    edUserName: TIWDBEdit;
    IWLabel3: TIWLabel;
    edUserPhone: TIWDBEdit;
    IWLabel4: TIWLabel;
    edUserEmail: TIWDBEdit;
    IWLabel5: TIWLabel;
    btnSubmit: TIWButton;
    IWLabel6: TIWLabel;
    edUserCompany: TIWDBEdit;
    cdsOrder: TClientDataSet;
    DataSource3: TDataSource;
    cdsOrderUSERNAME: TStringField;
    cdsOrderUSEREMAIL: TStringField;
    cdsOrderUSERPHONE: TStringField;
    cdsOrderCOMPANY: TStringField;
    SQLQuery1: TSQLQuery;
    chkIsCompany: TIWDBCheckBox;
    cdsOrderISCOMPANY: TIntegerField;
    IWLabel7: TIWLabel;
    edCompanyNo: TIWDBEdit;
    IWLabel8: TIWLabel;
    edHomePage: TIWDBEdit;
    edUserNameEng: TIWDBEdit;
    edCompanyEng: TIWDBEdit;
    IWLabel9: TIWLabel;
    IWLabel10: TIWLabel;
    cdsOrderCOMPANY_ENG: TStringField;
    cdsOrderUSERNAME_ENG: TStringField;
    cdsOrderCOMPANYNO: TStringField;
    cdsOrderHOMEPAGE: TStringField;
    IWText3: TIWText;
    IWLabel11: TIWLabel;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormDestroy(Sender: TObject);
    procedure IWDBGrid1Columns2Click(ASender: TObject; const AValue: string);
    procedure SQLDataSetCalcFields(DataSet: TDataSet);
    procedure IWDBGrid2Columns4Click(ASender: TObject; const AValue: string);
    procedure IWDBGrid2Columns5Click(ASender: TObject; const AValue: string);
    procedure btnSubmitClick(Sender: TObject);
    procedure chkIsCompanyAsyncClick(Sender: TObject; EventParams: TStringList);
  private
    function CalcTotal: integer;
  public
  end;

implementation

{$R *.dfm}

uses DBXCommon, Windows;

procedure TMainForm.IWAppFormCreate(Sender: TObject);
begin
  // 짐작하시겠지만, 아래 Path 설정 부분은 샘플 프로그램을 간단히 실행해보기 위한 것이구요.
  // 실제 실무에 쓰실 때는 당연히 따로 DB를 저장하는 폴더를 만들고 작업해야 합니다.
//  SQLConnection.Params.Values['Database'] := 'localhost:' + ExtractFilePath(ParamStr(0)) + 'ONLINESHOPDB.FDB';

  IWTabControl1.ActivePage := 0;

  cdsList.Open;

  cdsCart.CreateDataSet;
  cdsCart.Open;

  cdsOrder.CreateDataSet;
  cdsOrder.Open;
  cdsOrder.Insert;
  cdsOrderISCOMPANY.AsInteger := 1;

  TIntegerField(cdsCart.FieldByName('PRICE')).DisplayFormat := '#,##0';
  TIntegerField(cdsCart.FieldByName('TOTALPRICE')).DisplayFormat := '#,##0';
end;

procedure TMainForm.IWAppFormDestroy(Sender: TObject);
begin
  cdsList.Close;
  SQLDataSet.Close;
end;

procedure TMainForm.IWDBGrid1Columns2Click(ASender: TObject; const AValue: string);
var
  AExists: boolean;
begin
  AExists := cdsList.Locate('ITEMID', AValue, []);
  if not AExists then exit;

  AExists := cdsCart.Locate('ITEMID', AValue, []);
  if AExists then cdsCart.Edit
  else            cdsCart.Append;

  cdsCart.FieldByName('ITEMID').AsInteger := cdsList.FieldByName('ITEMID').AsInteger;
  cdsCart.FieldByName('ITEMNAME').AsString := cdsList.FieldByName('ITEMNAME').AsString;
  cdsCart.FieldByName('PRICE').AsInteger := cdsList.FieldByName('PRICE').AsInteger;
  if AExists then
    cdsCart.FieldByName('COUNT').AsInteger := cdsCart.FieldByName('COUNT').AsInteger + 1
  else
    cdsCart.FieldByName('COUNT').AsInteger := 1;
  cdsCart.FieldByName('TOTALPRICE').AsInteger := cdsCart.FieldByName('PRICE').AsInteger * cdsCart.FieldByName('COUNT').AsInteger;
  cdsCart.FieldByName('PLUS').AsString := '[+]';
  cdsCart.FieldByName('MINUS').AsString := '[-]';
  cdsCart.Post;

  CalcTotal;
end;

function TMainForm.CalcTotal: integer;
begin
  result := 0;
  cdsCart.First;
  while not cdsCart.Eof do
  begin
    result := result + cdsCart.FieldByName('TOTALPRICE').AsInteger;
    cdsCart.Next;
  end;
  lblTotal.Caption := FormatCurr('#,', result) + '원';
end;

procedure TMainForm.chkIsCompanyAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  edUserCompany.Enabled := chkIsCompany.Checked;
  edCompanyNo.Enabled := chkIsCompany.Checked;
  edHomePage.Enabled := chkIsCompany.Checked;
  edCompanyEng.Enabled := chkIsCompany.Checked;
end;

procedure TMainForm.SQLDataSetCalcFields(DataSet: TDataSet);
begin
  SQLDataSetCalc.AsString := '[선택]';
end;

procedure TMainForm.IWDBGrid2Columns4Click(ASender: TObject; const AValue: string);
begin
  if not cdsCart.Locate('ITEMID', AValue, []) then exit;

  cdsCart.Edit;
  cdsCart.FieldByName('COUNT').AsInteger := cdsCart.FieldByName('COUNT').AsInteger + 1;
  cdsCart.FieldByName('TOTALPRICE').AsInteger := cdsCart.FieldByName('PRICE').AsInteger * cdsCart.FieldByName('COUNT').AsInteger;
  cdsCart.Post;

  CalcTotal;
end;

procedure TMainForm.IWDBGrid2Columns5Click(ASender: TObject; const AValue: string);
begin
  if not cdsCart.Locate('ITEMID', AValue, []) then exit;

  if cdsCart.FieldByName('COUNT').AsInteger=1 then
    cdsCart.Delete
  else
  begin
    cdsCart.Edit;
    cdsCart.FieldByName('COUNT').AsInteger := cdsCart.FieldByName('COUNT').AsInteger - 1;
    cdsCart.FieldByName('TOTALPRICE').AsInteger := cdsCart.FieldByName('PRICE').AsInteger * cdsCart.FieldByName('COUNT').AsInteger;
    cdsCart.Post;
  end;

  CalcTotal;
end;

procedure TMainForm.btnSubmitClick(Sender: TObject);
var
  Tran: TDBXTransaction;
  OrderID: integer;
begin
  if CalcTotal=0 then
  begin
    WebApplication.ShowMessage('장바구니에 주문할 상품이 없습니다.');
    exit;
  end;
  if Length(cdsOrderUSERNAME.AsString)<2 then
  begin
    WebApplication.ShowMessage('이름을 바르게 입력해주십시오.');
    edUserName.SetFocus;
    exit;
  end;
  if Length(cdsOrderUSERNAME_ENG.AsString)<4 then
  begin
    WebApplication.ShowMessage('영문 이름을 바르게 입력해주십시오.');
    edUserNameEng.SetFocus;
    exit;
  end;
  if Length(cdsOrderUSEREMAIL.AsString)<4 then
  begin
    WebApplication.ShowMessage('메일주소를 바르게 입력해주십시오.');
    edUserName.SetFocus;
    exit;
  end;
  if chkIsCompany.Checked and (Length(cdsOrderCOMPANY.AsString)<2) then
  begin
    WebApplication.ShowMessage('회사 이름을 바르게 입력해주십시오.');
    edUserCompany.SetFocus;
    exit;
  end;

  if cdsOrder.State in dsEditModes then cdsOrder.Post;

  Tran := SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);
  try
    SQLQuery1.SQL.Text :=
    'insert into TB_SHOPORDER (SHOPID, ORDERID, USERNAME, USERNAME_ENG, USEREMAIL, USERPHONE, ISCOMPANY, COMPANY, COMPANY_ENG, COMPANYNO, HOMEPAGE, REGDATE) '
      + 'values (''DEVGEAR'', GEN_ID(GEN_TB_SHOPORDER_ID, 1), :USERNAME, :USERNAME_ENG, :USEREMAIL, :USERPHONE, :ISCOMPANY, :COMPANY, :COMPANY_ENG, :COMPANYNO, :HOMEPAGE, CURRENT_TIMESTAMP) '
      + 'returning ORDERID';
    SQLQuery1.ParamByName('USERNAME').Value     := cdsOrderUSERNAME.AsString;
    SQLQuery1.ParamByName('USERNAME_ENG').Value := cdsOrderUSERNAME_ENG.AsString;
    SQLQuery1.ParamByName('USEREMAIL').Value    := cdsOrderUSEREMAIL.AsString;
    SQLQuery1.ParamByName('USERPHONE').Value    := cdsOrderUSERPHONE.AsString;
    SQLQuery1.ParamByName('ISCOMPANY').Value    := cdsOrderISCOMPANY.AsInteger;
    SQLQuery1.ParamByName('COMPANY').Value      := cdsOrderCOMPANY.AsString;
    SQLQuery1.ParamByName('COMPANY_ENG').Value  := cdsOrderCOMPANY_ENG.AsString;
    SQLQuery1.ParamByName('COMPANYNO').Value    := cdsOrderCOMPANYNO.AsString;
    SQLQuery1.ParamByName('HOMEPAGE').Value     := cdsOrderHOMEPAGE.AsString;
    SQLQuery1.Open;
    OrderID := SQLQuery1.Fields[0].AsInteger;
    SQLQuery1.Close;

    cdsCart.First;
    while not cdsCart.Eof do
    begin
      SQLQuery1.CommandText :=
      'insert into TB_SHOPORDERITEM (SHOPID, ORDERID, ITEMID, ORDERCNT) values (''DEVGEAR'', :ORDERID, :ITEMID, :ORDERCNT)';
      SQLQuery1.ParamByName('ORDERID').Value  := OrderID;
      SQLQuery1.ParamByName('ITEMID').Value   := cdsCart.FieldByName('ITEMID').AsInteger;
      SQLQuery1.ParamByName('ORDERCNT').Value := cdsCart.FieldByName('COUNT').AsInteger;
      SQLQuery1.ExecSQL;
      cdsCart.Next;
    end;

    SQLConnection.CommitFreeAndNil(Tran);
    WebApplication.ShowMessage('주문이 정상적으로 접수되었습니다.');
    WebApplication.Terminate('Order process succeeded.');
  except
    on E: Exception do
    begin
      SQLConnection.RollbackFreeAndNil(Tran);
      WebApplication.ShowMessage('에러 발생 : ' + E.Message);
    end;
  end;
end;

initialization
  TMainForm.SetAsMainForm;

end.
