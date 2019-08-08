object transForm: TtransForm
  Left = 0
  Top = 0
  Caption = 'transForm'
  ClientHeight = 387
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 551
    Height = 145
    DataSource = DM.DEPTSource
    ImeName = 'Microsoft IME 2003'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 159
    Width = 551
    Height = 154
    DataSource = DM.INSASource
    ImeName = 'Microsoft IME 2003'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 48
    Top = 336
    Width = 105
    Height = 33
    Caption = #49325#51228
    TabOrder = 2
    OnClick = Button1Click
  end
  object SqlServerMethod1: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'Param1'
        ParamType = ptInputOutput
        Size = 2000
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ReturnParameter'
        ParamType = ptResult
        Size = 4
      end>
    SQLConnection = DM.SQLConnection1
    ServerMethodName = 'TServerMethods1.delete_dept'
    Left = 128
    Top = 24
  end
end
