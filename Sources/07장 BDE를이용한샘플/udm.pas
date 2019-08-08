unit udm;

interface

uses
  SysUtils, Classes, DB, DBTables, dialogs;

type

  TDm = class(TDataModule)
    Dept: TTable;
    DeptSource: TDataSource;
    Insa: TTable;
    InsaSource: TDataSource;
    InsaNAME: TStringField;
    InsaAGE: TSmallintField;
    InsaDEPT_CODE: TStringField;
    InsaCLASS: TStringField;
    InsaSALARY: TIntegerField;
    InsaPHOTO: TGraphicField;
    InsaGRADE: TStringField;
    Insatax: TFloatField;
    Insasection: TStringField;
    SubInsa: TTable;
    SubInsaSource: TDataSource;
    InsaQuery: TQuery;
    InsaQuery_Source: TDataSource;
    InsaID: TIntegerField;
    DeptCODE: TStringField;
    DeptDEPT: TStringField;
    DeptSECTION: TStringField;
    InsaIPSA_DATE: TDateField;
    procedure InsaCalcFields(DataSet: TDataSet);
    procedure insaSourceDataChange(Sender: TObject; Field: TField);
    procedure InsaAfterPost(DataSet: TDataSet);
    procedure InsaBeforeInsert(DataSet: TDataSet);
    procedure InsaNewRecord(DataSet: TDataSet);
    procedure insaSourceStateChange(Sender: TObject);
    procedure deptSourceDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

uses uinsa;

{$R *.dfm}

procedure TDm.deptSourceDataChange(Sender: TObject; Field: TField);
begin
//  insaquery.close;
//  insaquery.SQL.CLEAR;
//  insaquery.Sql.add('select * from insa where dept_code = :pcode');
//  insaquery.Params[0].asstring :=
//  dept.FieldByName('code').asstring;
//  insaquery.Open;
//  insaquery.execsql     :insert,delete,edit 실행
//  insaquery.parambyname('pcode').asstring :=
end;

procedure TDm.InsaAfterPost(DataSet: TDataSet);
begin
 ShowMessage(Format(' %s님은 %d번으로 등록 되었읍니다',[InsaName.Value, InsaId.Value]));
end;

procedure TDm.InsaBeforeInsert(DataSet: TDataSet);
begin
   Insaform.dbedit2.SetFocus;
end;

procedure TDm.InsaCalcFields(DataSet: TDataSet);
begin
 insatax.value := insasalary.value * 0.1;
end;

procedure TDm.InsaNewRecord(DataSet: TDataSet);
begin

  insaipsa_Date.Value := date;
end;

procedure TDm.insaSourceDataChange(Sender: TObject; Field: TField);
begin
  insaform.speedbutton1.enabled := not insa.Bof;
  insaform.speedbutton2.enabled := not insa.Bof;
  insaform.speedbutton3.enabled := not insa.eof;
  insaform.speedbutton4.enabled := not insa.eof;

end;

procedure TDm.insaSourceStateChange(Sender: TObject);
begin
  insaform.button1.Enabled := insa.State = dsbrowse;
  insaform.button2.Enabled := insa.State = dsbrowse;
  insaform.button3.Enabled := insa.state in [dsedit,dsinsert];
  insaform.button4.Enabled := insa.state in [dsedit,dsinsert];

end;

end.
