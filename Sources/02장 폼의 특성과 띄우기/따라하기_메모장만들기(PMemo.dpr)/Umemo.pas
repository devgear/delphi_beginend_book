unit Umemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Ribbon, ActnMenus, RibbonActnMenus,
  ToolWin, ActnMan, ActnCtrls, ExtActns, StdActns, ActnList,
  RibbonLunaStyleActnCtrls, ImgList, GestureMgr, Menus, AppEvnts;

type
  TMemoForm = class(TForm)
    ImageList1: TImageList;
    ActionManager1: TActionManager;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    FileExit1: TFileExit;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    RichEditBold1: TRichEditBold;
    RichEditItalic1: TRichEditItalic;
    RichEditUnderline1: TRichEditUnderline;
    RichEditAlignLeft1: TRichEditAlignLeft;
    RichEditAlignRight1: TRichEditAlignRight;
    RichEditAlignCenter1: TRichEditAlignCenter;
    new_Action: TAction;
    top_Action: TAction;
    Ribbon1: TRibbon;
    RibbonPage1: TRibbonPage;
    RibbonPage2: TRibbonPage;
    RibbonPage3: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    RibbonGroup2: TRibbonGroup;
    RibbonGroup3: TRibbonGroup;
    RibbonGroup4: TRibbonGroup;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    RibbonQuickAccessToolbar1: TRibbonQuickAccessToolbar;
    RibbonGroup5: TRibbonGroup;
    RichEdit1: TRichEdit;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    GestureManager1: TGestureManager;
    PopupMenu1: TPopupMenu;
    Open1: TMenuItem;
    SaveAs1: TMenuItem;
    New1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    procedure Timer1Timer(Sender: TObject);
    procedure new_ActionExecute(Sender: TObject);
    procedure top_ActionExecute(Sender: TObject);
    procedure FileOpen1BeforeExecute(Sender: TObject);
    procedure FileOpen1Accept(Sender: TObject);
    procedure FileSaveAs1Accept(Sender: TObject);
    procedure FileSaveAs1BeforeExecute(Sender: TObject);
    procedure RichEdit1Gesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure Showhint(Sender:TObject);
    procedure FormCreate(Sender: TObject);
    procedure RichEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    function GetCurrPos(Richedit : TRichedit) : integer;
    function GetCurrLine(Richedit : TRichedit) : integer;
    { Public declarations }
  end;

var
  MemoForm: TMemoForm;

implementation

{$R *.dfm}


procedure TMemoForm.FileOpen1Accept(Sender: TObject);
begin
  RichEdit1.Lines.LoadFromFile(FileOpen1.Dialog.FileName);
  Ribbon1.AddRecentItem(FileOpen1.Dialog.FileName);
end;

procedure TMemoForm.FileOpen1BeforeExecute(Sender: TObject);
begin
  FileOpen1.Dialog.InitialDir := 'd:\';
  FileOpen1.Dialog.Filter  :=
  '텍스트화일|*.txt';
end;

procedure TMemoForm.FileSaveAs1Accept(Sender: TObject);
begin
  RichEdit1.Lines.SavetoFile(FileSaveAs1.Dialog.FileName);
end;

procedure TMemoForm.FileSaveAs1BeforeExecute(Sender: TObject);
begin
  FileSaveAs1.Dialog.InitialDir := 'd:\';
  FileSaveAs1.Dialog.Filter  :=
  '텍스트화일|*.txt';
end;


procedure TMemoForm.FormCreate(Sender: TObject);
begin
  application.OnHint := Showhint;
end;

function TMemoForm.GetCurrLine(Richedit: TRichedit): integer;
begin
 Result := Richedit1.Perform(EM_LINEFROMCHAR, Richedit.SelStart, 0);
end;

function TMemoForm.GetCurrPos(Richedit: TRichedit): integer;
begin
  Result := Richedit1.SelStart - Richedit.Perform(EM_LINEINDEX, GetCurrLine(RichEdit),0);
end;

procedure TMemoForm.new_ActionExecute(Sender: TObject);
begin
  RichEdit1.Lines.Clear;
end;

procedure TMemoForm.RichEdit1Change(Sender: TObject);
begin
  statusbar1.Panels[1].text :=
  Format('현재컬럼:%d 총 라인수:%d', [getcurrpos(Richedit1)+1, GetCurrLine(Richedit1)+1]);
end;

procedure TMemoForm.RichEdit1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = -1 then
     Showmessage('myz');
end;

procedure TMemoForm.Showhint(Sender: TObject);
begin
  statusbar1.Panels[0].Text := Application.Hint;
end;

procedure TMemoForm.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[2].Text :=
  Formatdatetime('yyyy-mmmm-dd dddd hh:nn:ss am/pm',Now);
end;

procedure TMemoForm.top_ActionExecute(Sender: TObject);
begin
  Top_action.Checked := not Top_action.Checked;
  if Top_action.Checked then
     Formstyle := fsStayonTop
  else
     Formstyle := fsNormal;

end;

end.
