unit ImpContainerEdit;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, Messages;

type
  TImpContainerEdit = class(TEdit)
  private
    FControlAlign: TAlign;
    procedure setControlAlign(const Value: TAlign);
    procedure CmControlChange(var Message: TMessage); message CM_CONTROLCHANGE;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure Loaded; override;
    procedure KeyPress(var Key: Char); override;
    procedure AdjustEditRect;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property ControlAlign: TAlign read FControlAlign write setControlAlign;
  end;

procedure Register;

implementation

uses Windows;

procedure Register;
begin
  RegisterComponents('ImpSamples', [TImpContainerEdit]);
end;

{ TImpContainerEdit }

constructor TImpContainerEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csAcceptsControls];
  FControlAlign := alRight;
end;

procedure TImpContainerEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or ES_MULTILINE;  // EM_SETRECT가 먹히려면 멀티라인이어야 함.
end;

procedure TImpContainerEdit.AdjustEditRect;
var
  i, EditingOffset: integer;
  R: TRect;
begin
  if ControlCount=0 then exit;
  EditingOffset := 0;
  for i:=0 to ControlCount-1 do
  begin
    Controls[i].Align := FControlAlign;
    EditingOffset := EditingOffset + Controls[i].Width;
  end;
  R := ClientRect;
  if FControlAlign=alRight then R.Right := R.Right - EditingOffset
  else {FControlAlign=alLeft}   R.Left  := R.Left + EditingOffset;
  Perform(EM_SETRECT, 0, LParam(@R));
end;

procedure TImpContainerEdit.CmControlChange(var Message: TMessage);
begin
  inherited;
  TControl(Message.WParam).Align := FControlAlign;
  AdjustEditRect;
end;

procedure TImpContainerEdit.setControlAlign(const Value: TAlign);
begin
  if FControlAlign = Value then exit;
  if not (Value in [alLeft, alRight]) then exit;
  FControlAlign := Value;
  AdjustEditRect;
end;

procedure TImpContainerEdit.CreateWnd;
begin
  inherited;
  AdjustEditRect;
end;

procedure TImpContainerEdit.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if Key=#13 then Key := #0;
end;

procedure TImpContainerEdit.Loaded;
begin
  inherited;
  AdjustEditRect;
end;

end.
