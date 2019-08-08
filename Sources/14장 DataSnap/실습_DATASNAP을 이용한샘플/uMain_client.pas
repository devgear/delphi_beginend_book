unit uMain_client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ActnCtrls, ActnMan, ActnMenus, ToolWin, ActnList,
  PlatformDefaultStyleActnCtrls, ImgList, Menus, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave;

type
  taboutproc = procedure; stdcall;
  taddproc = function(x,y:integer):integer; stdcall;

  Tmainform = class(TForm)
    ImageList1: TImageList;
    ActionManager1: TActionManager;
    dept_Action: TAction;
    insa_Action: TAction;
    treeview_Action: TAction;
    about_Action: TAction;
    top_Action: TAction;
    CoolBar1: TCoolBar;
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionToolBar1: TActionToolBar;
    ActionToolBar2: TActionToolBar;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    trans_Action: TAction;
    deptreport_Action: TAction;
    insareport_Action: TAction;
    TrayIcon1: TTrayIcon;
    BalloonHint1: TBalloonHint;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RvDataSetConnection1: TRvDataSetConnection;
    procedure Timer1Timer(Sender: TObject);
    procedure insa_ActionExecute(Sender: TObject);
    procedure dept_ActionExecute(Sender: TObject);
    procedure treeview_ActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure myhandler(sender:tobject; e:exception);
    procedure trans_ActionExecute(Sender: TObject);
    procedure TrayIcon1Animate(Sender: TObject);
    procedure insareport_ActionExecute(Sender: TObject);
    procedure about_ActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainform: Tmainform;
  aboutproc:taboutproc;
  addproc:taddproc;
  h:thandle;

implementation

uses UDept_client, UDM_client, Uinsa_client, Utrans_client, Utree_client;

//procedure display_about; stdcall;
//external 'paboutbox.dll';

{$R *.dfm}

procedure Tmainform.about_ActionExecute(Sender: TObject);
begin
  h := loadlibrary('paboutbox.dll');
  if h < 32  then
     raise exception.Create('그런 라이브러리 없음');

  @aboutproc := getprocaddress(h,'display_about');
  aboutproc;

  @addproc := getprocaddress(h,'add');
  caption := inttostr(addproc(2,3));

  Freelibrary(h);
end;

procedure Tmainform.dept_ActionExecute(Sender: TObject);
begin
  DeptForm := tDeptForm.Create(Application);
  DeptForm.Show;
end;

procedure Tmainform.FormCreate(Sender: TObject);
begin
  application.onexception := myhandler;
  left := 0;
  top := 0;
end;

procedure Tmainform.insareport_ActionExecute(Sender: TObject);
begin
  RvProject1.ExecuteReport('insareport');
end;

procedure Tmainform.insa_ActionExecute(Sender: TObject);
begin

   InsaForm := tInsaForm.Create(Application);
   InsaForm.Show;

end;

procedure Tmainform.myhandler(sender: tobject; e: exception);
begin
  if e is einterror then
     showmessage('정수형 오류')
  else if e is econverterror  then
     showmessage('변환 오류')
  else if e is eaccessviolation then
     showmessage('개제 인스턴스 접근 불가')
  else if e is einvalidcast  then
     showmessage('as 연산자 오류')
  else if e is eoutofmemory  then
     showmessage('메모리 부족')
  else application.ShowException(e);
end;

procedure Tmainform.Timer1Timer(Sender: TObject);
begin
  statusbar1.Panels[1].text :=
  formatdatetime('yyyy-mm-dd mmmm hh:nn:ss am/pm',now);
end;

procedure Tmainform.trans_ActionExecute(Sender: TObject);
begin
  TransForm := TtransForm.create(application);
  TransForm.show;
end;

procedure Tmainform.TrayIcon1Animate(Sender: TObject);
begin
  showmessage('aaa');
end;

procedure Tmainform.treeview_ActionExecute(Sender: TObject);
begin
  treeForm := ttreeform.create(application);
  treeform.show;
end;

end.
