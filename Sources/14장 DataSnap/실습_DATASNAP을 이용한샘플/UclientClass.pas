// 
// Created by the DataSnap proxy generator.
// 2011-07-08 ¿ÀÀü 6:16:38
// 

unit UclientClass;

interface

uses DBXCommon, DBXClient, DBXJSON, DSProxy, Classes, SysUtils, DB, SqlExpr, DBXDBReaders, DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FGetCountCommand: TDBXCommand;
    FDept_DeleteCommand: TDBXCommand;
    FDept_InsertCommand: TDBXCommand;
    FEchoStringCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetCount(Value: string): Integer;
    function Dept_Delete(Value: string): Integer;
    function Dept_Insert(pCode: string; pDept: string; pSection: string): Integer;
    function EchoString(Value: string): string;
  end;

implementation

function TServerMethods1Client.GetCount(Value: string): Integer;
begin
  if FGetCountCommand = nil then
  begin
    FGetCountCommand := FDBXConnection.CreateCommand;
    FGetCountCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetCountCommand.Text := 'TServerMethods1.GetCount';
    FGetCountCommand.Prepare;
  end;
  FGetCountCommand.Parameters[0].Value.SetWideString(Value);
  FGetCountCommand.ExecuteUpdate;
  Result := FGetCountCommand.Parameters[1].Value.GetInt32;
end;

function TServerMethods1Client.Dept_Delete(Value: string): Integer;
begin
  if FDept_DeleteCommand = nil then
  begin
    FDept_DeleteCommand := FDBXConnection.CreateCommand;
    FDept_DeleteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDept_DeleteCommand.Text := 'TServerMethods1.Dept_Delete';
    FDept_DeleteCommand.Prepare;
  end;
  FDept_DeleteCommand.Parameters[0].Value.SetWideString(Value);
  FDept_DeleteCommand.ExecuteUpdate;
  Result := FDept_DeleteCommand.Parameters[1].Value.GetInt32;
end;

function TServerMethods1Client.Dept_Insert(pCode: string; pDept: string; pSection: string): Integer;
begin
  if FDept_InsertCommand = nil then
  begin
    FDept_InsertCommand := FDBXConnection.CreateCommand;
    FDept_InsertCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDept_InsertCommand.Text := 'TServerMethods1.Dept_Insert';
    FDept_InsertCommand.Prepare;
  end;
  FDept_InsertCommand.Parameters[0].Value.SetWideString(pCode);
  FDept_InsertCommand.Parameters[1].Value.SetWideString(pDept);
  FDept_InsertCommand.Parameters[2].Value.SetWideString(pSection);
  FDept_InsertCommand.ExecuteUpdate;
  Result := FDept_InsertCommand.Parameters[3].Value.GetInt32;
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
  FreeAndNil(FGetCountCommand);
  FreeAndNil(FDept_DeleteCommand);
  FreeAndNil(FDept_InsertCommand);
  FreeAndNil(FEchoStringCommand);
  inherited;
end;

end.
