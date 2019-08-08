unit Umain_web_book;

interface

uses
  SysUtils, Classes, HTTPApp, HTTPProd;

type
  TWebModule10 = class(TWebModule)
    mainProducer: TPageProducer;
    procedure WebModule10DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule10;

implementation

{$R *.dfm}

procedure TWebModule10.WebModule10DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
//  Response.Content := '<html><heading/><body>Web Server Application</body></html>';
end;

end.
