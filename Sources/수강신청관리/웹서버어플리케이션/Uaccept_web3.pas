unit Uaccept_web3;

interface

uses
  Classes, SysUtils, IWApplication, IWTypes, IWPageForm, IWInit, IWLicenseKey,
  IWCompButton, IWCompEdit, IWDBStdCtrls, GIFImg, IWExtCtrls, Controls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompLabel;

type
  TacceptForm = class(TIWPageForm)
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    IWLabel7: TIWLabel;
    IWLabel8: TIWLabel;
    IWLabel9: TIWLabel;
    IWLabel10: TIWLabel;
    IWLabel11: TIWLabel;
    IWImage1: TIWImage;
    IWLabel12: TIWLabel;
    IWLabel13: TIWLabel;
    IWDBEdit1: TIWDBEdit;
    IWDBEdit2: TIWDBEdit;
    IWDBEdit3: TIWDBEdit;
    IWDBEdit4: TIWDBEdit;
    IWDBEdit5: TIWDBEdit;
    IWDBEdit6: TIWDBEdit;
    IWDBEdit7: TIWDBEdit;
    IWDBEdit8: TIWDBEdit;
    IWDBEdit9: TIWDBEdit;
    IWDBEdit10: TIWDBEdit;
    IWDBEdit11: TIWDBEdit;
    IWButton1: TIWButton;
    IWButton2: TIWButton;
  public
  end;

implementation

{$R *.dfm}

initialization
  TacceptForm.RegisterPage;


end.