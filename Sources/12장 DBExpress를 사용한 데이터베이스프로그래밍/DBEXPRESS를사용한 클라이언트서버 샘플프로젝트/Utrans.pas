unit Utrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, SqlExpr, StdCtrls, ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TTransForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    DBGrid2: TDBGrid;
    SQLQuery1: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TransForm: TTransForm;

implementation

uses Udm;

var
  transdesc:ttransactiondesc;
{$R *.dfm}

procedure TTransForm.Button1Click(Sender: TObject);
begin
  dm.SQLConnection1.StartTransaction(transdesc);
//  try
    try
      sqlquery1.Close;
      sqlquery1.sql.Clear;
      sqlquery1.SQL.Add('delete fram insa where dept_code = :code');
      sqlquery1.Params[0].asstring :=
      dm.Dept.FieldByName('code').AsString;
      sqlquery1.execsql;
     except
      showmessage('query error');
//      raise;
      abort;     //raise eabort.create('xxx');
     end;

    try
     dm.Dept.Delete;
     dm.Dept.ApplyUpdates(-1);
    except
     showmessage('부서 삭제 오류');
     raise;
    end;

    dm.SQLConnection1.commit(transdesc);
//  except
    dm.SQLConnection1.Rollback(transdesc);
//  end;
  dm.Dept.Refresh;
  dm.INSA.Refresh;
end;

procedure TTransForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

initialization
begin
  transdesc.TransactionID := 1;
  transdesc.IsolationLevel := xilreadcommitted;
end;
end.
