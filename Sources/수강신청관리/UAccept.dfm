object Form_Accept: TForm_Accept
  Left = 0
  Top = 0
  Caption = #49688#44053#49888#52397#51217#49688
  ClientHeight = 510
  ClientWidth = 733
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label13: TLabel
    Left = 8
    Top = 271
    Width = 150
    Height = 13
    Caption = #54869#51221#46104#51648' '#50506#51008' '#49688#44053#49888#52397#45236#50669
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 719
    Height = 257
    Caption = #49352#47196#50868' '#49688#44053#49888#52397#44148#51012' '#51077#47141#54616#49464#50836
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 32
      Width = 64
      Height = 16
      Caption = #44284#47785#53076#46300
    end
    object Label2: TLabel
      Left = 256
      Top = 32
      Width = 48
      Height = 16
      Caption = #49888#52397#51064
    end
    object Label3: TLabel
      Left = 464
      Top = 32
      Width = 96
      Height = 16
      Caption = #51452#48124#46321#47197#48264#54840
    end
    object Label4: TLabel
      Left = 64
      Top = 72
      Width = 32
      Height = 16
      Caption = #51452#49548
    end
    object Label5: TLabel
      Left = 528
      Top = 72
      Width = 32
      Height = 16
      Caption = #51204#54868
    end
    object Label6: TLabel
      Left = 48
      Top = 112
      Width = 48
      Height = 16
      Caption = #49345#54840#47749
    end
    object Label7: TLabel
      Left = 448
      Top = 112
      Width = 112
      Height = 16
      Caption = #49324#50629#51088#46321#47197#48264#54840
    end
    object Label8: TLabel
      Left = 48
      Top = 152
      Width = 48
      Height = 16
      Caption = #45824#54364#51088
    end
    object Label9: TLabel
      Left = 496
      Top = 152
      Width = 64
      Height = 16
      Caption = #54924#49324#51204#54868
    end
    object Label10: TLabel
      Left = 32
      Top = 192
      Width = 64
      Height = 16
      Caption = #54924#49324#51452#49548
    end
    object Label11: TLabel
      Left = 535
      Top = 192
      Width = 25
      Height = 16
      Caption = 'FAX'
    end
    object Label12: TLabel
      Left = 48
      Top = 233
      Width = 46
      Height = 16
      Caption = 'E-MAIL'
    end
    object Edit1: TEdit
      Left = 113
      Top = 24
      Width = 121
      Height = 24
      ImeName = 'Microsoft IME 2003'
      TabOrder = 0
      OnKeyDown = Edit1KeyDown
    end
    object Edit2: TEdit
      Left = 326
      Top = 24
      Width = 121
      Height = 24
      ImeName = 'Microsoft IME 2003'
      TabOrder = 1
      OnKeyDown = Edit1KeyDown
    end
    object Edit3: TEdit
      Left = 582
      Top = 24
      Width = 121
      Height = 24
      ImeName = 'Microsoft IME 2003'
      TabOrder = 2
      OnKeyDown = Edit1KeyDown
    end
    object Edit4: TEdit
      Left = 113
      Top = 69
      Width = 334
      Height = 24
      ImeName = 'Microsoft IME 2003'
      TabOrder = 3
      OnKeyDown = Edit1KeyDown
    end
    object Edit5: TEdit
      Left = 582
      Top = 69
      Width = 121
      Height = 24
      ImeName = 'Microsoft IME 2003'
      TabOrder = 4
      OnKeyDown = Edit1KeyDown
    end
    object Edit6: TEdit
      Left = 113
      Top = 109
      Width = 220
      Height = 24
      ImeName = 'Microsoft IME 2003'
      TabOrder = 5
      OnKeyDown = Edit1KeyDown
    end
    object Edit7: TEdit
      Left = 582
      Top = 109
      Width = 121
      Height = 24
      ImeName = 'Microsoft IME 2003'
      TabOrder = 6
      OnKeyDown = Edit1KeyDown
    end
    object Edit8: TEdit
      Left = 582
      Top = 149
      Width = 121
      Height = 24
      ImeName = 'Microsoft IME 2003'
      TabOrder = 7
      OnKeyDown = Edit1KeyDown
    end
    object Edit9: TEdit
      Left = 582
      Top = 189
      Width = 121
      Height = 24
      ImeName = 'Microsoft IME 2003'
      TabOrder = 8
      OnKeyDown = Edit1KeyDown
    end
    object Edit10: TEdit
      Left = 113
      Top = 152
      Width = 280
      Height = 24
      ImeName = 'Microsoft IME 2003'
      TabOrder = 9
      OnKeyDown = Edit1KeyDown
    end
    object Edit11: TEdit
      Left = 113
      Top = 189
      Width = 334
      Height = 24
      ImeName = 'Microsoft IME 2003'
      TabOrder = 10
      OnKeyDown = Edit1KeyDown
    end
    object Edit12: TEdit
      Left = 113
      Top = 230
      Width = 220
      Height = 24
      ImeName = 'Microsoft IME 2003'
      TabOrder = 11
      OnKeyDown = Edit1KeyDown
    end
    object Button1: TButton
      Left = 480
      Top = 224
      Width = 104
      Height = 30
      Caption = #51077#47141
      TabOrder = 12
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 599
      Top = 224
      Width = 104
      Height = 30
      Caption = #52712#49548
      TabOrder = 13
      OnClick = Button2Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 291
    Width = 668
    Height = 211
    Hint = #39#45908#48660#53364#47533#54616#49884#47732' '#49688#51221#54624#49688' '#51080#49845#45768#45796'.'
    CustomHint = BalloonHint1
    DataSource = Dm.CustTemp_Source
    ImeName = 'Microsoft IME 2003'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object Button3: TButton
    Left = 682
    Top = 290
    Width = 45
    Height = 63
    Caption = #46321#47197
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 682
    Top = 359
    Width = 45
    Height = 66
    Caption = #49325#51228
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 682
    Top = 431
    Width = 45
    Height = 70
    Caption = #51333#47308
    TabOrder = 4
  end
  object BalloonHint1: TBalloonHint
    Left = 496
    Top = 184
  end
end
