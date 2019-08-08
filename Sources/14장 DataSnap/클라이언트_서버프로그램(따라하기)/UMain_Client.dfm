object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #53364#46972#51060#50616#53944' '#47700#51064
  ClientHeight = 363
  ClientWidth = 529
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 8
    Width = 510
    Height = 25
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 48
    Width = 529
    Height = 120
    DataSource = DataSource1
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
    Left = 8
    Top = 325
    Width = 75
    Height = 25
    Caption = 'apply'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 119
    Top = 325
    Width = 75
    Height = 25
    Caption = 'cancel'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 230
    Top = 325
    Width = 75
    Height = 25
    Caption = 'load'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 335
    Top = 325
    Width = 75
    Height = 25
    Caption = 'save'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 443
    Top = 325
    Width = 75
    Height = 25
    Caption = 'EchoString'
    TabOrder = 6
    OnClick = Button6Click
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 184
    Width = 529
    Height = 120
    DataSource = DataSource2
    ImeName = 'Microsoft IME 2003'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object SqlServerMethod1: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftDataSet
        Name = 'ReturnParameter'
        ParamType = ptResult
      end>
    SQLConnection = ClientModule1.SQLConnection1
    ServerMethodName = 'TServerMethods1.get_dept'
    Left = 40
    Top = 264
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = ClientModule1.SQLConnection1
    Left = 152
    Top = 248
  end
  object clientDataset1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'deptprovider'
    RemoteServer = DSProviderConnection1
    OnReconcileError = clientDataset1ReconcileError
    Left = 440
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = clientDataset1
    OnDataChange = DataSource1DataChange
    Left = 480
    Top = 56
  end
  object ClientDataset2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'code'
        ParamType = ptInput
      end>
    ProviderName = 'insaqueryprovider'
    RemoteServer = DSProviderConnection1
    Left = 440
    Top = 264
  end
  object DataSource2: TDataSource
    DataSet = ClientDataset2
    Left = 480
    Top = 264
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SqlServerMethod1
    Left = 40
    Top = 208
  end
end
