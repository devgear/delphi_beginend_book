unit Unit1;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompButton,
  IWCompEdit, Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompLabel;

type
  TIWForm1 = class(TIWAppForm)
    IWLabel1: TIWLabel;
    IWEdit1: TIWEdit;
    IWButton1: TIWButton;
    화면띄우기: TIWButton;
    procedure IWButton1Click(Sender: TObject);
    procedure 화면띄우기Click(Sender: TObject);
  public
  end;

implementation

uses Unit2;

{$R *.dfm}


procedure TIWForm1.IWButton1Click(Sender: TObject);
var
  s:String;
begin
  s := IWEdit1.Text;
  if Length(s) = 0 then
     WebApplication.ShowMessage('이름을 입력해 주십시오')
  else
  begin
     WebApplication.ShowMessage('Hello ' + s + '!');
     IWEdit1.Text := '';
  end;
end;

procedure TIWForm1.화면띄우기Click(Sender: TObject);
begin
   TIWForm2.Create(WebApplication).Show;
end;

initialization
  TIWForm1.SetAsMainForm;

end.
