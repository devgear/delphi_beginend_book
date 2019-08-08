object ServerContainer1: TServerContainer1
  OldCreateOrder = False
  Height = 271
  Width = 415
  object DSServer1: TDSServer
    AutoStart = True
    HideDSAdmin = False
    Left = 96
    Top = 11
  end
  object DSTCPServerTransport1: TDSTCPServerTransport
    Port = 212
    PoolSize = 0
    Server = DSServer1
    BufferKBSize = 32
    Filters = <>
    Left = 96
    Top = 73
  end
end
