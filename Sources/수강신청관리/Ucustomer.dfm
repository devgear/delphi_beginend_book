object Form_Customer: TForm_Customer
  Left = 0
  Top = 0
  Caption = #44368#50977#49373#44288#47532
  ClientHeight = 432
  ClientWidth = 740
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
  object Label1: TLabel
    Left = 48
    Top = 16
    Width = 24
    Height = 13
    Caption = #51060#47492
  end
  object Edit1: TEdit
    Left = 96
    Top = 8
    Width = 121
    Height = 21
    ImeName = 'Microsoft IME 2003'
    TabOrder = 0
    OnChange = Edit1Change
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 39
    Width = 724
    Height = 330
    DataSource = Dm.Customer_Source
    ImeName = 'Microsoft IME 2003'
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 304
    Top = 8
    Width = 410
    Height = 25
    DataSource = Dm.Customer_Source
    TabOrder = 2
  end
  object Button1: TButton
    Left = 544
    Top = 392
    Width = 75
    Height = 25
    Caption = #54868#51068#51200#51109
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 641
    Top = 392
    Width = 75
    Height = 25
    Caption = #54868#51068#44032#51256#50724#44592
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 448
    Top = 392
    Width = 75
    Height = 25
    Caption = #52712#49548
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 352
    Top = 392
    Width = 75
    Height = 25
    Caption = #51200#51109
    TabOrder = 6
    OnClick = Button4Click
  end
end
