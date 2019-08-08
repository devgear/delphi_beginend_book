unit ImpRibbon;

// Ribbon Control MDI patch component
// by Jeehoon Imp Park
//
// Originally from Ribbon patch file of Georgi Panayotov, http://www.ada-soft.bg/downloads/ribbon.patch

interface

uses Classes, Controls, Windows, Forms, Messages, Ribbon, RibbonStyleActnCtrls;

type
  TMdiSysButtonKind = (mbkMDIMinimize, mbkMDIRestore, mbkMDIClose);

  TImpRibbon = class;

  // MDI Buttons
  TRibbonMDIButton = class(TOffice2007Button)
  private
    FOwnerRibbon: TImpRibbon;
    FButtonKind: TMdiSysButtonKind;
  protected
    procedure DrawImage; override;
    procedure Click; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TRibbonMDIButtons = class(TObject)
  private
    FMinimizeItem: TRibbonMDIButton;
    FRestoreItem: TRibbonMDIButton;
    FCloseItem: TRibbonMDIButton;
    FButtonsWidth: Integer;
    FRibbon: TImpRibbon;
    FButtonsHeight: Integer;
    FRect: TRect;

    procedure InvalidateToolbar;
    procedure UpdateState(W: HWND; Maximized: Boolean);
    procedure SetRect(const Value: TRect);

  public
    constructor Create(AOwner: TImpRibbon);
    destructor Destroy; override;
    property ButtonsWidth: Integer read FButtonsWidth;
    property ButtonsHeight: Integer read FButtonsHeight;
    property BoundsRect: TRect read FRect write SetRect;
  end;

  TImpRibbon = class(TRibbon)
  private
    FParentForm: TCustomForm;
    FRibbonMDIButtons: TRibbonMDIButtons;
    FOldDefWndProc: Pointer;
    procedure ClientWndProc(var Message: TMessage);
  protected
    function GetHelpButtonRect: TRect; override;
    function GetMDIButtonsRect: TRect; virtual;
    procedure InvalidateSubTitleButtons; virtual;
    procedure SetParent(AParent: TWinControl); override;
    procedure Resize; override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses SysUtils, Dialogs;

{ TImpRibbon }

constructor TImpRibbon.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FRibbonMDIButtons := nil;
end;

destructor TImpRibbon.Destroy;
begin
  if Assigned(FRibbonMDIButtons) then
    FreeAndNil(FRibbonMDIButtons);
  inherited Destroy;
end;

procedure TImpRibbon.CreateWnd;
begin
  inherited CreateWnd;
  FOldDefWndProc := Pointer(SetWindowLong(TForm(FParentForm).ClientHandle, GWL_WNDPROC, LongInt(classes.MakeObjectInstance(ClientWndProc))));
end;

procedure TImpRibbon.DestroyWnd;
begin
  SetWindowLong(TForm(FParentForm).ClientHandle, GWL_WNDPROC, LongInt(FOldDefWndProc));
  inherited DestroyWnd;
end;

procedure TImpRibbon.ClientWndProc(var Message: TMessage);
var
  I: Integer;
begin
  if (TForm(FParentForm).FormStyle=fsMDIForm) then
    case Message.Msg of
      WM_MDIRESTORE, WM_MDIMAXIMIZE, WM_SIZE, WM_MDIDESTROY:
        if Assigned(self.ApplicationMenu.Menu) then
          for I := 1 to self.ApplicationMenu.Menu.ControlCount - 1 do
            self.ApplicationMenu.Menu.Controls[I].Visible := False;
    end;
  with Message do
    Result := CallWindowProc(FOldDefWndProc, TForm(FParentForm).ClientHandle, Msg, wParam, lParam);
end;

function TImpRibbon.GetHelpButtonRect: TRect;
var
  MBWidth, LTopPos, HelpButtonWidth, HelpButtonHeight: Integer;
