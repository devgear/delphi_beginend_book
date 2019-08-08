object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #53364#46972#51060#50616#53944' '#54532#47196#44536#47016
  ClientHeight = 260
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 41
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 8
      Top = 9
      Width = 75
      Height = 25
      Caption = #50672#44208
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object ListBox1: TListBox
    Left = 0
    Top = 41
    Width = 389
    Height = 219
    Align = alClient
    ImeName = 'Microsoft IME 2003'
    ItemHeight = 13
    TabOrder = 1
  end
  object TCPClient: TIdTCPClient
    ConnectTimeout = 0
    Host = '127.0.0.1'
    IPVersion = Id_IPv4
    Port = 8090
    ReadTimeout = -1
    Left = 104
    Top = 8
  end
end
