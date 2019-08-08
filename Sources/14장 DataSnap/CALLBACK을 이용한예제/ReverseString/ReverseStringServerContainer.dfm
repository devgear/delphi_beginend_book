object ServerContainer3: TServerContainer3
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 271
  Width = 415
  object DSServer1: TDSServer
    AutoStart = True
    HideDSAdmin = False
    Left = 80
    Top = 11
  end
  object DSTCPServerTransport1: TDSTCPServerTransport
    PoolSize = 0
    Server = DSServer1
    BufferKBSize = 32
    Filters = <>
    Left = 80
    Top = 73
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    LifeCycle = 'Session'
    Left = 176
    Top = 11
  end
  object DSHTTPService1: TDSHTTPService
    RESTContext = 'rest'
    Server = DSServer1
    DSHostname = 'localhost'
    DSPort = 211
    Filters = <>
    HttpPort = 8080
    Active = False
    Left = 176
    Top = 72
  end
end
