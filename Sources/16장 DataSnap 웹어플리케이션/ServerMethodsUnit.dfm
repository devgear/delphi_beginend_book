object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 335
  Width = 508
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
    Top = 104
  end
  object query_kindcount: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select kind'
      'from curri'
      'group by kind')
    SQLConnection = SQLConnection1
    Left = 120
    Top = 104
  end
  object CustTemp: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'CUSTTEMP'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 240
    Top = 104
  end
  object Query_curriname: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'p_kind'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from curri'
      'where kind =:p_kind')
    SQLConnection = SQLConnection1
    Left = 120
    Top = 168
  end
  object Query_curridate: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'p_code'
        ParamType = ptInput
        Size = 1
        Value = ''
      end>
    SQL.Strings = (
      'select * from curritb'
      'where ctcode like :p_code'
      'order by start')
    SQLConnection = SQLConnection1
    Left = 120
    Top = 248
  end
  object CustTempProvider: TDataSetProvider
    DataSet = CustTemp
    Left = 344
    Top = 104
  end
  object Customer: TSimpleDataSet
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
    Left = 240
    Top = 168
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
  object orders: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'ORDERS'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 232
    Top = 248
  end
  object Curri: TSQLTable
    MaxBlobSize = 1
    SQLConnection = SQLConnection1
    TableName = 'CURRI'
    Left = 344
    Top = 248
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
  object curritb: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'CURRITB'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 344
    Top = 168
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
