object ClientModule: TClientModule
  OldCreateOrder = False
  Height = 457
  Width = 509
  object SQLConnection: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXDataSnap'
      'HostName=localhost'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=15.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      'Filters={}')
    Connected = True
    Left = 32
    Top = 16
    UniqueId = '{72B018A6-74CB-481B-9FAC-1155C8A9AD50}'
  end
  object ProviderConnection: TDSProviderConnection
    ServerClassName = 'TServerMethods'
    Connected = True
    SQLConnection = SQLConnection
    Left = 120
    Top = 16
  end
  object MemberQueryDataSet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pnum'
        ParamType = ptInput
      end>
    ProviderName = 'MemberQueryProvider'
    RemoteServer = ProviderConnection
    Left = 48
    Top = 96
  end
  object MemberQuerySource: TDataSource
    DataSet = MemberQueryDataSet
    Left = 56
    Top = 104
  end
end
