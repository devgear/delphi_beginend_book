unit UImageEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ColorGrd, StdCtrls, Menus;

type
  TForm1 = class(TForm)
    Image1: TImage;
    ColorGrid1: TColorGrid;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Clear1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Exit1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Clear1Click(Sender: TObject);
begin
  Image1.Picture.Bitmap.Assign(Nil);
  FormCreate(Self);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Picture.Bitmap.Width := Image1.Width;
  Image1.Picture.Bitmap.Height := Image1.Height;
  ListBox1.ItemIndex := 0;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Image1.Picture.Bitmap.Canvas.MoveTo(X,Y);
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Shift = [sSleft] then
  Begin
     Image1.Picture.Bitmap.Canvas.Pen.Width := strtoint(ListBox1.Items[ListBox1.ItemIndex]);
     Image1.Picture.Bitmap.Canvas.Pen.Color := ColorGrid1.ForegroundColor;
     Image1.Picture.Bitmap.Canvas.LineTo(X,Y);
  End;
end;

procedure TForm1.Open1Click(Sender: TObject);
var
  OD :TOpenDialog;
begin
  OD := TOpenDialog.Create(Self);
  OD.Filter := 'Bitmap Files(*.bmp)|*.bmp';
  if OD.Execute then
     Image1.Picture.Bitmap.LoadFromFile(OD.FileName);
  OD.Free;
end;

procedure TForm1.Save1Click(Sender: TObject);
var
  SD :TSaveDialog;
begin
  SD := TSaveDialog.Create(Self);
  SD.Filter := 'Bitmap Files(*.bmp)|*.bmp';
  if SD.Execute then
     Image1.Picture.Bitmap.SaveToFile(SD.FileName);
  SD.Free;
end;
end.
