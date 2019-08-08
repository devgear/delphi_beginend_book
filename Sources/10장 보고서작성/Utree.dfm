object treeform: Ttreeform
  Left = 219
  Top = 115
  Caption = 'treeform'
  ClientHeight = 383
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TTreeView
    Left = 8
    Top = 8
    Width = 257
    Height = 369
    Indent = 19
    TabOrder = 0
    OnClick = TreeView1Click
  end
  object ListView1: TListView
    Left = 279
    Top = 8
    Width = 297
    Height = 369
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
  object dept_Query: TQuery
    DatabaseName = 'sample'
    SQL.Strings = (
      'select *  from dept'
      'order by dept, section')
    Left = 136
    Top = 16
  end
  object insa_Query: TQuery
    DatabaseName = 'sample'
    SQL.Strings = (
      'select name, class'
      'from insa'
      'where dept_code = :code ')
    Left = 192
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'code'
        ParamType = ptUnknown
      end>
  end
end
