unit Utest1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    MyButton: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button6: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    procedure myButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure testhandler(Sender:TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Form1: TForm1;
implementation
uses Utest4, Utest3, Utest2;
var
   H:THourly;
   Test_btn:TButton;
{$R *.dfm}

procedure TForm1.Button10Click(Sender: TObject);
begin
 Test_Btn.Free;
 Caption := IntToStr(ComponentCount);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Button1.Caption := '´Ý±â';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Button3.Caption := Countries[0];
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Button4.Caption := IntToStr(Divide(10,2));
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Test;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  THourly.Etc := 'Etc';
  THourly.Greeting;
  H := THourly.Create;
  Edit1.Text := H.Name;
  Edit2.Text := IntToStr(H.Age);
  Edit3.Text := H.Address;
  Edit4.Text := H.Office;
  Edit5.Text := IntToStr(H.Hrs);
  Edit6.Text := FloatToStr(H.BaseRate);
 end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Edit7.Text := FloatToStr(H.Salary);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  H.Free;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Test_Btn := TButton.Create(Self);
  Caption := IntToStr(Componentcount);
  Test_Btn.Parent := Form1;
  Test_Btn.Caption := 'Test';
  Test_Btn.Left := Button5.Left;
  Test_Btn.Top :=
  Button5.Top + Button5.Height + 16;
  Test_Btn.SetFocus;
  Test_Btn.OnClick := Testhandler;
end;

procedure TForm1.Button11Click(Sender: TObject);
var
  Emp : TEmp;
begin
  Emp := TEmp.Create;
  Caption := IntToStr(Emp.MyEmpno);
  Emp.Free;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  Form3 := TForm3.Create(Application);
  if Form3.ShowModal = mrOk  then
     Caption :=
     FormatDateTime('yyyy-mmmm-dd hh:nn:ss', Form3.DateTimePicker1.Date);
  Form3.Free;
end;

procedure TForm1.Button13Click(Sender: TObject);
var
  i:byte;
begin
  for i := 0 to Application.ComponentCount - 1 do
    if Application.Components[i] is TForm2 then
    begin
       (Application.Components[i] as TForm).Show;
       exit;
    end;
  Form2 := TForm2.Create(Application);
  Form2.Show;
end;

procedure TForm1.MyButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Testhandler(Sender: TObject);
begin
  ShowMessage('Test');
end;

end.
