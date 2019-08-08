object MainForm_Client: TMainForm_Client
  Left = 0
  Top = 0
  Caption = 'MainForm_Client'
  ClientHeight = 239
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 351
    Height = 169
    ImeName = 'Microsoft IME 2003'
    Lines.Strings = (
      '')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 198
    Width = 75
    Height = 25
    Caption = 'START'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 89
    Top = 198
    Width = 75
    Height = 25
    Caption = 'STOP'
    TabOrder = 2
    OnClick = Button2Click
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=15.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}')
    Left = 320
    Top = 192
  end
  object ChannelManager: TDSClientCallbackChannelManager
    DSHostname = 'localhost'
    DSPort = '212'
    CommunicationProtocol = 'tcp/ip'
    ChannelName = 'MemoChannel'
    ManagerId = '691748.210899.9264'
    Left = 216
    Top = 192
  end
end
