unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TMainForm_Server = class(TForm)
    Memo1: TMemo;
    procedure Memo1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm_Server: TMainForm_Server;

implementation
USES
 DBXJSON,ServerContainerUnit1;
{$R *.dfm}

procedure TMainForm_Server.Memo1Change(Sender: TObject);
var
  Value :TJSONString;
begin
  Value := TJSONString.Create(Memo1.Lines.Text);
  ServerContainer1.DSServer1.BroadcastMessage('MemoChannel', Value);
end;

end.

