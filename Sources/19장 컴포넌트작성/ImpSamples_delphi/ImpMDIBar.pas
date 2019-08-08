unit ImpMDIBar;

interface

uses
  SysUtils, Classes, Controls, ExtCtrls, ComCtrls, Messages, Forms, CommCtrl;

type
  TImpMDIBar = class(TCustomTabControl)
  private
    FMDIForm: TForm;
    FDefClientProc: Pointer;
    procedure ClientWndProc(var Msg: TMessage);
    function GetTabIndexFromFormHandle(hChild: THandle): integer;
  protected
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure Change; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Align default alBottom;
    property Style default tsButtons;
    property OnChange;
  end;

procedure Register;

implementation

uses Windows, Dialogs;

procedure Register;

begin
  RegisterComponents('ImpSamples', [TImpMDIBar]);
end;

{ TImpMDIBar }

constructor TImpMDIBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Align := alBottom;
  Height := 21;
  Style := tsButtons;
  TabWidth := 100;
end;

procedure TImpMDIBar.CreateWnd;
begin
  inherited;
  FMDIForm := TForm(GetParentForm(self));
  FDefClientProc := Pointer(GetWindowLong(FMDIForm.ClientHandle, GWL_WNDPROC));
  SetWindowLong(FMDIForm.ClientHandle, GWL_WNDPROC, LParam(MakeObjectInstance(ClientWndProc)));
end;

procedure TImpMDIBar.DestroyWnd;
begin
  SetWindowLong(FMDIForm.ClientHandle, GWL_WNDPROC, LParam(FDefClientProc));
  inherited;
end;

procedure TImpMDIBar.ClientWndProc(var Msg: TMessage);
var
  NewChildForm: TForm;
begin
    case Msg.Msg of
      WM_MDICREATE:
      begin
        NewChildForm := FMDIForm.MDIChildren[FMDIForm.MDIChildCount-1];
        Tabs.AddObject(NewChildForm.Caption, NewChildForm);
      end;
      WM_MDIDESTROY:
        Tabs.Delete(GetTabIndexFromFormHandle(Msg.wParam));
      WM_KILLFOCUS:
        TabIndex := GetTabIndexFromFormHandle(Msg.wParam);
    end;
  Msg.Result := CallWindowProc(FDefClientProc, FMDIForm.ClientHandle, Msg.Msg, Msg.wParam, Msg.lParam);
end;

procedure TImpMDIBar.Change;
begin
  inherited;
  TForm(Tabs.Objects[TabIndex]).SetFocus;
end;

function TImpMDIBar.GetTabIndexFromFormHandle(hChild: THandle): integer;
var
  i: integer;
begin
  result := -1;
  for i:=0 to Tabs.Count-1 do
    if TForm(Tabs.Objects[i]).Handle = hChild then
    begin
      result := i;
      break;
    end;
end;

end.
