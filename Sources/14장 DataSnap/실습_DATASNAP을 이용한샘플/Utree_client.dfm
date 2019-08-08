object TreeForm: TTreeForm
  Left = 0
  Top = 0
  Caption = #51312#51649#46020
  ClientHeight = 350
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    415
    350)
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TTreeView
    Left = 8
    Top = 16
    Width = 193
    Height = 321
    Anchors = [akLeft, akTop, akRight, akBottom]
    Indent = 19
    TabOrder = 0
    OnClick = TreeView1Click
  end
  object ListView1: TListView
    Left = 207
    Top = 16
    Width = 200
    Height = 321
    Anchors = [akLeft, akTop, akRight, akBottom]
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
  object dept_query: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dept_queryProvider'
    RemoteServer = DM.DSProviderConnection1
    Left = 40
    Top = 40
  end
  object insa_query: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'code'
        ParamType = ptInput
      end>
    ProviderName = 'insa_queryProvider'
    RemoteServer = DM.DSProviderConnection1
    Left = 296
    Top = 40
  end
end
