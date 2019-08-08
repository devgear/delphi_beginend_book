unit Umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnCtrls, ActnMan, ActnMenus, ToolWin, ComCtrls, ActnList, ImgList,
  PlatformDefaultStyleActnCtrls, ExtCtrls;

type
  TmainForm = class(TForm)
    ActionManager1: TActionManager;
    ImageList1: TImageList;
    Accept_Action: TAction;
    student_action: TAction;
    RollBook_Action: TAction;
    Certificaion_Action: TAction;
    curri_action: TAction;
    Action5: TAction;
    printsertup_Action: TAction;
    CoolBar1: TCoolBar;
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionToolBar1: TActionToolBar;
    ActionToolBar2: TActionToolBar;
    listofCustomer_Action: TAction;
    ListOfCurri_Action: TAction;
    ListOfRoom_Action: TAction;
    custregister_Action: TAction;
    announce_Action: TAction;
    CurriOpen_Action: TAction;
    curriappend_Action: TAction;
    Email_Action: TAction;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    procedure ddd(Sender: TObject);
    procedure Accept_ActionExecute(Sender: TObject);
    procedure curriappend_ActionExecute(Sender: TObject);
    procedure custregister_ActionExecute(Sender: TObject);
    procedure Email_ActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainForm: TmainForm;

implementation

uses UAccept, UGridforCurri, Ucustomer, Umail;

{$R *.dfm}

procedure TmainForm.Accept_ActionExecute(Sender: TObject);
begin
  Form_Accept := TForm_Accept.Create(Application);
  Form_Accept.Show;
end;

procedure TmainForm.curriappend_ActionExecute(Sender: TObject);
begin
Form_GridforCurri := TForm_GridforCurri.Create(Application);
Form_GridforCurri.Show;
end;

procedure TmainForm.custregister_ActionExecute(Sender: TObject);
begin
  Form_Customer := TForm_Customer.Create(Application);
  Form_Customer.Show;
end;

procedure TmainForm.ddd(Sender: TObject);
begin
//  StatusBar1.Panels[1].text :=
//  FormatDateTime('yyyy-mmmm-dd dddd hh:nn:ss am/pm', now);
end;

procedure TmainForm.Email_ActionExecute(Sender: TObject);
begin
  Form_Mail := TForm_Mail.Create(Application);
  Form_Mail.Show;
end;

end.
