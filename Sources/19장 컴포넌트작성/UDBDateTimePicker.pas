unit UDBDateTimePicker;

interface

uses
  SysUtils,Dialogs, Classes, Controls, db,DBCtrls,ComCtrls;

type
  TDBDateTimePicker = class(TDateTimePicker)
  private
    FDataLink:TfieldDataLink;
    Function GetDataField: String;
    Function GetDataSource:TDataSource;
    procedure SetDataSource(const Value: TDataSource);
    procedure SetDataField(const Value: String);
    Procedure DataChange(Sender:TObject);
    procedure change; override;
    procedure updateData(Sender:Tobject);
       { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(aowner:TComponent); override;
    Destructor Destroy; Override;
    { Public declarations }
  published
    Property DataField:String read GetDataField write SetDataField;
    property DataSource:TDataSource read GetDataSource write SetDataSource;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TDBDateTimePicker]);
end;

{ TDBDateTimePicker }

procedure TDBDateTimePicker.change;
begin
  if not FdataLink.Editing then
     FdataLink.Edit;
  FdataLink.Modified;
  inherited;

end;

constructor TDBDateTimePicker.Create(aowner: TComponent);
begin
  inherited;
  FdataLink := TfieldDataLink.Create;
  FdataLink.OnDataChange := Datachange;
  FdataLink.onUpdateData := Updatedata;
end;

procedure TDBDateTimePicker.DataChange(Sender: TObject);
begin
  if Assigned(FDataLink.Datasource) and Assigned(FDataLink.Field) then
     Self.Date := FDataLink.Field.AsDateTime;

end;

destructor TDBDateTimePicker.Destroy;
begin
  FDataLink.Free;
  inherited;
end;

function TDBDateTimePicker.GetDataField: String;
begin
    Result := FDataLink.FieldName;
end;

function TDBDateTimePicker.GetDataSource: TDataSource;
begin
    Result := FDataLink.DataSource;
end;

procedure TDBDateTimePicker.SetDataField(const Value: String);
begin
  FDataLink.FieldName := Value;
end;

procedure TDBDateTimePicker.SetDataSource(const Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;

procedure TDBDateTimePicker.updateData(Sender:Tobject);
begin
  if Assigned(FDataLink.Datasource) and Assigned(FDataLink.Field) then
     FDataLink.Field.AsDateTime := Self.Date;

end;
end.
