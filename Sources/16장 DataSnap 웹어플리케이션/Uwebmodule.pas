unit Uwebmodule;

interface

uses
  SysUtils, Classes, HTTPApp, DSHTTPCommon, DSHTTPWebBroker, DSServer, DSAuth,
  DSCommonServer, DBWeb, DBXpressWeb, HTTPProd;

type
  TWebModule1 = class(TWebModule)
    DSServer1: TDSServer;
    DSHTTPWebDispatcher1: TDSHTTPWebDispatcher;
    DSServerClass1: TDSServerClass;
    MainProducer: TPageProducer;
    courseProducer: TPageProducer;
    ListProducer: TPageProducer;
    curridateproducer: TSQLQueryTableProducer;
    acceptproducer: TPageProducer;
    FailedProducer: TPageProducer;
    CompleteProducer: TPageProducer;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1WebActionItem2Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1WebActionItem4Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1WebActionItem3Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure curridateproducerFormatCell(Sender: TObject; CellRow,
      CellColumn: Integer; var BgColor: THTMLBgColor; var Align: THTMLAlign;
      var VAlign: THTMLVAlign; var CustomAttrs, CellData: string);
    procedure ListProducerHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: string; TagParams: TStrings; var ReplaceText: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;
  curricode:string;

implementation

uses ServerMethodsUnit, WebReq;

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
//  Response.Content := '<html><heading/><body>DataSnap Server</body></html>';
end;

procedure TWebModule1.WebModule1WebActionItem2Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := ListProducer.Content;
end;

procedure TWebModule1.WebModule1WebActionItem3Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Request.QueryFields.values['p_code'] := Request.QueryFields.values['p_code'] + '%';
  with ServerMethods1.Query_curridate do
  begin
    Close;
    Params[0].asstring := Request.QueryFields.values['p_code'];
    Open;
  end;
  Response.Content := curridateproducer.Content;
end;

procedure TWebModule1.WebModule1WebActionItem4Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if Request.QueryFields.values['option'] = 'write' then
  begin
    try

      ServerMethods1.custtemp.Close;
      ServerMethods1.custtemp.Open;
      ServerMethods1.custtemp.Append;

      ServerMethods1.custtemp.FieldByName('RegDate').Asdatetime := date;
      ServerMethods1.custtemp.FieldByName('ctcode').asstring := Request.ContentFields.values['ctcode'];
      ServerMethods1.custtemp.FieldByName('name').asstring := Request.ContentFields.values['name'];
      ServerMethods1.custtemp.FieldByName('pno').asstring := Request.ContentFields.values['pno'];
      ServerMethods1.custtemp.FieldByName('tel').asstring := Request.ContentFields.values['tel'];
      ServerMethods1.custtemp.FieldByName('addr').asstring := Request.ContentFields.values['addr'];
      ServerMethods1.custtemp.FieldByName('company').asstring := Request.ContentFields.values['company'];
      ServerMethods1.custtemp.FieldByName('ccode').asstring := Request.ContentFields.values['ccode'];
      ServerMethods1.custtemp.FieldByName('cboss').asstring := Request.ContentFields.values['cboss'];
      ServerMethods1.custtemp.FieldByName('caddr').asstring := Request.ContentFields.values['caddr'];
      ServerMethods1.custtemp.FieldByName('ctel').asstring := Request.ContentFields.values['ctel'];
      ServerMethods1.custtemp.FieldByName('cfax').asstring := Request.ContentFields.values['cfax'];
      ServerMethods1.custtemp.FieldByName('Email').asstring := Request.ContentFields.values['email'];

      ServerMethods1.custtemp.post;
      ServerMethods1.custtemp.ApplyUpdates(-1);
      Response.Content := CompleteProducer.Content;
    except
      on E: Exception do
      begin
        Response.Content := FailedProducer.Content;
      end;
    end;
  end
  else
  begin
    Curricode := Request.QueryFields.values['p_code'];
    Response.Content := acceptproducer.Content;
  end;
end;

procedure TWebModule1.curridateproducerFormatCell(Sender: TObject; CellRow,
  CellColumn: Integer; var BgColor: THTMLBgColor; var Align: THTMLAlign;
  var VAlign: THTMLVAlign; var CustomAttrs, CellData: string);
begin
 if (CellColumn = 0) and (CellRow <> 0) then
  begin
   Curricode := Servermethods1.Query_curridate.FieldByName('ctcode').asstring;
   CellData := '<a href=http://localhost:81/lec/pdatasnap_web.dll/reg?p_code=' + Curricode + '>' + CellData + '</a>';
  end;

end;

procedure TWebModule1.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit.TServerMethods1;
end;


procedure TWebModule1.ListProducerHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: string; TagParams: TStrings; var ReplaceText: string);
var
  KindStr, PresentKind: string;
  i, j: byte;
begin
  if CompareText(TagString, 'currilist') = 0 then
  begin
    with Servermethods1.query_kindcount do
    begin
      Open;
      for i := 0 to RecordCount - 1 do
      begin
        KindStr := KindStr + Fields[0].asstring + '<br>';
        PresentKind := Fields[0].asstring;
        Servermethods1.Query_curriname.Close;
        Servermethods1.Query_curriname.Params[0].asstring := PresentKind;
        Servermethods1.Query_curriname.Open;
        while not Servermethods1.Query_curriname.eof do
        begin
          Curricode := Servermethods1.Query_curriname.FieldByName('code').asstring;
          KindStr := KindStr + '<img src=../pic/onestep.gif></img>' + '<a href= ./date?p_code=' + Curricode + '>' +
          Servermethods1.Query_curriname.FieldByName('Name').asstring + '</a><br>';
          Servermethods1.Query_curriname.next;
        end;
        next;
      end; // For
    end; // with
    ReplaceText := KindStr;
  end; // if
end;
end.

