unit Utcp_client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, StdCtrls,
  ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    ListBox1: TListBox;
    Button1: TButton;
    TCPClient: TIdTCPClient;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  with TCPClient do
  begin
     Connect;
     try
        ListBox1.Items.Add(TCPClient.Socket.Readln);
     finally
        Disconnect;
     end;
  end;
end;

end.