begin
  Result := inherited GetHelpButtonRect;
  if ShowHelpButton then
  begin
    HelpButtonWidth := Result.Right - Result.Left;
    HelpButtonHeight := Result.Bottom - Result.Top;
    LTopPos := Result.Top;
    if Assigned(FRibbonMDIButtons) then
      MBWidth := FRibbonMDIButtons.ButtonsWidth
    else
      MBWidth := 0;

    if BiDiMode = bdLeftToRight then
      Result := Rect(Width - HelpButtonWidth - MBWidth, LTopPos, Width - MBWidth, LTopPos + HelpButtonHeight)
    else
      Result := Rect(0 + MBWidth, LTopPos, HelpButtonWidth + MBWidth, LTopPos + HelpButtonHeight);
  end;
end;

function TImpRibbon.GetMDIButtonsRect: TRect;
var
  LTopPos: Integer;
begin
  if Assigned(FRibbonMDIButtons) then
  begin
    LTopPos := GetRibbonMetric(rmCaption) + 1;
    if BiDiMode = bdLeftToRight then
      Result := Rect(Width - FRibbonMDIButtons.ButtonsWidth, LTopPos, Width, LTopPos + FRibbonMDIButtons.ButtonsHeight)
    else
      Result := Rect(0, LTopPos, FRibbonMDIButtons.ButtonsWidth, LTopPos + FRibbonMDIButtons.ButtonsHeight);
  end
  else
    Result := Rect(0, 0, 0, 0);
end;

procedure TImpRibbon.InvalidateSubTitleButtons;
var
  I: Integer;
begin
  if Assigned(FRibbonMDIButtons) then
    FRibbonMDIButtons.BoundsRect := GetMDIButtonsRect;
  if ShowHelpButton then
  begin
    for I := 0 to ControlCount - 1 do
      if Controls[I].ClassName = 'THelpButton' then
        THelpButton(Controls[I]).BoundsRect := GetHelpButtonRect;
  end;
end;

procedure TImpRibbon.Resize;
begin
  inherited Resize;
  if Assigned(FRibbonMDIButtons) then
    FRibbonMDIButtons.BoundsRect := GetMDIButtonsRect;
end;

procedure TImpRibbon.SetParent(AParent: TWinControl);
begin
  if Parent = AParent then exit;

  if Assigned(AParent) then
    FParentForm := GetParentForm(AParent)
  else
    FParentForm := nil;

  inherited SetParent(AParent);
  if not Assigned(AParent) then exit;

  if not(csDesigning in ComponentState) and not(csDestroying in ComponentState) then
  begin
    if Assigned(FParentForm) and (TForm(FParentForm).FormStyle = fsMDIForm) then
    begin
      if not Assigned(FRibbonMDIButtons) then
      begin
        FRibbonMDIButtons := TRibbonMDIButtons.Create(self);
        FRibbonMDIButtons.BoundsRect := GetMDIButtonsRect;
      end;
    end
    else
      if Assigned(FRibbonMDIButtons) then
        FreeAndNil(FRibbonMDIButtons);
  end;
end;

{ TRibbonMDIButtons }
var
  CBTHookHandle: HHOOK;
  RibbonMDIButtonsList: TList;

