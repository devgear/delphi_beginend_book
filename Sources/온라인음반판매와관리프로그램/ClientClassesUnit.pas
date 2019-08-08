// 
// Created by the DataSnap proxy generator.
// 2011-01-28 ¿ÀÀü 10:50:02
// 

unit ClientClassesUnit;

interface

uses DBXCommon, DBXClient, DBXJSON, DSProxy, Classes, SysUtils, DB, SqlExpr, DBXDBReaders, DBXJSONReflect;

type
  TServerMethodsClient = class(TDSAdminClient)
  private
    FInsertProductToCartCommand: TDBXCommand;
    FInsertOrderCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure InsertProductToCart(Id: string; ProductNum: Integer; Quantity: Integer);
    function InsertOrder(Id: string; ivcName: string; ivcTel: string; ivcAddress: string): Boolean;
  end;

implementation

procedure TServerMethodsClient.InsertProductToCart(Id: string; ProductNum: Integer; Quantity: Integer);
begin
  if FInsertProductToCartCommand = nil then
  begin
    FInsertProductToCartCommand := FDBXConnection.CreateCommand;
    FInsertProductToCartCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FInsertProductToCartCommand.Text := 'TServerMethods.InsertProductToCart';
    FInsertProductToCartCommand.Prepare;
  end;
  FInsertProductToCartCommand.Parameters[0].Value.SetWideString(Id);
  FInsertProductToCartCommand.Parameters[1].Value.SetInt32(ProductNum);
  FInsertProductToCartCommand.Parameters[2].Value.SetInt32(Quantity);
  FInsertProductToCartCommand.ExecuteUpdate;
end;

function TServerMethodsClient.InsertOrder(Id: string; ivcName: string; ivcTel: string; ivcAddress: string): Boolean;
begin
  if FInsertOrderCommand = nil then
  begin
    FInsertOrderCommand := FDBXConnection.CreateCommand;
    FInsertOrderCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FInsertOrderCommand.Text := 'TServerMethods.InsertOrder';
    FInsertOrderCommand.Prepare;
  end;
  FInsertOrderCommand.Parameters[0].Value.SetWideString(Id);
  FInsertOrderCommand.Parameters[1].Value.SetWideString(ivcName);
  FInsertOrderCommand.Parameters[2].Value.SetWideString(ivcTel);
  FInsertOrderCommand.Parameters[3].Value.SetWideString(ivcAddress);
  FInsertOrderCommand.ExecuteUpdate;
  Result := FInsertOrderCommand.Parameters[4].Value.GetBoolean;
end;


constructor TServerMethodsClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethodsClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethodsClient.Destroy;
begin
  FreeAndNil(FInsertProductToCartCommand);
  FreeAndNil(FInsertOrderCommand);
  inherited;
end;

end.
