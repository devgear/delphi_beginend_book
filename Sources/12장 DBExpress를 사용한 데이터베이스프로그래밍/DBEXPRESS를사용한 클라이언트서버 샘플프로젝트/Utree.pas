unit Utree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBTables, FMTBcd, SqlExpr;

type
  TTreeForm = class(TForm)
    TreeView1: TTreeView;
    ListView1: TListView;
    dept_Query: TSQLQuery;
    insa_Query: TSQLQuery;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeView1EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure FormResize(Sender: TObject);
  private
    CurrentNode: TTreeNode;
    CurrentPos: Char;
    GhostNode: TTreeNode;
    { Private declarations }
  public
    { Public declarations }
  end;

  deptrec = record
    code:string;
    section:string;
  end;
  deptrecptr = ^deptrec;

var
  TreeForm: TTreeForm;
  ptr:deptrecptr;
  oldwidth, oldheight : integer;

implementation

uses Udm;

{$R *.dfm}


procedure TTreeForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i,j:byte;
begin
  for i := 0 to treeview1.items.Count -1 do
     if treeview1.Items[i].data <> nil then
        dispose(deptrecptr(treeview1.items[i].Data));
  action := cafree;
end;

procedure TTreeForm.FormCreate(Sender: TObject);
var
  wk_dept:string;
begin
  oldwidth := width;
  oldheight := height;
  dept_query.Open;
  with dept_query, treeview1 do
  begin
    while not eof do
    begin
     new(ptr);
      if wk_dept <> fieldbyname('dept').asstring then
      begin
         Selected :=
         Items.Add(Selected,fieldbyname('dept').asstring);
         wk_dept := fieldbyname('dept').asstring;
      end;
      ptr^.code := fieldbyname('code').asstring;
      items.AddChildObject(selected,fieldbyname('section').asstring,ptr);
//      Items.AddChild(Selected,fieldbyname('section').asstring);
      next;
  end;
end;
end;
procedure TTreeForm.FormResize(Sender: TObject);
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

procedure TTreeForm.TreeView1Click(Sender: TObject);
var
  i:byte;
  listitem:tlistitem;
begin
  if not treeview1.Selected.HasChildren then
  begin
    insa_query.Close;
    insa_query.Params[0].AsString :=
    deptrecptr(treeview1.Selected.data)^.code;
    insa_query.open;

    listview1.Items.Clear;

    while not insa_query.eof do
    begin
       listitem := listview1.Items.Add;
       listitem.caption := insa_query.FieldByName('name').AsString;
       listitem.subitems.add(insa_query.FieldByName('class').AsString);
       insa_query.next;
    end;
  end;
end;

procedure TTreeForm.TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
  Node: TTreeNode;
  Expanded: Boolean;
begin
  if ( GhostNode <> nil ) and ( TTreeView(Sender).Selected <> nil ) then
   begin
     TTreeView(Sender).Items.BeginUpdate;
     try
       Node := TTreeView(Sender).Selected;
       Expanded := ( Node.Count > 0 ) and Node.Expanded;

       TTreeView(Sender).Selected.MoveTo( GhostNode, naInsert );

       Node.Expanded := Expanded;
       Node.Selected := True;
       Node.Focused := True;
     finally
       TTreeView(Sender).Items.EndUpdate;
     end;
   end;
end;

procedure TTreeForm.TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
const
  GhostText = 'ขั                ';
var
  Node: TTreeNode;
  HitPos: Char;
function GetHitPos: Char;
  var
    Rect: TRect;
  begin
    Rect := Node.DisplayRect( True );
    if ( Rect.Top <= Y ) and ( Y <= Rect.Bottom ) then
     begin
       if ( Rect.Right - X in [0..14] ) and
          ( ( Node.Count = 0 ) or ( ( Node.Count = 1 ) and ( Node.Item[0] = GhostNode ) ) ) then
        begin
          Result := 'R';
        end
       else
       if ( X - Rect.Left in [0..14] ) and
          ( ( Node.Parent <> nil ) and
          ( ( Node.GetNextSibling = nil ) or ( Node.GetNextSibling = GhostNode ) ) ) then
        begin
          Result := 'L';
        end
       else
        begin
          if ( Rect.Bottom - Y ) > ( Rect.Bottom - Rect.Top ) div 2 then Result := 'T'
                                                                    else Result := 'B';
        end;
     end
    else
     Result := #0;
  end;
begin
  Node := TTreeView(Sender).GetNodeAt( X, Y );

  if ( Node <> nil ) and ( Node <> GhostNode ) then
   begin
     HitPos := GetHitPos;

     if ( CurrentNode <> Node ) or ( CurrentPos <> HitPos ) and ( Node <> TTreeView(Sender).Selected ) then
      begin
        if GhostNode <> nil then GhostNode.Free;

        if HitPos <> #0 then
         begin
           GhostNode := TTreeNode.Create( TTreeView(Sender).Items );
           GhostNode.ImageIndex := -1;
         end
        else
         GhostNode := nil;

        case HitPos of
        'T': begin
               GhostNode := TTreeView(Sender).Items.InsertNode( GhostNode, Node, GhostText, nil );
             end;
        'B': begin
               if Node.GetNextSibling <> nil then GhostNode := TTreeView(Sender).Items.InsertNode( GhostNode, Node.GetNext, GhostText, nil )
                                             else GhostNode := TTreeView(Sender).Items.AddNode( GhostNode, Node, GhostText, nil, naAdd );
             end;
        'R': begin
               if Node.Count = 0 then
                begin
                  GhostNode := TTreeView(Sender).Items.AddNode( GhostNode, Node, GhostText, nil, naAddChild );
                  Node.Expand( True );
                end;
             end;
        'L': begin
               Node := Node.Parent;
               GhostNode := TTreeView(Sender).Items.AddNode( GhostNode, Node, GhostText, nil, naAdd );
             end;
        else Exit;
        end;
      end;

     CurrentNode := Node;
     CurrentPos := HitPos;

     ShowCursor( True );
   end;
end;

procedure TTreeForm.TreeView1EndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  if GhostNode <> nil then
   begin
     GhostNode.Free;
     GhostNode := nil;
   end;
end;

end.
