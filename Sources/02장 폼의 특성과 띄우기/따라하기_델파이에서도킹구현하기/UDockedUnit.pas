unit UDockedUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TDocked_Form = class(TForm)
    Panel_Message: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Docked_Form: TDocked_Form;

implementation

{$R *.dfm}

procedure TDocked_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

end.
