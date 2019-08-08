unit UnitFormLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TLoginThread = class(TThread)
    procedure Execute; override;
  end;

var
  FormLogin: TFormLogin;
  Start:Boolean=False;
  LoginThread:TLoginThread;

procedure LoginCheck;
implementation

{$R *.dfm}
procedure LoginCheck;
begin
  LoginThread := TLoginThread.Create(True);
  LoginThread.Priority := tpLower;
  LoginThread.Resume;
end;
{ TLoginThread }

procedure TLoginThread.Execute;
begin
  FormLogin := TFormLogin.Create(nil);
  FormLogin.Showmodal;
  FormLogin.Free;
end;

procedure TFormLogin.Button1Click(Sender: TObject);
begin
  if (Edit1.Text = 'delphi') and (Edit2.Text = 'delphi') then
      Start := True
  else
  begin
     ShowMessage('Password Error');
     Start := False;
  end;
  Close;
end;

procedure TFormLogin.Button2Click(Sender: TObject);
begin
   Start := False;
   Close;
end;
end.
