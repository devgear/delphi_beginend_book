unit Utree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ComCtrls;

type
  Ttreeform = class(TForm)
    TreeView1: TTreeView;
    ListView1: TListView;
    dept_Query: TQuery;
    insa_Query: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeView1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  treeform: Ttreeform;

implementation

uses Udm;

type
  deptrec = record
    code : string;
    section : string;
  end;
  deptrecptr = ^deptrec;
var
  prt : deptrecptr;
  oldwidth, oldheight : integer;
{$R *.dfm}

procedure Ttreeform.FormCreate(Sender: TObject);
var
  wk_dept, wk_code : string;
begin
  oldwidth := width;
  oldheight := height;
  dept_query.Close;
  dept_query.Open;
    with dept_query, treeview1 do
    begin
      while not eof do begin
        new(prt);
        if wk_dept <> fieldbyname('dept').AsString then
          selected := items.add(selected, fieldbyname('dept').AsString);
        prt^.code := fieldbyname('code').AsString;
        prt^.section := fieldbyname('section').asstring;
        items.AddChildObject(selected, fieldbyname('section').AsString, prt);
        wk_dept := fieldbyname('dept').asstring;
        next;
      end;
    end;


end;

procedure Ttreeform.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i,j:byte;
begin
  for i := 0 to treeview1.items.count - 1 do
   if treeview1.Items[i].Data <> nil then
      dispose(deptrecptr(treeview1.items[i].data));

  action := cafree;
end;

procedure Ttreeform.TreeView1Click(Sender: TObject);
var
  i:byte;
  listitem : Tlistitem;

begin
  if not treeview1.Selected.HasChildren then
  begin
    insa_query.Close;
    insa_query.Params[0].asstring :=
    deptrecptr(treeview1.selected.Data)^.code;
    insa_query.Open;
    listview1.Items.Clear;

      while not insa_query .eof do
      begin
        listitem := listview1.Items.add;
        listitem.Caption := insa_query.fieldbyname('name').AsString;
        listitem.SubItems.add(insa_query.fieldbyname('class').asstring);
        insa_query.Next;
      end;
  end;
end;

procedure Ttreeform.FormActivate(Sender: TObject);
begin
  caption := inttostr(treeview1.items.count);
end;

procedure Ttreeform.FormResize(Sender: TObject);
var
  t,px,py : real ;
  i : byte ;
begin
  px := oldwidth / width;
  py := oldheight / height;

  for i := 0 to componentcount -1 do
    if components[i] is tcontrol then
    begin
      t := (components[i] as tcontrol).Left;
      (components[i] as tcontrol).left := trunc(t/px);

      t := (components[i] as tcontrol).Top;
      (components[i] as tcontrol).Top := trunc(t/py);

      t := (components[i] as tcontrol).Width;
      (components[i] as tcontrol).Width := trunc(t/px);

      t := (components[i] as tcontrol).height;
      (components[i] as tcontrol).height := trunc(t/py);

    end;
  oldwidth := width ;
  oldheight := height;



end;

end.
