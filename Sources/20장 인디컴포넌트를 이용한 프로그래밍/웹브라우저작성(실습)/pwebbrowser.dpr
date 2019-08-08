program pwebbrowser;

uses
  Forms,
  webbrowser_form in 'webbrowser_form.pas' {WebBrower_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TWebBrower_Form, WebBrower_Form);
  Application.Run;
end.
