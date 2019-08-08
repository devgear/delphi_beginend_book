unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImpProcessExec, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    ImpProcessExec1: TImpProcessExec;
    procedure Button1Click(Sender: TObject);
    procedure ImpProcessExec1ProcessTerminate(Sender: TObject);
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
 ImpProcessExec1.CommandLine := Edit1.Text;
 ImpProcessExec1.Execute;
end;

procedure TForm1.ImpProcessExec1ProcessTerminate(Sender: TObject);
begin
 ShowMessage('실행시켰던 [' + ImpProcessExec1.CommandLine + ']프로그램이 종료되었습니다.');
end;

end.
 