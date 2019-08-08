unit Umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ActnCtrls, ToolWin, ActnMan, ActnMenus, ActnList,
  ImgList, PlatformDefaultStyleActnCtrls, AppEvnts;

type

  taboutproc = procedure; stdcall;

  TmainForm = class(TForm)
    ActionManager1: TActionManager;
    ImageList1: TImageList;
    dept_Action: TAction;
    insa_action: TAction;
    treeview_action: TAction;
    about_action: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    CoolBar1: TCoolBar;
    ActionToolBar1: TActionToolBar;
    ActionToolBar2: TActionToolBar;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    ApplicationEvents1: TApplicationEvents;
    TRANS_Action: TAction;
    help_Action: TAction;
    procedure Tisbarmer1Timer(Sender: TObject);
    procedure insa_actionExecute(Sender: TObject);
    procedure dept_ActionExecute(Sender: TObject);
    procedure treeview_actionExecute(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure about_actionExecute(Sender: TObject);
    procedure TRANS_ActionExecute(Sender: TObject);
    procedure help_ActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainForm: TmainForm;
  aboutproc:taboutproc;
  h:thandle;
implementation

uses Uinsa, Udept, Utree, Utrans;
//procedure display_about; stdcall;
//external 'paboutbox.dll' delayed; ½ÇÁ¦ È£­ŒµÉ ¶§ ·Îµå 2010

//procedure display_about; stdcall;
//external 'paboutbox.dll';  static ÇÁ·Î±×·¥ ¶ß¸é¼­ºÎÅÍ ·Îµå

{$R *.dfm}

procedure TmainForm.about_actionExecute(Sender: TObject);
begin
  h := loadlibrary('Paboutbox.dll');
  if h < 32 then
     raise Exception.Create('±×·± ¶óÀÌºê·¯¸® ¾øÀ½');
  @aboutproc := getprocaddress(h,'display_about');
  aboutproc;

  freelibrary(h);

//    display_about;
end;

procedure TmainForm.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  if e is eaccessviolation then
     showmessage('¾ï¼¼½º ¿À·ù')
  else if e is econverterror then
     showmessage('Çüº¯È¯ ¿À·ù')
  else if e is einvalidcast then
     showmessage('as ¿¬»êÀÚ ¿À·ù')
  else if e is eoutofmemory then
     showmessage('¸Þ¸ð¸® ºÎÁ· ¿À·ù')
  else application.ShowException(e);
end;

procedure TmainForm.dept_ActionExecute(Sender: TObject);
begin
  deptform := tdeptform.create(application);
  deptform.show;
end;

procedure TmainForm.help_ActionExecute(Sender: TObject);
begin
//     application.helpfile := 'mastapp.hlp';
//7.0  application.helpcommand(help_contents,0);
//     winhelp(application.handle, 'mastapp.hlp', help_contents,0);
end;


procedure TmainForm.insa_actionExecute(Sender: TObject);
begin
  insaform := tinsaform.create(application);
  insaform.show;
end;

procedure TmainForm.Tisbarmer1Timer(Sender: TObject);
begin
  statusbar1.panels[1].text  :=
  formatdatetime('yyyy-mm-dd hh:nn:ss' , now);
end;

procedure TmainForm.TRANS_ActionExecute(Sender: TObject);
begin
  transForm := ttransForm.create(application);
  transform.show;
end;
procedure TmainForm.treeview_actionExecute(Sender: TObject);
begin
  treeform := ttreeform.create(application);
  treeform.show;

end;

end.
