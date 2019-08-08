unit ReverseStringServerContainer;

interface

uses
  SysUtils, Classes, 
  DSTCPServerTransport,
  DSServer, DSCommonServer, DSHTTPCommon, DSHTTP;

type
  TServerContainer3 = class(TDataModule)
    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSServerClass1: TDSServerClass;
    DSHTTPService1: TDSHTTPService;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
  end;

procedure RunDSServer;

var
  ServerContainer3: TServerContainer3;

implementation

uses Windows, ReverseStringServerMethods;

{$R *.dfm}

procedure TServerContainer3.DataModuleDestroy(Sender: TObject);
begin
  DSServer1.Stop;
end;

procedure TServerContainer3.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ReverseStringServerMethods.TServerMethods;
end;

procedure RunDSServer;
var
  LModule: TServerContainer3;
  LInputRecord: TInputRecord;
  LEvent: DWord;
  LHandle: THandle;
begin
  LModule := TServerContainer3.Create(nil);
  try
    Writeln('DataSnap 2010 ReverseString Server');
    Writeln(Format('TCP/IP port %d', [LModule.DSTCPServerTransport1.Port]));
    Writeln(Format('HTTP port %d', [LModule.DSHTTPService1.HttpPort]));
    LModule.DSServer1.Start;
    try
      Writeln('Press ESC to stop the server');
      LHandle := GetStdHandle(STD_INPUT_HANDLE);
      while True do
      begin
        Win32Check(ReadConsoleInput(LHandle, LInputRecord, 1, LEvent));
        if (LInputRecord.EventType = KEY_EVENT) and
        LInputRecord.Event.KeyEvent.bKeyDown and
        (LInputRecord.Event.KeyEvent.wVirtualKeyCode = VK_ESCAPE) then
          break;
      end;
    finally
      LModule.DSServer1.Stop;
    end;
  finally
    LModule.Free;
  end;
end;

end.




