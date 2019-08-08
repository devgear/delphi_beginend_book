unit Utest3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TForm3 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    MonthCalendar1: TMonthCalendar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    procedure DateTimePicker1UserInput(Sender: TObject;
      const UserString: string; var DateAndTime: TDateTime;
      var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.DateTimePicker1UserInput(Sender: TObject;
  const UserString: string; var DateAndTime: TDateTime;
  var AllowChange: Boolean);
begin
  DateAndTime := StrToDateTime(UserString);
  AllowChange := True;
end;

end.
