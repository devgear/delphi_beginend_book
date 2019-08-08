unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, StdCtrls, ImpMDIBar;

type
  TMainForm = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ImpMDIBar1: TImpMDIBar;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses Account, Personnel, Inventory;

{$R *.dfm}

procedure TMainForm.ToolButton1Click(Sender: TObject);
begin
  TInventoryForm.Create(self);
end;

procedure TMainForm.ToolButton2Click(Sender: TObject);
begin
  TPersonnelForm.Create(self);
end;

procedure TMainForm.ToolButton3Click(Sender: TObject);
begin
  TAccountForm.Create(self);
end;

procedure TMainForm.ToolButton4Click(Sender: TObject);
begin
  ImpMDIBar1.Align := alBottom;
  ImpMDIBar1.Style := tsButtons;
end;

procedure TMainForm.ToolButton6Click(Sender: TObject);
begin
  ImpMDIBar1.Align := alTop;
  ImpMDIBar1.Style := tsTabs;
end;

end.
