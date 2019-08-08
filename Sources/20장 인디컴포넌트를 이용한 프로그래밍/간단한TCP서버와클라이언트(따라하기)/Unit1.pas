unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdContext, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdTCPServer;

type
  TForm1 = class(TForm)
    TCPServer: TIdTCPServer;
    procedure TCPServerExecute(AContext: TIdContext);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  TCPServer.Active := true;
end;

procedure TForm1.TCPServerExecute(AContext: TIdContext);
begin
  with AContext.Connection do
  begin
     Socket.WriteLnRFC('indy TCP Server');
     Disconnect;
  end;
end;

end.
