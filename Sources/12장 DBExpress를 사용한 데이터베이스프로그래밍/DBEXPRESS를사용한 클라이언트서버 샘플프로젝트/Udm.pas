unit Udm;

interface

uses
  SysUtils, Classes, DB, DBTables, dialogs, DBXInterBase, DBClient, SimpleDS,
  SqlExpr,sqltimst;

type
  Tdm = class(TDataModule)
    insaSource: TDataSource;
    DeptSource: TDataSource;
    subinsaSource: TDataSource;
    insaquerySource: TDataSource;
    SQLConnection1: TSQLConnection;
    INSA: TSimpleDataSet;
    INSAID: TIntegerField;
    INSANAME: TStringField;
    INSAAGE: TSmallintField;
    INSADEPT_CODE: TStringField;
    INSACLASS: TStringField;
    INSAIPSA_DATE: TSQLTimeStampField;
    INSASALARY: TIntegerField;
    INSAPHOTO: TBlobField;
    INSAGRADE: TStringField;
    INSATAX: TFloatField;
    Dept: TSimpleDataSet;
    subinsa: TSimpleDataSet;
    insaquery: TSimpleDataSet;
    procedure insaCalcFields(DataSet: TDataSet);
    procedure insaNewRecord(DataSet: TDataSet);
    procedure insaBeforeInsert(DataSet: TDataSet);
    procedure insaAfterPost(DataSet: TDataSet);
    procedure insaSourceStateChange(Sender: TObject);
    procedure insaSourceDataChange(Sender: TObject; Field: TField);
    procedure DeptSourceDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses Uinsa;

{$R *.dfm}

procedure Tdm.DeptSourceDataChange(Sender: TObject; Field: TField);
begin
  insaquery.Close;
  insaquery.dataset.Params[0].AsString :=
  dept.FieldByName('code').asstring;
//  insaquery.Parambyname('pcode').AsString :=
  insaquery.Open;
// select :query1.open
//insert, delete,update :query1.execsql
// 동적 sql
// query1.close;
// query1.sql.clear;
// query1.sql.add('select * from insa where dept_code = :pcode');

end;

procedure Tdm.insaAfterPost(DataSet: TDataSet);
begin
  showmessage(format('%s님의 사번은 %d입니다',[insaname.Value, insaid.Value]));
end;

procedure Tdm.insaBeforeInsert(DataSet: TDataSet);
begin
  insaform.dbedit2.setfocus;
end;

procedure Tdm.insaCalcFields(DataSet: TDataSet);
begin
  insatax.Value := insasalary.value * 0.1;
end;

procedure Tdm.insaNewRecord(DataSet: TDataSet);
begin
  insaipsa_date.Value := datetimetosqltimestamp(date);
  insagrade.Value := '3';
  insasalary.value := 200000;
end;

procedure Tdm.insaSourceDataChange(Sender: TObject; Field: TField);
begin
  insaform.SpeedButton1.Enabled := not insa.bof;
  insaform.SpeedButton3.Enabled := not insa.bof;
  insaform.SpeedButton2.Enabled := not insa.eof;
  insaform.SpeedButton4.Enabled := not insa.eof;
end;

procedure Tdm.insaSourceStateChange(Sender: TObject);
begin
  insaform.Button1.Enabled := insa.State = dsbrowse;
  insaform.Button2.Enabled := insa.State = dsbrowse;
  insaform.Button3.Enabled := insa.State in [dsinsert, dsedit];
  insaform.Button4.Enabled := insa.State in [dsinsert, dsedit];
end;

end.
