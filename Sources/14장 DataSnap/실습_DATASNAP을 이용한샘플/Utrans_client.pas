unit Utrans_client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sqlexpr, FMTBcd, DB, StdCtrls, Grids, DBGrids;

type
  TtransForm = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Button1: TButton;
    SqlServerMethod1: TSqlServerMethod;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  transForm: TtransForm;

implementation

uses UDM_client, UclientClass;

{$R *.dfm}

procedure TtransForm.Button1Click(Sender: TObject);
var
  demo : TServerMethods1Client;
begin
  demo := TServerMethods1Client.Create(Dm.SQLConnection1.DBXConnection);
  ShowMessage(IntTostr(Demo.Dept_Delete(DM.dept.FieldByName('CODE').asString)));
  dm.Dept.Refresh;
  dm.insa.Refresh;
end;

procedure TtransForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action := cafree;
end;

end.
