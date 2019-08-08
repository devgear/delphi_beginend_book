unit uClockPanel;

interface

uses
  SysUtils, Classes, Controls, Dialogs, ExtCtrls,DesignIntf,DesignEditors;

type
  TClockPanel= class(TCustomPanel)
  private
    t:TTimer;
    FDisplayFormat: String;
    FClockInterval: Integer;
    FClockEnabled: Boolean;
    FSetTime: string;
    FonAlarm: TNotifyEvent;
    procedure DisplayTime(Sender:TObject);
    procedure SetDisplayFormat(const Value: String);
    procedure SetClockInterval(const Value: integer);
    procedure SetClockEnabled(const Value: Boolean);
    procedure Setsettime(const Value: string);
    procedure Setonalarm(const Value: Tnotifyevent);
    { Private declarations }
  protected
    { Protected declarations }
  public
   Constructor Create(AOwner:TComponent); override;
   Destructor Destroy; override;
    { Public declarations }
  published
    property Align;
    property Alignment;
    property Anchors;
    property AutoSize;
    property BevelEdges;
    property BevelInner;
    property BevelKind;
    property BevelOuter;
    property BevelWidth;
    property BiDiMode;
    property BorderWidth;
    property BorderStyle;
    property Color;
    property Constraints;
    property Ctl3D;
    property UseDockManager default True;
    property DockSite;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FullRepaint;
    property Font;
    property Locked;
    property Padding;
    property ParentBiDiMode;
    property ParentBackground;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowCaption;
    property ShowHint;
    property Touch;
    property VerticalAlignment;
    property Visible;
    property OnAlignInsertBefore;
    property OnAlignPosition;
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDockDrop;
    property OnDockOver;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnGesture;
    property OnGetSiteInfo;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
    property OnAlarm:TNotifyEvent read FOnAlarm write Setonalarm;
    property SetTime:string read FSetTime write SetSetTime;
    property ClockEnabled:Boolean read FClockEnabled write SetClockEnabled;
    property ClockInterval:Integer read FClockInterval write SetClockInterval;
    property DisplayFormat:String read FDisplayFormat write SetDisplayFormat;
        { Published declarations }
  end;

  TClockPanelEditor = class(TComponentEditor)
    function GetVerbCount:Integer; Override;
    function GetVerb(Index:Integer):String; Override;
    procedure ExecuteVerb(Index:Integer); Override;
  end;

  TFormatproperty = class(TenumProperty)
     function Getattributes:TPropertyattributes;override;
//     procedure Getvalues(Proc:TGetStrProc);override;
  end;

procedure Register;

implementation
var
  NewString:String;

procedure Register;
begin
  RegisterComponents('Samples', [TPANELCLOCK_KWK]);
  RegisterComponentEditor(TPANELCLOCK_KWK,TClockPanelEditor);
  RegisterPropertyEditor(typeinfo(String),TPANELCLOCK_KWK,'DispalyFormat',TFormatProperty);
end;

{ TPANELCLOCK_KWK }

constructor TClockPanel.Create(AOwner: TComponent);
begin
  inherited;
  t := TTimer.Create(Self);
  t.OnTimer := DisplayTime;
  SetDisplayFormat('hh:nn:ss');
  SetClockInterval(1000);
  SetClockEnabled(True);
end;

destructor TClockPanel.Destroy;
begin
  t.Free;
  inherited;
end;

procedure TClockPanel.DisplayTime(Sender: TObject);
begin
  Caption := FormatDateTime(FDisplayFormat, now);
  if FSetTime <> '' then
     if FormatDateTime('hh:nn:ss',Time) = FSetTime  then
        if Assigned(FonAlarm) then FonAlarm(self);

end;

procedure TClockPanel.SetClockEnabled(const Value: Boolean);
begin
  FClockEnabled := Value;
  t.Enabled := Value;
end;

procedure TClockPanel.SetClockInterval(const Value: integer);
begin
  FClockInterval := Value;
  t.Interval := Value;
end;

procedure TClockPanel.SetDisplayFormat(const Value: String);
begin
  FDisplayFormat := Value;
end;

procedure TClockPanel.Setonalarm(const Value: Tnotifyevent);
begin
  FOnAlarm := Value;
end;

procedure TClockPanel.SetSetTime(const Value: string);
begin
  FSetTime := Value;
end;

{ TFormatproperty }

function TFormatproperty.Getattributes: TPropertyattributes;
begin
  result := inherited getattributes + [pavaluelist,pasortlist];
end;

{ TClockPanelEditor }

procedure TClockPanelEditor.ExecuteVerb(Index: Integer);
begin
  NewString := TClockPanel(Self.Component).FDisplayFormat;
  if InputQuery('Format', '날자 포맷을 입력하십시오',NewString) then
     TClockPanel(Self.Component).SetDisplayFormat(NewString);
end;

function TClockPanelEditor.GetVerb(Index: Integer): String;
begin
  case index of
    0 : result := 'Format';
  end;
end;

function TClockPanelEditor.GetVerbCount: Integer;
begin
  result := 1;
end;

end.
