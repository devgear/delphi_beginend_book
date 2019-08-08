program test;

uses
  Forms,
  Utest1 in 'Utest1.pas' {Form1},
  Utest2 in 'Utest2.pas' {Form2},
  Utest3 in 'Utest3.pas' {Form3},
  Utest4 in 'Utest4.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
