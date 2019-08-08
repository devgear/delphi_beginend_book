object Form_GridforCurri: TForm_GridforCurri
  Left = 0
  Top = 0
  Caption = #44053#51032#46321#47197
  ClientHeight = 440
  ClientWidth = 725
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 709
    Height = 73
    Caption = #44284#47785#44284' '#44592#44036#51012' '#51077#47141#54616#49464#50836' !'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 40
      Width = 32
      Height = 16
      Caption = #51228#47785
    end
    object Label2: TLabel
      Left = 416
      Top = 40
      Width = 32
      Height = 16
      Caption = #48512#53552
    end
    object Label3: TLabel
      Left = 664
      Top = 40
      Width = 32
      Height = 16
      Caption = #44620#51648
    end
    object DateTimePicker1: TDateTimePicker
      Left = 224
      Top = 32
      Width = 186
      Height = 24
      Date = 40266.666384004630000000
      Time = 40266.666384004630000000
      ImeName = 'Microsoft IME 2003'
      ParseInput = True
      TabOrder = 0
      OnCloseUp = DBLookupComboBox1CloseUp
      OnChange = DateTimePicker1Change
      OnUserInput = DateTimePicker1UserInput
    end
    object DateTimePicker2: TDateTimePicker
      Left = 472
      Top = 32
      Width = 186
      Height = 24
      Date = 40266.666384004630000000
      Time = 40266.666384004630000000
      ImeName = 'Microsoft IME 2003'
      ParseInput = True
      TabOrder = 1
      OnCloseUp = DBLookupComboBox1CloseUp
      OnChange = DateTimePicker1Change
      OnUserInput = DateTimePicker1UserInput
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 54
      Top = 32
      Width = 145
      Height = 24
      ImeName = 'Microsoft IME 2003'
      KeyField = 'CODE'
      ListField = 'NAME'
      ListSource = Dm.Curri_Source
      TabOrder = 2
      OnCloseUp = DBLookupComboBox1CloseUp
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 88
    Width = 709
    Height = 348
    BevelInner = bvLowered
    Caption = 'Panel1'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 8
      Top = 8
      Width = 697
      Height = 225
      DataSource = Dm.currilist_Source
      ImeName = 'Microsoft IME 2003'
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 239
      Width = 697
      Height = 98
      Caption = #44053#51032#46321#47197
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label4: TLabel
        Left = 24
        Top = 24
        Width = 39
        Height = 13
        Caption = #49884#51089#51068
      end
      object Label5: TLabel
        Left = 288
        Top = 24
        Width = 35
        Height = 13
        Caption = #44592'   '#44036
      end
      object Label6: TLabel
        Left = 24
        Top = 51
        Width = 39
        Height = 13
        Caption = #44053#51032#49892
      end
      object Label7: TLabel
        Left = 288
        Top = 51
        Width = 35
        Height = 13
        Caption = #44053'   '#49324
      end
      object Label8: TLabel
        Left = 24
        Top = 70
        Width = 35
        Height = 13
        Caption = #51221'   '#50896
      end
      object Label9: TLabel
        Left = 288
        Top = 70
        Width = 39
        Height = 13
        Caption = #49688#44053#47308
      end
      object Edit3: TEdit
        Left = 88
        Top = 43
        Width = 121
        Height = 21
        ImeName = 'Microsoft IME 2003'
        NumbersOnly = True
        TabOrder = 0
      end
      object Edit4: TEdit
        Left = 345
        Top = 43
        Width = 121
        Height = 21
        ImeName = 'Microsoft IME 2003'
        TabOrder = 1
      end
      object Edit5: TEdit
        Left = 88
        Top = 70
        Width = 121
        Height = 21
        ImeName = 'Microsoft IME 2003'
        NumbersOnly = True
        TabOrder = 2
      end
      object Edit6: TEdit
        Left = 345
        Top = 70
        Width = 121
        Height = 21
        ImeName = 'Microsoft IME 2003'
        NumbersOnly = True
        TabOrder = 3
      end
      object Button1: TButton
        Left = 512
        Top = 70
        Width = 75
        Height = 25
        Caption = #51077#47141
        TabOrder = 4
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 608
        Top = 70
        Width = 75
        Height = 25
        Caption = #52712#49548
        TabOrder = 5
        OnClick = Button2Click
      end
      object DateTimePicker3: TDateTimePicker
        Left = 88
        Top = 16
        Width = 121
        Height = 21
        Date = 40268.592895324070000000
        Time = 40268.592895324070000000
        ImeName = 'Microsoft IME 2003'
        ParseInput = True
        TabOrder = 6
        OnUserInput = DateTimePicker1UserInput
      end
      object SpinEdit1: TSpinEdit
        Left = 345
        Top = 15
        Width = 121
        Height = 22
        MaxValue = 4
        MinValue = 1
        TabOrder = 7
        Value = 4
      end
    end
  end
end
