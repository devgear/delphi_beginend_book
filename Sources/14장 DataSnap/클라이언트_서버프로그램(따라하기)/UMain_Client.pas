unit UMain_Client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, StdCtrls, DB, SqlExpr, Grids, DBGrids, ExtCtrls, DBCtrls,
  DBClient, DSConnect, Provider;

type
  TForm1 = class(TForm)
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    SqlServerMethod1: TSqlServerMethod;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    DBGrid2: TDBGrid;
    DSProviderConnection1: TDSProviderConnection;
    clientDataset1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataset2: TClientDataSet;
    DataSource2: TDataSource;
    DataSetProvider1: TDataSetProvider;
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure clientDataset1ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ClientModuleUnit1, ClientClassesUnit1, RecError;
var
  Demo :TServerMethods1Client;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ClientDataset1.ApplyUpdates(-1);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ClientDataset1.CancelUpdates;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ClientDataset1.LoadFromFile('sample.cds');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ClientDataset1.SaveToFile('sample.cds');
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Demo := TServerMethods1Client.Create(ClientModule1.SQLConnection1.DBXConnection);
  ShowMessage(Demo.EchoString('hi'));
  Demo.Free;
end;

procedure TForm1.clientDataset1ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind,E);
end;


procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  ClientDataset2.Close;
  ClientDataset2.Params[0].AsString :=
  ClientDataset1.fieldbyname('code').AsString;
  ClientDataset2.Open;
end;

end.
