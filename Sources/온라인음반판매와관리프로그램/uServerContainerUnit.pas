unit uServerContainerUnit;

interface

uses
  SysUtils, Classes, 
  DSTCPServerTransport,
  DSServer, DSCommonServer, DSAuth; 

type
  TServerContainer = class(TDataModule)
    DSServer: TDSServer;
    DSTCPServerTransport: TDSTCPServerTransport;
    DSServerClass: TDSServerClass;
    procedure DSServerClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  public
  end;

var
  ServerContainer: TServerContainer;

implementation

uses Windows, uServerMethodsUnit;

{$R *.dfm}

procedure TServerContainer.DSServerClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := uServerMethodsUnit.TServerMethods;
end;

end.

