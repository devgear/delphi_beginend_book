//
// Created by the DataSnap proxy generator.
//

unit ClientProxy;

interface

uses DBXCommon, DBXJSON, Classes, SysUtils, DB, SqlExpr, DBXDBReaders;

type
  TServerMethodsClient = class
  private
    FDBXConnection: TDBXConnection;
    FInstanceOwner: Boolean;
    FReverseStringCommand: TDBXCommand;
    FTransformStringCommand: TDBXCommand;
    FReverseWordsInStreamCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function ReverseString(AValue: string): string;
    function TransformString(AValue: string): TJSONObject;
    function ReverseWordsInStream(ACallback: TDBXCallback; AStream: TStream): TStream;
  end;

implementation

function TServerMethodsClient.ReverseString(AValue: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TServerMethods.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(AValue);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethodsClient.TransformString(AValue: string): TJSONObject;
begin
  if FTransformStringCommand = nil then
  begin
    FTransformStringCommand := FDBXConnection.CreateCommand;
    FTransformStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FTransformStringCommand.Text := 'TServerMethods.TransformString';
    FTransformStringCommand.Prepare;
  end;
  FTransformStringCommand.Parameters[0].Value.SetWideString(AValue);
  FTransformStringCommand.ExecuteUpdate;
  Result := TJSONObject(FTransformStringCommand.Parameters[1].Value.GetJSONValue);
end;

function TServerMethodsClient.ReverseWordsInStream(ACallback: TDBXCallback; AStream: TStream): TStream;
begin
  if FReverseWordsInStreamCommand = nil then
  begin
    FReverseWordsInStreamCommand := FDBXConnection.CreateCommand;
    FReverseWordsInStreamCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseWordsInStreamCommand.Text := 'TServerMethods.ReverseWordsInStream';
    FReverseWordsInStreamCommand.Prepare;
  end;
  FReverseWordsInStreamCommand.Parameters[0].Value.SetCallbackValue(ACallback);
  FReverseWordsInStreamCommand.Parameters[1].Value.SetStream(AStream, FInstanceOwner);
  FReverseWordsInStreamCommand.ExecuteUpdate;
  Result := FReverseWordsInStreamCommand.Parameters[2].Value.GetStream(FInstanceOwner);
end;


constructor TServerMethodsClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := True;
end;


constructor TServerMethodsClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := AInstanceOwner;
end;


destructor TServerMethodsClient.Destroy;
begin
  FreeAndNil(FReverseStringCommand);
  FreeAndNil(FTransformStringCommand);
  FreeAndNil(FReverseWordsInStreamCommand);
  inherited;
end;

end.

