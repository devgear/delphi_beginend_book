object ServerContainer: TServerContainer
  OldCreateOrder = False
  Height = 271
  Width = 415
  object DSServer: TDSServer
    AutoStart = True
    HideDSAdmin = False
    Left = 96
    Top = 11
  end
  object DSTCPServerTransport: TDSTCPServerTransport
    PoolSize = 0
    Server = DSServer
    BufferKBSize = 32
    Filters = <>
    Left = 96
    Top = 73
  end
  object DSServerClass: TDSServerClass
    OnGetClass = DSServerClassGetClass
    Server = DSServer
    LifeCycle = 'Session'
    Left = 200
    Top = 11
  end
end