function AddToList(var List: TList; Item: TObject): Boolean;
{ Returns True if Item didn't already exist in the list }
begin
  if List = nil then
    List := TList.Create;
  Result := List.IndexOf(Item) = -1;
  if Result then
    List.Add(Item);
end;

procedure RemoveFromList(var List: TList; Item: TObject);
begin
  if Assigned(List) then
  begin
    List.Remove(Item);
    if List.Count = 0 then
    begin
      List.Free;
      List := nil;
    end;
  end;
end;

function WindowIsMDIChild(W: HWND): Boolean;
var
  I: Integer;
  MainForm, ChildForm: TForm;
begin
  MainForm := Application.MainForm;
  if Assigned(MainForm) then
    for I := 0 to MainForm.MDIChildCount - 1 do
    begin
      ChildForm := MainForm.MDIChildren[I];
      if ChildForm.HandleAllocated and (ChildForm.Handle = W) then
      begin
        Result := True;
        Exit;
      end;
    end;
  Result := False;
end;

function CBTHook(Code: Integer; WParam: WParam; LParam: LParam): LRESULT; stdcall;
var
  Maximizing: Boolean;
  WindowPlacement: TWindowPlacement;
  I: Integer;
begin
  case Code of
    HCBT_SETFOCUS:
    begin
      if WindowIsMDIChild(HWND(WParam)) and Assigned(RibbonMDIButtonsList) then
      begin
        for I := 0 to RibbonMDIButtonsList.Count - 1 do
          TRibbonMDIButtons(RibbonMDIButtonsList[I]).InvalidateToolbar;
      end;
    end;
    HCBT_MINMAX:
    begin
      if WindowIsMDIChild(HWND(WParam)) and Assigned(RibbonMDIButtonsList) and (LParam in [SW_SHOWNORMAL, SW_SHOWMAXIMIZED, SW_MINIMIZE, SW_RESTORE]) then
      begin
        Maximizing := (LParam = SW_MAXIMIZE);
        if (LParam = SW_RESTORE) and not IsZoomed(HWND(WParam)) then
        begin
          WindowPlacement.length := SizeOf(WindowPlacement);
          GetWindowPlacement(HWND(WParam), @WindowPlacement);
          Maximizing := (WindowPlacement.flags and WPF_RESTORETOMAXIMIZED <> 0);
        end;
        for I := 0 to RibbonMDIButtonsList.Count - 1 do
          TRibbonMDIButtons(RibbonMDIButtonsList[I]).UpdateState(HWND(WParam), Maximizing);
      end;
    end;
    HCBT_DESTROYWND:
    begin
      if WindowIsMDIChild(HWND(WParam)) and Assigned(RibbonMDIButtonsList) then
        for I := 0 to RibbonMDIButtonsList.Count - 1 do
          TRibbonMDIButtons(RibbonMDIButtonsList[I]).UpdateState(HWND(WParam), False);
    end;
  end;
  Result := CallNextHookEx(CBTHookHandle, Code, WParam, LParam);
end;

constructor TRibbonMDIButtons.Create(AOwner: TImpRibbon);
begin
  FRibbon := AOwner;
  FMinimizeItem := TRibbonMDIButton.Create(AOwner);
  FRestoreItem := TRibbonMDIButton.Create(AOwner);
  FCloseItem := TRibbonMDIButton.Create(AOwner);

  FMinimizeItem.FButtonKind := mbkMDIMinimize;
  FRestoreItem.FButtonKind := mbkMDIRestore;
  FCloseItem.FButtonKind := mbkMDIClose;

  UpdateState(0, False);
  AddToList(RibbonMDIButtonsList, self);
  if CBTHookHandle = 0 then
    CBTHookHandle := SetWindowsHookEx(WH_CBT, CBTHook, 0, GetCurrentThreadId);
end;

destructor TRibbonMDIButtons.Destroy;
begin
  RemoveFromList(RibbonMDIButtonsList, self);

  if (CBTHookHandle <> 0) then
  begin
    UnhookWindowsHookEx(CBTHookHandle);
    CBTHookHandle := 0;
  end;

  FreeAndNil(FMinimizeItem);
  FreeAndNil(FRestoreItem);
  FreeAndNil(FCloseItem);
  inherited Destroy;
end;

procedure TRibbonMDIButtons.InvalidateToolbar;
begin
  FRibbon.InvalidateSubTitleButtons;
end;

procedure TRibbonMDIButtons.SetRect(const Value: TRect);
var
  W, h: Integer;
begin
  FRect := Value;
  if FMinimizeItem.Visible then
  begin
    W := FMinimizeItem.Width; // (Value.Right - Value.Left) div 3;
    h := FMinimizeItem.Height;
    if FRibbon.BiDiMode = bdLeftToRight then
    begin
      FMinimizeItem.BoundsRect := Rect(FRect.Left, FRect.Top, FRect.Left + W, FRect.Top + h);
      FRestoreItem.BoundsRect := Rect(FRect.Left + W, FRect.Top, FRect.Right - W, FRect.Top + h);
      FCloseItem.BoundsRect := Rect(FRect.Right - W, FRect.Top, FRect.Right, FRect.Top + h);
    end
    else
    begin
      FCloseItem.BoundsRect := Rect(FRect.Left, FRect.Top, FRect.Left + W, FRect.Top + h);
      FRestoreItem.BoundsRect := Rect(FRect.Left + W, FRect.Top, FRect.Right - W, FRect.Top + h);
      FMinimizeItem.BoundsRect := Rect(FRect.Right - W, FRect.Top, FRect.Right, FRect.Top + h);
    end;
  end;
end;

procedure TRibbonMDIButtons.UpdateState(W: HWND; Maximized: Boolean);
var
  HasMaxChild, VisibilityChanged: Boolean;

  procedure UpdateVisibleEnabled(const Button: TOffice2007Button; const AEnabled: Boolean);
  begin
    if (Button.Visible <> HasMaxChild) or (Button.Enabled <> AEnabled) then
    begin
      Button.Visible := HasMaxChild;
      Button.Enabled := AEnabled;
      VisibilityChanged := True;
    end;
  end;

var
  MainForm, ActiveMDIChild, ChildForm: TForm;
  I: Integer;
begin
  HasMaxChild := False;
  MainForm := Application.MainForm;
  ActiveMDIChild := nil;
  if Assigned(MainForm) then
  begin
    for I := 0 to MainForm.MDIChildCount - 1 do
    begin
      ChildForm := MainForm.MDIChildren[I];
      if ChildForm.HandleAllocated and (((ChildForm.Handle = W) and Maximized) or ((ChildForm.Handle <> W) and IsZoomed(ChildForm.Handle)))
        then
      begin
        HasMaxChild := True;
        Break;
      end;
    end;
    ActiveMDIChild := MainForm.ActiveMDIChild;
  end;

  VisibilityChanged := False;
  UpdateVisibleEnabled(FMinimizeItem, (ActiveMDIChild = nil) or (GetWindowLong(ActiveMDIChild.Handle, GWL_STYLE) and WS_MINIMIZEBOX <> 0));
  UpdateVisibleEnabled(FRestoreItem, True);
  UpdateVisibleEnabled(FCloseItem, True);

  if VisibilityChanged then
  begin
    if HasMaxChild then
      FButtonsWidth := FMinimizeItem.Width * 3
    else
      FButtonsWidth := 0;
    InvalidateToolbar;
  end;

  if Assigned(FRibbon.ApplicationMenu.Menu) then
    for I := 1 to FRibbon.ApplicationMenu.Menu.ControlCount - 1 do
      FRibbon.ApplicationMenu.Menu.Controls[I].Visible := False;
end;

{ TRibbonMDIButton }

constructor TRibbonMDIButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOwnerRibbon := nil;
  if AOwner is TImpRibbon then FOwnerRibbon := TImpRibbon(AOwner);
  Visible := False;
  Parent := FOwnerRibbon;
end;

procedure TRibbonMDIButton.Click;
var
  ChildForm: TForm;
  dwSysCommand: dword;
begin
  if Assigned(FOwnerRibbon.FParentForm) then
  begin
    ChildForm := TForm(FOwnerRibbon.FParentForm).ActiveMDIChild;
    if Assigned(ChildForm) then
    begin
      case FButtonKind of
        mbkMDIMinimize: dwSysCommand := SC_MINIMIZE;
        mbkMDIRestore:  dwSysCommand := SC_RESTORE;
        mbkMDIClose:    dwSysCommand := SC_CLOSE;
      end;
      SendMessage(ChildForm.Handle, WM_SYSCOMMAND, dwSysCommand, GetMessagePos);
    end;
  end;
end;

procedure TRibbonMDIButton.DrawImage;
var
  SkinForm: TSkinForm;
begin
  case FButtonKind of
    mbkMDIMinimize: SkinForm := sfMinimize;
    mbkMDIRestore:  SkinForm := sfRestore;
    mbkMDIClose:    SkinForm := sfClose;
  end;
  RibbonStyle.DrawElement(SkinForm, Canvas, ClientRect, -1);
end;

end.
