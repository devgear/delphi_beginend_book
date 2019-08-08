unit Umain_web;

interface

uses
  SysUtils, Classes, HTTPApp, WideStrings, DBXInterbase, FMTBcd, SqlExpr,
  Provider, DB, DBWeb, DBXpressWeb, HTTPProd, sqltimst, DBClient, SimpleDS;

type
  TWebModule5 = class(TWebModule)
    MainProducer: TPageProducer;
    courseProducer: TPageProducer;
    SQLConnection1: TSQLConnection;
    query_kindcount: TSQLQuery;
    Query_curriname: TSQLQuery;
    ListProducer: TPageProducer;
    Query_curridate: TSQLQuery;
    curridateproducer: TSQLQueryTableProducer;
    Query_curridateCTCODE: TStringField;
    Query_curridateSTART: TSQLTimeStampField;
    Query_curridateLIMIT: TIntegerField;
    Query_curridatePCOUNT: TIntegerField;
    Query_curridatePRICE: TIntegerField;
    Query_curridateTEACHER: TStringField;
    Query_curridateDURING: TIntegerField;
    Query_curridateROOM: TIntegerField;
    acceptproducer: TPageProducer;
    CompleteProducer: TPageProducer;
    FailedProducer: TPageProducer;
    CustTemp: TSimpleDataSet;
    procedure WebModule5WebActionItem3Action(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure ListProducerHTMLTag(Sender: TObject; Tag: TTag; const TagString: string; TagParams: TStrings; var ReplaceText: string);
    procedure WebModule5WebActionItem4Action(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule5WebActionItem5Action(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    // procedure WebModule5WebActionItem6Action(Sender: TObject;
    // Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure curridateproducerFormatCell(Sender: TObject; CellRow, CellColumn: Integer; var BgColor: THTMLBgColor; var Align: THTMLAlign;
      var VAlign: THTMLVAlign; var CustomAttrs, CellData: string);
    procedure acceptproducerHTMLTag(Sender: TObject; Tag: TTag; const TagString: string; TagParams: TStrings; var ReplaceText: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule5: TWebModule5;
  Curricode: string;

implementation

{$R *.dfm}

procedure TWebModule5.acceptproducerHTMLTag(Sender: TObject; Tag: TTag; const TagString: string; TagParams: TStrings;
  var ReplaceText: string);
begin
  ReplaceText := '<tr>' + '<td width="500">' + '<input type="hidden" size="10" maxlength="10" name="ctcode" value="' + Curricode + '"></td>' + '</tr>';
end;

procedure TWebModule5.curridateproducerFormatCell(Sender: TObject; CellRow, CellColumn: Integer; var BgColor: THTMLBgColor;
  var Align: THTMLAlign; var VAlign: THTMLVAlign; var CustomAttrs, CellData: string);
begin
  if (CellColumn = 0) and (CellRow <> 0) then
  begin
    Curricode := Query_curridate.FieldByName('ctcode').asstring;
    CellData := '<a href=http://localhost:81/lec/pweb.exe/reg?p_code=' + Curricode + '>' + CellData + '</a>';
  end;

end;

procedure TWebModule5.ListProducerHTMLTag(Sender: TObject; Tag: TTag; const TagString: string; TagParams: TStrings;
  var ReplaceText: string);
var
  KindStr, PresentKind: string;
  i, j: byte;
begin
  if CompareText(TagString, 'currilist') = 0 then
  begin
    with query_kindcount do
    begin
      Open;
      for i := 0 to RecordCount - 1 do
      begin
        KindStr := KindStr + Fields[0].asstring + '<br>';
        PresentKind := Fields[0].asstring;
        Query_curriname.Close;
        Query_curriname.Params[0].asstring := PresentKind;
        Query_curriname.Open;
        while not Query_curriname.eof do
        begin
          Curricode := Query_curriname.FieldByName('code').asstring;
          KindStr := KindStr + '<img src=../pic/onestep.gif></img>' + '<a href= ./date?p_code=' + Curricode + '>' +
            Query_curriname.FieldByName('Name').asstring + '</a><br>';
          Query_curriname.next;
        end;
        next;
      end; // For
    end; // with
    ReplaceText := KindStr;
  end; // if
end;

procedure TWebModule5.WebModule5WebActionItem3Action(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := ListProducer.Content;
end;

procedure TWebModule5.WebModule5WebActionItem4Action(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Request.QueryFields.values['p_code'] := Request.QueryFields.values['p_code'] + '%';
  with Query_curridate do
  begin
    Close;
    Params[0].asstring := Request.QueryFields.values['p_code'];
    Open;
  end;
  Response.Content := curridateproducer.Content;
end;

procedure TWebModule5.WebModule5WebActionItem5Action(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if Request.QueryFields.values['option'] = 'write' then
  begin
    try

      custtemp.Close;
      custtemp.Open;
      custtemp.Append;

      custtemp.FieldByName('RegDate').Asdatetime := date;
      custtemp.FieldByName('ctcode').asstring := Request.ContentFields.values['ctcode'];
      custtemp.FieldByName('name').asstring := Request.ContentFields.values['name'];
      custtemp.FieldByName('pno').asstring := Request.ContentFields.values['pno'];
      custtemp.FieldByName('tel').asstring := Request.ContentFields.values['tel'];
      custtemp.FieldByName('addr').asstring := Request.ContentFields.values['addr'];
      custtemp.FieldByName('company').asstring := Request.ContentFields.values['company'];
      custtemp.FieldByName('ccode').asstring := Request.ContentFields.values['ccode'];
      custtemp.FieldByName('cboss').asstring := Request.ContentFields.values['cboss'];
      custtemp.FieldByName('caddr').asstring := Request.ContentFields.values['caddr'];
      custtemp.FieldByName('ctel').asstring := Request.ContentFields.values['ctel'];
      custtemp.FieldByName('cfax').asstring := Request.ContentFields.values['cfax'];
      custtemp.FieldByName('Email').asstring := Request.ContentFields.values['email'];

      custtemp.post;
      custtemp.ApplyUpdates(-1);
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

end.
