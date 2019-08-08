object TreeForm: TTreeForm
  Left = 0
  Top = 0
  Caption = #51312#51649#46020
  ClientHeight = 330
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TTreeView
    Left = 8
    Top = 8
    Width = 201
    Height = 314
    Indent = 19
    TabOrder = 0
    OnClick = TreeView1Click
    OnDragDrop = TreeView1DragDrop
    OnDragOver = TreeView1DragOver
    OnEndDrag = TreeView1EndDrag
  end
  object ListView1: TListView
    Left = 215
    Top = 8
    Width = 217
    Height = 314
    Columns = <
      item
        Caption = #51060#47492
      end
      item
        Caption = #51649#44553
      end>
    TabOrder = 1
    ViewStyle = vsReport
  end
  object dept_Query: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from dept'
      'order by dept,section')
    SQLConnection = dm.SQLConnection1
    Left = 40
    Top = 16
  end
  object insa_Query: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'code'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select name,class'
      'from insa'
      'where dept_code =:code')
    SQLConnection = dm.SQLConnection1
    Left = 368
    Top = 40
  end
end
