unit uClientModuleUnit;

interface

uses
  SysUtils, Classes, uClientClassesUnit, DBXDataSnap, DBXCommon, DB, SqlExpr,
  DBClient, DSConnect;

type
  TClientModule = class(TDataModule)
    SQLConnection: TSQLConnection;
    ProviderConnection: TDSProviderConnection;
    MemberQueryDataSet: TClientDataSet;
    MemberQuerySource: TDataSource;
  private
    FInstanceOwner: Boolean;
    FServerMethodsClient: TServerMethodsClient;
    function GetServerMethodsClient: TServerMethodsClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethodsClient: TServerMethodsClient read GetServerMethodsClient write FServerMethodsClient;

end;

var
  ClientModule: TClientModule;

implementation

{$R *.dfm}

constructor TClientModule.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule.Destroy;
begin
  FServerMethodsClient.Free;
  inherited;
end;

function TClientModule.GetServerMethodsClient: TServerMethodsClient;
begin
  if FServerMethodsClient = nil then
  begin
    SQLConnection.Open;
    FServerMethodsClient:= TServerMethodsClient.Create(SQLConnection.DBXConnection, FInstanceOwner);
  end;
  Result := FServerMethodsClient;
end;

end.
