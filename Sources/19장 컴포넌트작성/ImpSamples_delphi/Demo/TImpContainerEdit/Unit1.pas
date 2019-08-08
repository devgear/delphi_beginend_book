unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, ImpContainerEdit;

type
  TForm1 = class(TForm)
    ContainerEdit1: TImpContainerEdit;
    SpeedButton1: TSpeedButton;
    ContainerEdit2: TImpContainerEdit;
    SpeedButton2: TSpeedButton;
    ContainerEdit3: TImpContainerEdit;
    CheckBox1: TCheckBox;
    ContainerEdit4: TImpContainerEdit;
    CheckBox2: TCheckBox;
    ContainerEdit5: TImpContainerEdit;
    SpeedButton3: TSpeedButton;
    ContainerEdit6: TImpContainerEdit;
    UpDown1: TUpDown;
    ContainerEdit7: TImpContainerEdit;
    UpDown2: TUpDown;
    Panel3: TPanel;
    ContainerEdit8: TImpContainerEdit;
    Panel1: TPanel;
    ContainerEdit9: TImpContainerEdit;
    Panel2: TPanel;
    ContainerEdit10: TImpContainerEdit;
    Panel4: TPanel;
    ContainerEdit11: TImpContainerEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ContainerEdit12: TImpContainerEdit;
    Image1: TImage;
    ContainerEdit13: TImpContainerEdit;
    Image2: TImage;
    ContainerEdit14: TImpContainerEdit;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if ProgressBar1.Position=ProgressBar1.Max then
    ProgressBar1.Position := ProgressBar1.Min
  else
    ProgressBar1.Position := ProgressBar1.Position + 10;
end;

end.
