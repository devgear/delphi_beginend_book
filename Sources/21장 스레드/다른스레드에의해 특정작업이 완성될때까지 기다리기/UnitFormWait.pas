unit UnitFormWait;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,syncobjs;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TThreadCount1 = class(TThread)
    procedure Execute; override;
  end;

  TThreadCount2 = class(TThread)
    procedure Execute; override;
  end;

var
  Form1: TForm1;
  Count1: TThreadCount1;
  Count2: TThreadCount2;
  Event:TEvent;

implementation

{$R *.dfm}

{ TThreadCount1 }

procedure TThreadCount1.Execute;
var
  i:Integer;
begin
  for i := 0 to 1000 do
  begin
    Form1.Label1.Caption := IntTostr(i);
    if i = 10 then
       Event.SetEvent;
    sleep(1000);
  end;
end;
{ TThreadCount2 }

procedure TThreadCount2.Execute;
var
  i:Integer;
  WaitVar:TWaitResult;
begin
  WaitVar := Event.WaitFor(15000);
  if  WaitVar  = wrSignaled then
  begin
    for i := 0 to 1000 do
    begin
      Form1.Label2.Caption := IntTostr(i);
      sleep(1000);
    end;
  end
  else if WaitVar = wrTimeout then
      ShowMessage('시간초과');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Event := TEvent.Create(nil, False, True, '');
  Event.ResetEvent;
  Count1 := TThreadCount1.Create(False);
  Count2 := TThreadCount2.Create(False);
end;

end.
