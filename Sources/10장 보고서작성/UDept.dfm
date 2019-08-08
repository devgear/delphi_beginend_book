object DeptForm: TDeptForm
  Left = 0
  Top = 0
  Caption = 'DeptForm'
  ClientHeight = 441
  ClientWidth = 533
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
    Width = 527
    Height = 169
    DataSource = Dm.DeptSource
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
    Left = 21
    Top = 8
    Width = 510
    Height = 25
    DataSource = Dm.DeptSource
    TabOrder = 1
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 223
    Width = 527
    Height = 218
    ActivePage = TabSheet3
    TabOrder = 2
    object tabsheet1: TTabSheet
      Caption = #49345#49464#51312#54924'('#53580#51060#48660')'
      ExplicitLeft = 0
      ExplicitTop = 112
      ExplicitWidth = 0
      ExplicitHeight = 102
      object DBGrid2: TDBGrid
        Left = 0
        Top = 8
        Width = 516
        Height = 179
        DataSource = Dm.SubInsaSource
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid3: TDBGrid
        Left = 3
        Top = 8
        Width = 513
        Height = 179
        DataSource = Dm.InsaQuery_Source
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
        Left = 0
        Top = 3
        Width = 326
        Height = 184
        ColCount = 3
        DrawingStyle = gdsClassic
        TabOrder = 0
        OnDrawCell = StringGrid1DrawCell
      end
      object Button1: TButton
        Left = 332
        Top = 16
        Width = 184
        Height = 33
        Caption = #50641#49472#52980#54252#45324#53944#49324#50857#45936#51060#53552#48372#45236#44592
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 332
        Top = 55
        Width = 184
        Height = 33
        Caption = #50641#49472#50640' '#51649#51217' '#45936#51060#53552#48372#45236#44592
        TabOrder = 2
        OnClick = Button2Click
      end
    end
  end
  object tot_Query: TQuery
    DatabaseName = 'sample'
    SQL.Strings = (
      'select count(id) as total'
      'from insa'
      'where dept_code like :code')
    Left = 472
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'code'
        ParamType = ptUnknown
      end>
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 400
    Top = 392
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 440
    Top = 392
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 480
    Top = 392
  end
end
