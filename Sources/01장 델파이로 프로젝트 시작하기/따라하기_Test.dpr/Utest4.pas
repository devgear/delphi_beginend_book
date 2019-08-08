unit Utest4;

interface
uses
  Dialogs;
type
  Country = array [0..2] of String;

  Person = record
    Name:String;
    Age:byte;
    Address:String;
  end;
  p_person = ^Person;


  TDog = class
    Name:String;
    Age:Byte;
    Address:String;
    function Getname:String;
  end;

  TPerson = class
    private
      ttt:string;
    public
      Name:String;
      Age:byte;
      Address:String;
      function Getname:String;
      function Echo(Value:String):String;
      Constructor Create; virtual;
  end;

  TEmp = class(tPerson)
    Office:String;
    Empno:Integer;
    Baserate:real;
    function Salary:real; virtual;abstract;
    Constructor Create; override;
  end;
  { TEmpClassHelper }
  TEmpClassHelper = class Helper for TEmp  // Class Helper를 사용
       Function MyEmpno:integer;
  end;

  THourly = class(TEmp)
    Hrs,rate:Integer;
    class procedure Greeting; static;
    class var Etc: string;
    function Salary:Real; override;
    Constructor Create; override;
  private
    function Echo(value: String): String;
   end;

  TSalary = class(TEmp)
  public
    Salesamt:real;
    CommissionRate:real;
    Constructor Create; override;
    function Salary:Real; override;
  end;

var
  i:integer;
  r:real;
  s:String;
  Countries:Country;
  a1:Array of String;
  a2:Array of Array of String;
  p:person;
  ptr:p_person;
  v:variant;
procedure Test;
function Divide(x,y:Integer):Integer; overload;
function Divide(x,y:Real):Real; overload;
implementation
var
  j:integer;
{ tperson }
procedure Test;
begin
  ShowMessage('Test Called');
end;

function Divide(x,y:Integer):Integer;
begin
  result := x div y;
end;

function Divide(x,y:Real):Real;
begin
  result := x / y;
end;

constructor TPerson.Create;
begin
  Name := 'kim';
  Age := 20;
  Address := 'any Where';
end;

function TPerson.Echo(Value: String): String;
begin
   result := Value;
end;

function TPerson.Getname: String;
begin
   result := Name;
end;

{ tdog }

function TDog.Getname: String;
begin
   result := Name;
end;

{ temp }
Constructor TEmp.Create;
begin
  inherited;
  Office := '데브기어';
  Empno := 1;
  BaseRate := 10;
end;

function THourly.Echo(Value:String):String;
begin
  result := Value;
end;

class procedure THourly.Greeting;
begin
   ShowMessage('Hi');
end;
{THourly}
Constructor THourly.create;
begin
  inherited;
  Hrs := 10;
end;

function THourly.Salary:Real;
begin
  result := Hrs * BaseRate;
end;

{TSalary}
Constructor TSalary.Create;
begin
  inherited Create;
  CommissionRate := 1;
  Salesamt := 5;
end;

function TSalary.Salary:Real;
begin
  result  := (Salesamt * CommissionRate) + (BaseRate + 40.0);
end;

{ TEmpClassHelper }

function TEmpClassHelper.MyEmpno: integer;
begin
  result := Empno;
end;

initialization
begin
  Countries[0] := '한국';
  Countries[1] := '미국';
  Countries[2] := '일본';
  SetLength(a1,2);
  SetLength(a2,2,2);
  a1[0] := 'a';
  a2[0,0] := 'a2';
end;
//finalization
end.
