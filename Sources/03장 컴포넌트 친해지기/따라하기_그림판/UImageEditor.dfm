object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #44536#47548#54032
  ClientHeight = 215
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 257
    Height = 199
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
  end
  object ColorGrid1: TColorGrid
    Left = 271
    Top = 8
    Width = 120
    Height = 96
    BackgroundEnabled = False
    TabOrder = 0
  end
  object ListBox1: TListBox
    Left = 271
    Top = 110
    Width = 121
    Height = 97
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 13
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9')
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 17
    object File1: TMenuItem
      Caption = 'File'
      object New1: TMenuItem
        Caption = 'New'
      end
      object Clear1: TMenuItem
        Caption = 'Clear'
        OnClick = Clear1Click
      end
      object Open1: TMenuItem
        Caption = 'Open'
        OnClick = Open1Click
      end
      object Save1: TMenuItem
        Caption = 'Save'
        OnClick = Save1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
  end
end
