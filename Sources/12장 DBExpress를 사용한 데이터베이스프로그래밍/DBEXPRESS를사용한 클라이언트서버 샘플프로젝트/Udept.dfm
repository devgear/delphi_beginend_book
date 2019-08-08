object DEPTForm: TDEPTForm
  Left = 0
  Top = 0
  ActiveControl = DBGrid1
  Caption = #48512#49436#44288#47532
  ClientHeight = 432
  ClientWidth = 508
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
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 16
    Width = 480
    Height = 25
    DataSource = dm.DeptSource
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 64
    Width = 480
    Height = 137
    DataSource = dm.DeptSource
    ImeName = 'Microsoft IME 2003'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object PageControl1: TPageControl
    Left = 16
    Top = 224
    Width = 480
    Height = 193
    ActivePage = TabSheet3
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #49345#49464#51312#54924'(t)'
      object DBGrid2: TDBGrid
        Left = 3
        Top = 3
        Width = 466
        Height = 159
        DataSource = dm.subinsaSource
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
      object DBGrid3: TDBGrid
        Left = 3
        Top = 3
        Width = 466
        Height = 159
        DataSource = dm.insaquerySource
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
        Left = 8
        Top = 8
        Width = 320
        Height = 145
        ColCount = 3
        DrawingStyle = gdsClassic
        TabOrder = 0
        OnDrawCell = StringGrid1DrawCell
      end
      object Button2: TButton
        Left = 360
        Top = 16
        Width = 75
        Height = 25
        Caption = #50641#49472#47196
        TabOrder = 1
        OnClick = Button2Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = #46321#47197'('#51200#51109#54532#47196#49884#51200')'
      ImageIndex = 3
      object Label1: TLabel
        Left = 48
        Top = 32
        Width = 48
        Height = 13
        Caption = #48512#49436#53076#46300
      end
      object Label2: TLabel
        Left = 48
        Top = 64
        Width = 36
        Height = 13
        Caption = #48512#49436#47749
      end
      object Label3: TLabel
        Left = 48
        Top = 104
        Width = 24
        Height = 13
        Caption = #44284#47749
      end
      object Edit1: TEdit
        Left = 112
        Top = 24
        Width = 121
        Height = 21
        ImeName = 'Microsoft IME 2003'
        MaxLength = 4
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 112
        Top = 64
        Width = 121
        Height = 21
        ImeName = 'Microsoft IME 2003'
        MaxLength = 6
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 112
        Top = 104
        Width = 121
        Height = 21
        ImeName = 'Microsoft IME 2003'
        MaxLength = 8
        TabOrder = 2
      end
      object Button1: TButton
        Left = 264
        Top = 16
        Width = 113
        Height = 41
        Caption = #46321#47197
        TabOrder = 3
        OnClick = Button1Click
      end
    end
  end
  object totquery: TSQLQuery
    Active = True
    DataSource = dm.DeptSource
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CODE'
        ParamType = ptInput
        Size = 5
      end>
    SQL.Strings = (
      'select count(id) as total from insa'
      'where dept_code like :code')
    SQLConnection = dm.SQLConnection1
    Left = 432
    Top = 80
  end
  object SQLStoredProc1: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Precision = 4
        Name = 'PCODE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 6
        Name = 'PDEPT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 8
        Name = 'PSECTION'
        ParamType = ptInput
      end>
    SQLConnection = dm.SQLConnection1
    StoredProcName = 'INSERT_DEPT'
    Left = 440
    Top = 352
  end
end
