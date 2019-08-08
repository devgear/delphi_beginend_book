unit UCriticalSection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,syncobjs, Gauges;

type
  TThreadArrow1 = Class(TThread)
    Procedure Execute; Override;
  End;

  TThreadArrow2 = Class(TThread)
    Procedure Execute; Override;
  End;

  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Button1: TButton;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Gauge1: TGauge;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Thread1:TThreadArrow1;
  Thread2:TThreadArrow2;
  XValue :Integer = 20;
  LockValue:TCriticalSection;

implementation

{$R *.dfm}

{ Tarrow1 }

procedure TThreadArrow1.Execute;
begin
 while true do
 begin
   LockValue.Acquire;
   try
     XValue := XValue + 1;
     Form1.Image1.Left := XValue;
     Form1.ListBox1.Items.Add(inttostr(XValue));
     if XValue > 70 then
        exit;
   finally
     LockValue.Release;
   end;
   sleep(100);
 end;
end;

{ Tarrow2 }

procedure TThreadArrow2.Execute;
var
   i:integer;
begin
 while true do
 begin
   LockValue.Acquire;
   try                           XValue := XValue + 10;
     Form1.Image2.Left := XValue;
     Form1.ListBox2.Items.Add(IntToStr(XValue));

     XValue := XValue - 10;
     if XValue > 70 then
        exit;
   finally
     LockVALUE.Release;
   end;
   sleep(100);
 end;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  LockValue := TCriticalSection.Create;
  Image1.Left := 0;
  Image2.Left := 0;
  Thread1 := TThreadArrow1.Create(False);
  Thread2 := TThreadArrow2.Create(False);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Thread1.Free;
  Thread2.Free;
  LockValue.Free;
end;
end.
