unit uClientMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FMTBcd, DB, SqlExpr, DBClient, DBCtrls, ExtCtrls, Grids,
  DBGrids, Buttons;

type
  TClientMainForm = class(TForm)
    Button2: TBitBtn;
    Button3: TBitBtn;
    Button1: TBitBtn;
    Button5: TBitBtn;
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientMainForm: TClientMainForm;

implementation

uses uClientOrderForm, uClientModuleUnit, uClientProductForm,
  uClientStatisticsForm, uClientMemberForm;

{$R *.dfm}

procedure TClientMainForm.Button1Click(Sender: TObject);
var
  MemberForm: TClientMemberForm;
begin
  MemberForm := TClientMemberForm.Create(Application);
  MemberForm.Show;
end;

procedure TClientMainForm.Button2Click(Sender: TObject);
var
  OrderForm: TClientOrderForm;
begin
  OrderForm := TClientOrderForm.Create(Application);
  OrderForm.Show;
end;



procedure TClientMainForm.Button3Click(Sender: TObject);
var
  ProductForm: TClientProductForm;
begin
  ProductForm := TClientProductForm.Create(Application);
  ProductForm.Show;
end;

procedure TClientMainForm.Button5Click(Sender: TObject);
var
  StatisticsForm: TStatisticsForm;
begin
  StatisticsForm := TStatisticsForm.Create(Application);
  StatisticsForm.Show;
end;

procedure TClientMainForm.FormActivate(Sender: TObject);
begin
  ClientModule.SQLConnection.Connected := True;
end;

end.
