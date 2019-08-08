unit UMain_Client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXDataSnap, DBXCommon, DSHTTPCommon, DB, SqlExpr, StdCtrls,DBXJSON;

type
  TMemoCallback = class(TDBXCallback)
    public
      constructor Create;
      function Execute(Const arg:TJSONValue):TJSONValue; override;
  end;

  TMainForm_Client = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    SQLConnection1: TSQLConnection;
    ChannelManager: TDSClientCallbackChannelManager;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    CallbackID : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm_Client: TMainForm_Client;

implementation

{$R *.dfm}

procedure TMainForm_Client.Button1Click(Sender: TObject);
begin
  if not SQLConnection1.Connected then
     SQLConnection1.Open;
  CallbackID := DateTimeToStr(Now);
  Button1.Enabled := False;
  Button2.Enabled := True;
  ChannelManager.RegisterCallback(CallbackID,TMemoCallback.Create());
end;

{ TMemoCallback }

constructor TMemoCallback.Create;
begin
end;

function TMemoCallback.Execute(const arg: TJSONValue): TJSONValue;
var
  MessageStr :String;
begin
  Result := TJSONTrue.Create;
  if arg is TJSONString then
     MessageStr := TJSONString(arg).Value;
     TThread.Synchronize(Nil,
             procedure
             begin
              MainForm_Client.Memo1.Lines.Text := MessageStr;
             end);
end;

procedure TMainForm_Client.Button2Click(Sender: TObject);
begin
  Button1.Enabled := True;
  Button2.Enabled := False;
  ChannelManager.UnregisterCallback(CallbackID);
end;

end.
