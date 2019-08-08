unit webbrowser_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, PlatformDefaultStyleActnCtrls, ActnMan, OleCtrls,
  SHDocVw, StdCtrls, ExtCtrls, ToolWin, ActnCtrls, ComCtrls;

type
  TWebBrower_Form = class(TForm)
    StatusBar1: TStatusBar;
    ActionToolBar1: TActionToolBar;
    Panel1: TPanel;
    Label1: TLabel;
    Eurl: TEdit;
    WebBrowser1: TWebBrowser;
    ActionManager1: TActionManager;
    ImageList1: TImageList;
    Back_Action: TAction;
    Forward_Action: TAction;
    Stop_Action: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Back_ActionExecute(Sender: TObject);
    procedure Forward_ActionExecute(Sender: TObject);
    procedure Stop_ActionExecute(Sender: TObject);
    procedure EurlKeyPress(Sender: TObject; var Key: Char);
    procedure EurlClick(Sender: TObject);
    procedure WebBrowser1BeforeNavigate2(ASender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure WebBrowser1DownloadBegin(Sender: TObject);
    procedure WebBrowser1DownloadComplete(Sender: TObject);
    procedure WebBrowser1StatusTextChange(ASender: TObject;
      const Text: WideString);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebBrower_Form: TWebBrower_Form;

implementation
var
  slHistory:TStringList;
{$R *.dfm}



procedure TWebBrower_Form.Back_ActionExecute(Sender: TObject);
begin
  Forward_Action.Enabled := True;
  Eurl.Text := slhistory.Strings[slhistory.IndexOf(eurl.text)-1];
  WebBrowser1.goBack;
  if slhistory.IndexOf(Eurl.Text) =0 then
     Back_Action.Enabled := False;

end;

procedure TWebBrower_Form.EurlClick(Sender: TObject);
begin
  Eurl.SelectAll;
end;

procedure TWebBrower_Form.EurlKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if Eurl.Text <> '' then begin
      WebBrowser1.Navigate(Eurl.Text);
      if slHistory.IndexOf(Eurl.Text) =-1 then
      begin
        slHistory.Add(Eurl.Text);
        if slHistory.Count > 1 then
           Back_Action.Enabled := True
        else
           Back_Action.Enabled := False;
      end;
    end;

  end;
end;

procedure TWebBrower_Form.FormCreate(Sender: TObject);
begin
  slHistory := TStringList.Create;
end;

procedure TWebBrower_Form.Forward_ActionExecute(Sender: TObject);
begin
  if slHistory.IndexOf(Eurl.Text) =slHistory.Count -2 then
     Forward_Action.Enabled := False;
  Eurl.Text := slHistory.Strings[slHistory.IndexOf(Eurl.Text)+1];
  WebBrowser1.GoForward;
  Back_Action.Enabled := True;
end;

procedure TWebBrower_Form.Stop_ActionExecute(Sender: TObject);
begin
  WebBrowser1.Stop;
  StatusBar1.SimpleText := '';
end;

procedure TWebBrower_Form.WebBrowser1BeforeNavigate2(ASender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
begin
  Statusbar1.SimpleText := URL;
end;

procedure TWebBrower_Form.WebBrowser1DownloadBegin(Sender: TObject);
begin
  Stop_Action.Enabled := True;
end;

procedure TWebBrower_Form.WebBrowser1DownloadComplete(Sender: TObject);
begin
  Stop_Action.Enabled := False;
  StatusBar1.SimpleText := '';
end;

procedure TWebBrower_Form.WebBrowser1StatusTextChange(ASender: TObject;
  const Text: WideString);
begin
  StatusBar1.SimpleText := Text;
end;

end.
