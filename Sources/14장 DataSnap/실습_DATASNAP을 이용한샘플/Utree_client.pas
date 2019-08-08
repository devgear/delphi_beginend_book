unit Utree_client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBTables, FMTBcd, SqlExpr, DBClient;

type
  TTreeForm = class(TForm)
    TreeView1: TTreeView;
    ListView1: TListView;
    dept_query: TClientDataSet;
    insa_query: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeView1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  myrec = record
   code:string;
   dept:string;
  end;

  prt_myrec = ^myrec;

var
  TreeForm: TTreeForm;

implementation

uses UDM_client;
var
  wk_dept:string;
  prt:prt_myrec;

{$R *.dfm}

procedure TTreeForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i,j:byte;
begin
  for j := 0 to Treeview1.Items.Count - 1 do
    if treeview1.Items[j].Data <> nil then
       Dispose(prt_myrec(treeview1.Items[j].Data));

   action := cafree;
end;

procedure TTreeForm.FormCreate(Sender: TObject);
begin
  Dept_query.Open;
  with Dept_query, Treeview1 do
  Begin
    while Not Eof  do
    Begin
    if wk_Dept <> FieldByName('dept').asstring then
      Begin
        Selected :=
        items.add(Selected,FieldByName('dept').asstring);
        wk_dept := FieldByName('dept').asstring;
      End; // if
    new(prt);
    prt^.code := FieldByName('code').asstring;
    Items.AddChildobject(Selected,FieldByName('section').asstring,prt);
    Next;
    End; // while
  End;  // with
end;
procedure TTreeForm.TreeView1Click(Sender: TObject);
var
  ListItem:TListitem;
begin
  if not Treeview1.Selected.HasChildren then
  Begin
   Insa_Query.Close;
   Insa_Query.Params[0].AsString :=
   prt_myrec(TreeView1.Selected.Data)^.code;
   Insa_Query.Open;
   ListView1.Clear;
   while not Insa_Query.eof do
   Begin
   ListItem := ListView1.Items.add;
   ListItem.Caption :=
   Insa_Query.Fieldbyname('name').asstring;
   ListItem.SubItems.Add(Insa_Query.Fieldbyname('class').asstring);
   Insa_Query.Next;
   End;
  End;

end;

// procedure

end.
