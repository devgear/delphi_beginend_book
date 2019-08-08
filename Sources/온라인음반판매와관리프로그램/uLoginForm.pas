unit uLoginForm;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompButton,
  IWCompEdit, Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompLabel, DBXDataSnap, DBXCommon, DB, DBClient, DSConnect,
  SqlExpr, uVars, IWCompRectangle, jpeg, IWExtCtrls, Graphics;

type
  TLoginForm = class(TIWAppForm)
    SQLConnection: TSQLConnection;
    DSProvider: TDSProviderConnection;
    MemberQuery: TClientDataSet;
    Rectangle: TIWRectangle;
    IDLabel: TIWLabel;
    PWLabel: TIWLabel;
    IdEdit: TIWEdit;
    PWEdit: TIWEdit;
    LoginButton: TIWButton;
    TitleLabel: TIWLabel;
    TitleImage: TIWImage;
    procedure LoginButtonClick(Sender: TObject);
  end;

implementation

uses uHomeForm;

{$R *.dfm}

procedure TLoginForm.LoginButtonClick(Sender: TObject);
begin
  with MemberQuery do begin
    Close;
    Params[0].AsString := IdEdit.Text;
    Open;

    // 입력한 ID에 대한 사용자 정보가 없을 경우
    if IsEmpty then begin
      WebApplication.ShowMessage('없는 아이디입니다.');
      IdEdit.Text := '';
      PWEdit.Text := '';
      IdEdit.SetFocus;
      Exit;
    end;

    // 패스워드가 일치하지 않을 경우
    if FieldByName('password').AsString <> PWEdit.Text then begin
      WebApplication.ShowMessage('패스워드가 틀렸습니다.');
      PWEdit.Text := '';
      PWEdit.SetFocus;
      Exit;
    end;

    // 로그인 성공
    LogInState := True;
    UserID := IdEdit.Text;
    Release;
    THomeForm.Create(WebApplication).Show;
  end;
end;

end.
