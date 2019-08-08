unit uOrderFinalForm;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, FMTBcd,
  DBXDataSnap, DBXCommon, DBClient, DSConnect, DB, SqlExpr, IWCompButton,
  IWCompEdit, IWCompLabel, jpeg, Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWExtCtrls, IWCompRectangle, Graphics;

type
  TOrderFinalForm = class(TIWAppForm)
    ivcNameEditLabel: TIWLabel;
    ivcTelLabel: TIWLabel;
    ivcAddressLabel: TIWLabel;
    ivcNameEdit: TIWEdit;
    ivcTelEdit: TIWEdit;
    ivcAddressEdit: TIWEdit;
    OrderButton: TIWButton;
    OrderMethod: TSqlServerMethod;
    SQLConnection: TSQLConnection;
    DSProvider: TDSProviderConnection;
    IWRectangle1: TIWRectangle;
    TitleLabel: TIWLabel;
    CancelButton: TIWButton;
    TitleImage: TIWImage;
    procedure OrderButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  end;

implementation

uses uVars, uHomeForm;

{$R *.dfm}

procedure TOrderFinalForm.CancelButtonClick(Sender: TObject);
begin
  Release;
  THomeForm.Create(WebApplication).Show;
end;

procedure TOrderFinalForm.OrderButtonClick(Sender: TObject);
begin
  with OrderMethod do begin
    ParamByName('Id'        ).AsString := UserID;
    ParamByName('ivcName'   ).AsString := ivcNameEdit.Text;
    ParamByName('ivcTel'    ).AsString := ivcTelEdit.Text;
    ParamByName('ivcAddress').AsString := ivcAddressEdit.Text;
    ExecuteMethod;
  end;

  CancelButton.Caption := '홈페이지로 가기';
  CancelButton.Left := 320;
  OrderButton.Visible := False;

  ivcNameEdit.Enabled := False;
  ivcTelEdit.Enabled := False;
  ivcAddressEdit.Enabled := False;

  WebApplication.ShowMessage('주문이 완료되었습니다.');
end;

end.
