unit uABOUT;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

procedure Display_About; export; stdcall;
implementation

procedure Display_About;
var
  Abox :TAboutBox;
begin
  Abox := TAboutBox.Create(nil);
  try
    Abox.ShowModal;
  finally
    Abox.Free;
  end;
end;
{$R *.dfm}

end.

