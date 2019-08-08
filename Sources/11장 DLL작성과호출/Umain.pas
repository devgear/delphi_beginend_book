unit Umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ribbon, ActnMenus, RibbonActnMenus, ExtActns, ToolWin, ActnMan,
  ActnCtrls, StdActns, ActnList, RibbonLunaStyleActnCtrls, ImgList, Menus,
  StdCtrls, ComCtrls, AppEvnts,
  PlatformDefaultStyleActnCtrls;

type

  Tmainform = class(TForm)
    ImageList1: TImageList;
    ActionManager1: TActionManager;
    dept_Action: TAction;
    insa_Action: TAction;
    treeview_Action: TAction;
    about_Action: TAction;
    top_Action: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    About1: TMenuItem;
    N4: TMenuItem;
    ActionMainMenuBar1: TActionMainMenuBar;
    CoolBar1: TCoolBar;
    ActionToolBar1: TActionToolBar;
    ActionToolBar2: TActionToolBar;
    ApplicationEvents1: TApplicationEvents;
    procedure Create(Sender: TObject);
    procedure about_ActionExecute(Sender: TObject);
    procedure top_ActionExecute(Sender: TObject);
    procedure insa_ActionExecute(Sender: TObject);
    procedure dept_ActionExecute(Sender: TObject);
    procedure treeview_ActionExecute(Sender: TObject);
    procedure showexception(sender:tobject; e:exception);
  private
  end;

TAboutProc = Procedure; stdcall;
var
  Mainform: Tmainform;
  AboutProc:TAboutProc;
  h:tHandle;

implementation

uses uinsa, udept, udm, Utree, uAbout;
//procedure Display_About; stdcall;
//external './Debug/Win32/PAboutbox.dll' delayed;
//같은 디렉토리시는 Path는 생략해도 됩니다.

{$R *.dfm}


procedure Tmainform.insa_ActionExecute(Sender: TObject);
begin
  Insaform := TInsaform.Create(Application);
  Insaform.Show;
end;

procedure Tmainform.about_ActionExecute(Sender: TObject);
begin
//  정적 호출방법
//  Display_About;
// 다이나믹 호출 방법
  h := LoadLibrary('./Debug/Win32/PAboutbox.dll');
//같은 디렉토리시는 Path는 PAboutbox.dll');
  if h < 32 then
     raise Exception.Create('그런 dll 없음');
  @AboutProc := GetProcAddress(h, 'Display_About');
  AboutProc;
  FreeLibrary(h);
end;

procedure Tmainform.Create(Sender: TObject);
begin
application.OnException := showexception;
end;
procedure Tmainform.dept_ActionExecute(Sender: TObject);
begin
  deptform := tdeptform.create(application);
  deptform.show;
end;

procedure Tmainform.showexception(sender: tobject; e: exception);
begin
  if e is eaccessviolation then
     showmessage('억세스오류')
  else if e is einvalidcast  then
     showmessage('as 연산자 오류')
  else if e is einterror then
     showmessage('정수형오류')
  else application.showexception(e);
end;

procedure Tmainform.top_ActionExecute(Sender: TObject);
begin
   top_action.Checked := not top_action.Checked;
   if top_action.Checked  then
      formstyle := fsstayontop
   else
      formstyle := fsnormal;

end;

procedure Tmainform.treeview_ActionExecute(Sender: TObject);
begin
  treeform := ttreeform.create(application);
  treeform.show;
end;

end.
