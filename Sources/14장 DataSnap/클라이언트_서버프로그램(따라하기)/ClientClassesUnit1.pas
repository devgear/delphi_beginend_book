// 
// Created by the DataSnap proxy generator.
// 2011-07-07 ¿ÀÀü 8:26:25
// 

unit ClientClassesUnit1;

interface

uses DBXCommon, DBXClient, DBXJSON, DSProxy, Classes, SysUtils, DB, SqlExpr, DBXDBReaders, DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    Fget_deptCommand: TDBXCommand;
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FgetcountCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function get_dept: TDataSet;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function getcount(code: string): Integer;
  end;

implementation

function TServerMethods1Client.get_dept: TDataSet;
begin
  if Fget_deptCommand = nil then
  begin
    Fget_deptCommand := FDBXConnection.CreateCommand;
    Fget_deptCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fget_deptCommand.Text := 'TServerMethods1.get_dept';
    Fget_deptCommand.Prepare;
  end;
  Fget_deptCommand.ExecuteUpdate;
  Result := TCustomSQLDataSet.Create(nil, Fget_deptCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    Fget_deptCommand.FreeOnExecute(Result);
end;

function TServerMethods1Client.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.getcount(code: string): Integer;
begin
  if FgetcountCommand = nil then
  begin
    FgetcountCommand := FDBXConnection.CreateCommand;
    FgetcountCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FgetcountCommand.Text := 'TServerMethods1.getcount';
    FgetcountCommand.Prepare;
  end;
  FgetcountCommand.Parameters[0].Value.SetWideString(code);
  FgetcountCommand.ExecuteUpdate;
  Result := FgetcountCommand.Parameters[1].Value.GetInt32;
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethods1Client.Destroy;
begin
  FreeAndNil(Fget_deptCommand);
  FreeAndNil(FEchoStringCommand);
  FreeAndNil(FReverseStringCommand);
  FreeAndNil(FgetcountCommand);
  inherited;
end;

end.
