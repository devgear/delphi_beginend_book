object Dm: TDm
  OldCreateOrder = False
  Height = 322
  Width = 471
  object SQLConnection1: TSQLConnection
    ConnectionName = 'LecProject'
    DriverName = 'INTERBASE'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxint.dll'
    LoginPrompt = False
    Params.Strings = (
      'drivername=INTERBASE'
      'blobsize=-1'
      'commitretain=False'
      'Database=d:\Book_SampleDB\PROJECTDB.IB'
      'localecode=0000'
      'password=masterkey'
      'rolename=RoleName'
      'sqldialect=3'
      'isolationlevel=ReadCommitted'
      'user_name=sysdba'
      'waitonlocks=True'
      'trim char=False')
    VendorLib = 'gds32.dll'
    Connected = True
    Left = 32
    Top = 8
  end
  object CustTemp_Source: TDataSource
    DataSet = CustTemp
    Left = 224
    Top = 8
  end
  object CustTemp: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'CUSTTEMP'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    FieldDefs = <
      item
        Name = 'REGDATE'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'CTCODE'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'NAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PNO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 13
      end
      item
        Name = 'TEL'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ADDR'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'COMPANY'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CCODE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CBOSS'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CADDR'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CTEL'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CFAX'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'CustTempIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 152
    Top = 8
    object CustTempREGDATE: TSQLTimeStampField
      DisplayLabel = #46321#47197#51068#51088
      FieldName = 'REGDATE'
      Required = True
    end
    object CustTempCTCODE: TStringField
      DisplayLabel = #44284#47785#53076#46300
      FieldName = 'CTCODE'
      Required = True
      FixedChar = True
      Size = 5
    end
    object CustTempNAME: TStringField
      DisplayLabel = #49888#52397#51064
      FieldName = 'NAME'
      Required = True
      Size = 10
    end
    object CustTempPNO: TStringField
      DisplayLabel = #51452#48124#46321#47197#48264#54840
      FieldName = 'PNO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object CustTempTEL: TStringField
      DisplayLabel = #51204#54868#48264#54840
      FieldName = 'TEL'
      Size = 15
    end
    object CustTempADDR: TStringField
      DisplayLabel = #51452#49548
      FieldName = 'ADDR'
      Size = 50
    end
    object CustTempCOMPANY: TStringField
      DisplayLabel = #49345#54840#47749
      FieldName = 'COMPANY'
      Size = 30
    end
    object CustTempCCODE: TStringField
      DisplayLabel = #49324#50629#51088#46321#47197#48264#54840
      FieldName = 'CCODE'
      Size = 10
    end
    object CustTempCBOSS: TStringField
      DisplayLabel = #45824#54364#51088#47749
      FieldName = 'CBOSS'
      Size = 10
    end
    object CustTempCADDR: TStringField
      DisplayLabel = #54924#49324#51452#49548
      FieldName = 'CADDR'
      Size = 50
    end
    object CustTempCTEL: TStringField
      DisplayLabel = #54924#49324#51204#54868
      FieldName = 'CTEL'
      Size = 15
    end
    object CustTempCFAX: TStringField
      DisplayLabel = #54057#49828
      FieldName = 'CFAX'
      Size = 15
    end
    object CustTempEMAIL: TStringField
      DisplayLabel = #47700#51068#51452#49548
      FieldName = 'EMAIL'
      Size = 30
    end
  end
  object curritb_Source: TDataSource
    Left = 208
    Top = 72
  end
  object Curri: TSQLTable
    OnCalcFields = CurriCalcFields
    Active = True
    MaxBlobSize = 1
    SQLConnection = SQLConnection1
    TableName = 'CURRI'
    Left = 152
    Top = 152
    object CurriCODE: TStringField
      FieldName = 'CODE'
      Required = True
      FixedChar = True
      Size = 2
    end
    object CurriKIND: TStringField
      FieldName = 'KIND'
    end
    object CurriNAME: TStringField
      FieldName = 'NAME'
    end
    object CurriLOGO: TBlobField
      FieldName = 'LOGO'
      BlobType = ftGraphic
      Size = 1
    end
    object Currikind_name: TStringField
      FieldKind = fkCalculated
      FieldName = 'kind_name'
      Calculated = True
    end
  end
  object Curri_Source: TDataSource
    DataSet = SimpleDataSet1
    Left = 208
    Top = 152
  end
  object Customer: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'CUSTOMER'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    FieldDefs = <
      item
        Name = 'CUSTNO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'NAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PNO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 13
      end
      item
        Name = 'TEL'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ADDR'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'COMPANY'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CCODE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CBOSS'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CADDR'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CTEL'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CFAX'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'i_name'
        Fields = 'name'
      end
      item
        Name = 'i_pno'
        Fields = 'pno'
      end
      item
        Name = 'i_company_name'
        Fields = 'company;name'
      end>
    Params = <>
    StoreDefs = True
    Left = 152
    Top = 224
    object CustomerCUSTNO: TStringField
      DisplayLabel = #44256#44061#48264#54840
      FieldName = 'CUSTNO'
      Required = True
      FixedChar = True
      Size = 7
    end
    object CustomerNAME: TStringField
      DisplayLabel = #51060#47492
      FieldName = 'NAME'
      Required = True
      Size = 10
    end
    object CustomerPNO: TStringField
      DisplayLabel = #51452#48124#46321#47197#48264#54840
      FieldName = 'PNO'
      EditMask = '000000\-0000000;0;_'
      FixedChar = True
      Size = 13
    end
    object CustomerTEL: TStringField
      DisplayLabel = #51204#54868#48264#54840
      FieldName = 'TEL'
      Size = 15
    end
    object CustomerADDR: TStringField
      DisplayLabel = #51452#49548
      FieldName = 'ADDR'
      Size = 50
    end
    object CustomerCOMPANY: TStringField
      DisplayLabel = #54924#49324#47749
      FieldName = 'COMPANY'
      Size = 30
    end
    object CustomerCCODE: TStringField
      DisplayLabel = #49324#50629#51088#46321#47197#48264#54840
      FieldName = 'CCODE'
      Size = 10
    end
    object CustomerCBOSS: TStringField
      DisplayLabel = #45824#54364#51088#47749
      FieldName = 'CBOSS'
      Size = 10
    end
    object CustomerCADDR: TStringField
      DisplayLabel = #54924#49324#51452#49548
      FieldName = 'CADDR'
      Size = 50
    end
    object CustomerCTEL: TStringField
      DisplayLabel = #54924#49324#51204#54868#48264#54840
      FieldName = 'CTEL'
      Size = 15
    end
    object CustomerCFAX: TStringField
      DisplayLabel = #54057#49828#48264#54840
      FieldName = 'CFAX'
      Size = 15
    end
    object CustomerEMAIL: TStringField
      DisplayLabel = #47700#51068#51452#49548
      FieldName = 'EMAIL'
      Size = 30
    end
  end
  object Customer_Source: TDataSource
    DataSet = Customer
    Left = 208
    Top = 224
  end
  object query_CurriList: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 
      'Select * From curritb'#13#10'where (ctcode like :p_code) and'#13#10'(start >' +
      '= :p_date1) and (start <= :p_date2)'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftUnknown
        Name = 'p_code'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'p_date1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'p_date2'
        ParamType = ptInput
      end>
    Params = <>
    Left = 328
    Top = 8
  end
  object currilist_Source: TDataSource
    DataSet = query_CurriList
    Left = 368
    Top = 8
  end
  object SimpleDataSet1: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'CURRI'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = 1
    DataSet.Params = <>
    Params = <>
    Left = 32
    Top = 152
  end
  object orders: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'ORDERS'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 328
    Top = 64
  end
  object curritb: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'CURRITB'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 152
    Top = 72
    object curritbCTCODE: TStringField
      FieldName = 'CTCODE'
      Required = True
      FixedChar = True
      Size = 5
    end
    object curritbSTART: TSQLTimeStampField
      FieldName = 'START'
      Required = True
    end
    object curritbLIMIT: TIntegerField
      FieldName = 'LIMIT'
    end
    object curritbPCOUNT: TIntegerField
      FieldName = 'PCOUNT'
    end
    object curritbPRICE: TIntegerField
      FieldName = 'PRICE'
    end
    object curritbTEACHER: TStringField
      FieldName = 'TEACHER'
      Size = 10
    end
    object curritbDURING: TIntegerField
      FieldName = 'DURING'
    end
    object curritbROOM: TIntegerField
      FieldName = 'ROOM'
    end
  end
end
