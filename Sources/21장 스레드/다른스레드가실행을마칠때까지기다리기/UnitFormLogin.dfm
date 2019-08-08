object FormLogin: TFormLogin
  Left = 0
  Top = 0
  Caption = #47196#44536#51064
  ClientHeight = 204
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 40
    Width = 57
    Height = 16
    Caption = 'User ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 88
    Width = 63
    Height = 16
    Caption = 'Password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 136
    Top = 39
    Width = 121
    Height = 21
    ImeName = 'Microsoft IME 2003'
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 136
    Top = 88
    Width = 121
    Height = 21
    ImeName = 'Microsoft IME 2003'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 40
    Top = 152
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 160
    Top = 152
    Width = 75
    Height = 25
    Caption = 'CANCEL'
    TabOrder = 3
    OnClick = Button2Click
  end
end
