object TransForm: TTransForm
  Left = 0
  Top = 0
  Caption = #53944#47004#51117#49496
  ClientHeight = 402
  ClientWidth = 574
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
    Left = 16
    Top = 56
    Width = 537
    Height = 169
    DataSource = dm.DeptSource
    ImeName = 'Microsoft IME 2003'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 24
    Top = 8
    Width = 360
    Height = 33
    DataSource = dm.DeptSource
    TabOrder = 1
  end
  object Button1: TButton
    Left = 408
    Top = 8
    Width = 145
    Height = 42
    Caption = #49325#51228
    TabOrder = 2
    OnClick = Button1Click
  end
  object DBGrid2: TDBGrid
    Left = 16
    Top = 240
    Width = 537
    Height = 137
    DataSource = dm.insaSource
    ImeName = 'Microsoft IME 2003'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.SQLConnection1
    Left = 496
    Top = 72
  end
end
