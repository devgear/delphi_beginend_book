unit Umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ribbon, ActnMenus, RibbonActnMenus, ExtActns, ToolWin, ActnMan,
  ActnCtrls, StdActns, ActnList, RibbonLunaStyleActnCtrls, ImgList, Menus,
  StdCtrls, ComCtrls, AppEvnts,
  PlatformDefaultStyleActnCtrls;

type

  TMainForm = class(TForm)
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
    procedure ShowException(Sender:TObject; e:Exception);
  private
  end;
var
  MainForm: TMainForm;
implementation

uses uinsa, udept, udm, Utree, uAbout;

{$R *.dfm}


procedure TMainForm.insa_ActionExecute(Sender: TObject);
begin
  InsaForm := TInsaForm.Create(Application);
  InsaForm.show;
end;

procedure TMainForm.about_ActionExecute(Sender: TObject);
begin
  Aboutbox := TAboutBox.Create(Application);
  AboutBox.Showmodal;
  AboutBox.Free;
end;

procedure TMainForm.Create(Sender: TObject);
begin
 Application.OnException := ShowException;
end;
procedure TMainForm.dept_ActionExecute(Sender: TObject);
begin
  DeptForm := TDeptForm.Create(Application);
  DeptForm.show;
end;

procedure TMainForm.showexception(sender: tobject; e: exception);
begin
  if e is EAccessviolation then
     showmessage('억세스오류')
  else if e is EInvalidCast  then
     showmessage('as 연산자 오류')
  else if e is EIntError then
     showmessage('정수형오류')
  else Application.ShowException(e);
end;

procedure TMainForm.top_ActionExecute(Sender: TObject);
begin
   top_action.Checked := not top_action.Checked;
   if top_action.Checked  then
      formstyle := fsstayontop
   else
      formstyle := fsnormal;

end;

procedure TMainForm.treeview_ActionExecute(Sender: TObject);
begin
  treeform := ttreeform.create(application);
  treeform.show;
end;

end.
