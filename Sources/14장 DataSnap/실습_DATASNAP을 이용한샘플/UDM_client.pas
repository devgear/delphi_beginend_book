unit UDM_client;

interface

uses
  SysUtils, Classes, DB, DBTables,Dialogs, WideStrings, DBXInterbase, DBClient,
  SimpleDS, SqlExpr,sqltimst, MConnect, DbxDatasnap, DSConnect, DBXCommon;

type
  einput = class(exception);

  TDM = class(TDataModule)
    DEPTSource: TDataSource;
    INSASource: TDataSource;
    subinsaSource: TDataSource;
    insaquerySource: TDataSource;
    dept: TClientDataSet;
    insa: TClientDataSet;
    insaID: TIntegerField;
    insaNAME: TStringField;
    insaAGE: TSmallintField;
    insaDEPT_CODE: TStringField;
    insaCLASS: TStringField;
    insaIPSA_DATE: TSQLTimeStampField;
    insaSALARY: TIntegerField;
    insaPHOTO: TBlobField;
    insaGRADE: TStringField;
    insatax: TFloatField;
    subinsa: TClientDataSet;
    insaquery: TClientDataSet;
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    procedure InsaCalcFields(DataSet: TDataSet);
    procedure InsaNewRecord(DataSet: TDataSet);
    procedure InsaBeforeInsert(DataSet: TDataSet);
    procedure InsaAfterPost(DataSet: TDataSet);
    procedure INSASourceStateChange(Sender: TObject);
    procedure INSASourceDataChange(Sender: TObject; Field: TField);
    procedure DEPTSourceDataChange(Sender: TObject; Field: TField);
    procedure insaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses Uinsa_client, URecError;

{$R *.dfm}

procedure TDM.DEPTSourceDataChange(Sender: TObject; Field: TField);
begin
 insaquery.Close;
 insaquery.params[0].asstring :=
 Dept.FieldByName('code').asString;
 insaquery.Open;
end;

procedure TDM.InsaAfterPost(DataSet: TDataSet);
begin
 ShowMessage(Format('%s님은 %d 번으로 등록되었습니다',[dm.insaname.Value,dm.InsaID.value]));
end;

procedure TDM.InsaBeforeInsert(DataSet: TDataSet);
begin
  Insaform.dbedit2.setfocus;
end;

procedure TDM.InsaCalcFields(DataSet: TDataSet);
begin
  insatax.value := insasalary.value * 0.1;
end;

procedure TDM.InsaNewRecord(DataSet: TDataSet);
begin
  Insaipsa_Date.value := datetimetosqltimestamp(now);
end;

procedure TDM.insaReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action:=HandleReconcileError(Dataset,Updatekind,E);
end;

procedure TDM.INSASourceDataChange(Sender: TObject; Field: TField);
begin
  insaform.SpeedButton1.Enabled := not insa.Bof;
  insaform.SpeedButton2.Enabled := not insa.Bof;
  insaform.SpeedButton3.Enabled := not insa.Eof;
  insaform.SpeedButton4.Enabled := not insa.Eof;
end;

procedure TDM.INSASourceStateChange(Sender: TObject);
begin
  insaform.Button1.Enabled := insa.State = dsbrowse;
  insaform.Button2.Enabled := insa.State = dsbrowse;
  insaform.Button3.Enabled := insa.State in [dsinsert,dsedit];
  insaform.Button4.Enabled := insa.State in [dsinsert,dsedit];
end;

end.
