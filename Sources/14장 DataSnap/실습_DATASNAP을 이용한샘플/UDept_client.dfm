object DeptForm: TDeptForm
  Left = 0
  Top = 0
  Caption = #48512#49436#44288#47532
  ClientHeight = 433
  ClientWidth = 725
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 48
    Width = 709
    Height = 161
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
  object PageControl1: TPageControl
    Left = 8
    Top = 215
    Width = 709
    Height = 210
    ActivePage = TabSheet4
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #49345#49464#51312#54924
      object DBGrid3: TDBGrid
        Left = 3
        Top = 3
        Width = 695
        Height = 176
        DataSource = DM.subinsaSource
        ImeName = 'Microsoft IME 2003'
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = #49345#49464#51312#54924'('#53244#47532')'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 3
        Top = 3
        Width = 695
        Height = 176
        DataSource = DM.insaquerySource
        ImeName = 'Microsoft IME 2003'
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabSheet3: TTabSheet
      Caption = #51064#50896#49688
      ImageIndex = 2
      object StringGrid1: TStringGrid
        Left = 3
        Top = 3
        Width = 686
        Height = 176
        ColCount = 3
        DrawingStyle = gdsClassic
        TabOrder = 0
        OnDrawCell = StringGrid1DrawCell
      end
    end
    object TabSheet4: TTabSheet
      Caption = #46321#47197'('#51200#51109#54532#47196#49884#51200')'
      ImageIndex = 3
      object Label1: TLabel
        Left = 72
        Top = 40
        Width = 48
        Height = 13
        Caption = #48512#49436#53076#46300
      end
      object Label2: TLabel
        Left = 72
        Top = 72
        Width = 36
        Height = 13
        Caption = #48512#49436#47749
      end
      object Label3: TLabel
        Left = 72
        Top = 119
        Width = 24
        Height = 13
        Caption = #54016#47749
      end
      object Edit1: TEdit
        Left = 160
        Top = 32
        Width = 121
        Height = 21
        ImeName = 'Microsoft IME 2003'
        MaxLength = 4
        TabOrder = 0
        OnChange = Edit1Change
        OnKeyDown = Edit1KeyDown
      end
      object Edit2: TEdit
        Left = 160
        Top = 72
        Width = 121
        Height = 21
        ImeName = 'Microsoft IME 2003'
        MaxLength = 6
        TabOrder = 1
        OnChange = Edit1Change
        OnKeyDown = Edit1KeyDown
      end
      object Edit3: TEdit
        Left = 160
        Top = 112
        Width = 121
        Height = 21
        ImeName = 'Microsoft IME 2003'
        MaxLength = 8
        TabOrder = 2
        OnChange = Edit1Change
        OnKeyDown = Edit1KeyDown
      end
      object Button1: TButton
        Left = 336
        Top = 112
        Width = 161
        Height = 33
        Caption = #46321#47197
        TabOrder = 3
        OnClick = Button1Click
      end
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 8
    Width = 530
    Height = 34
    DataSource = DM.DEPTSource
    TabOrder = 2
  end
  object Button2: TButton
    Left = 568
    Top = 8
    Width = 145
    Height = 34
    Caption = #50641#49472#47196#51200#51109
    TabOrder = 3
    OnClick = Button2Click
  end
  object SqlServerMethod1: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'Value'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ReturnParameter'
        ParamType = ptResult
        Size = 4
      end>
    SQLConnection = DM.SQLConnection1
    ServerMethodName = 'TServerMethods1.GetCount'
    Left = 464
    Top = 56
  end
  object SqlServerMethod2: TSqlServerMethod
    GetMetadata = False
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'pCode'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'pDept'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'pSection'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Precision = 4
        Name = 'ReturnParameter'
        ParamType = ptResult
        Size = 4
      end>
    SQLConnection = DM.SQLConnection1
    ServerMethodName = 'TServerMethods1.Dept_Insert'
    Left = 576
    Top = 64
  end
end
