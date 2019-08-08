unit UDockingUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TDocking_Form = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Docking_Panel: TPanel;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Docking_PanelDockOver(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure Docking_PanelDockDrop(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer);
    procedure Docking_PanelUnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Docking_Form: TDocking_Form;
  SaveMessage:String;

implementation

uses UDockedUnit;

{$R *.dfm}

procedure TDocking_Form.Button1Click(Sender: TObject);
begin
  Docked_Form := TDocked_Form.Create(Application);
  Docked_Form.Show;
end;

procedure TDocking_Form.Docking_PanelDockDrop(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer);
begin
  SaveMessage := Docked_Form.Panel_Message.Caption;
  Docked_Form.Panel_Message.Caption := '도킹이 되었습니다';
end;

procedure TDocking_Form.Docking_PanelDockOver(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
begin
  SaveMessage := Docked_Form.Panel_Message.Caption;
  Docked_Form.Panel_Message.Caption := '도킹이 되려고합니다';
end;

procedure TDocking_Form.Docking_PanelUnDock(Sender: TObject; Client: TControl;
  NewTarget: TWinControl; var Allow: Boolean);
begin
  Docked_Form.Panel_Message.Caption := SaveMessage;
end;

end.
