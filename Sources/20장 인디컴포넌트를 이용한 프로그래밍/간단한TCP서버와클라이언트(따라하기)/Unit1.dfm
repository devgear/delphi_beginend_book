object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 206
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TCPServer: TIdTCPServer
    Bindings = <
      item
        IP = '127.0.0.1'
        Port = 8090
      end>
    DefaultPort = 8090
    OnExecute = TCPServerExecute
    Left = 40
    Top = 32
  end
end
