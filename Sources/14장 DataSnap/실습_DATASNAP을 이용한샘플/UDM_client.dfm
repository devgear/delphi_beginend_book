object DM: TDM
  OldCreateOrder = False
  Height = 257
  Width = 333
  object DEPTSource: TDataSource
    DataSet = dept
    OnDataChange = DEPTSourceDataChange
    Left = 104
    Top = 32
  end
  object INSASource: TDataSource
    DataSet = insa
    Left = 104
    Top = 104
  end
  object subinsaSource: TDataSource
    DataSet = subinsa
    Left = 112
    Top = 184
  end
  object insaquerySource: TDataSource
    DataSet = insaquery
    Left = 272
    Top = 32
  end
  object dept: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DeptProvider'
    RemoteServer = DSProviderConnection1
    Left = 56
    Top = 32
  end
  object insa: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'AGE'
        DataType = ftSmallint
      end
      item
        Name = 'DEPT_CODE'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CLASS'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'IPSA_DATE'
        DataType = ftTimeStamp
      end
      item
        Name = 'SALARY'
        DataType = ftInteger
      end
      item
        Name = 'PHOTO'
        DataType = ftBlob
        Size = 1
      end
      item
        Name = 'GRADE'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'i_id'
        Fields = 'id'
      end
      item
        Name = 'i_name'
        Fields = 'name'
      end
      item
        Name = 'i_dept'
        Fields = 'dept_code'
      end>
    Params = <>
    ProviderName = 'insaProvider'
    RemoteServer = DSProviderConnection1
    StoreDefs = True
    AfterPost = InsaAfterPost
    OnCalcFields = InsaCalcFields
    OnNewRecord = InsaNewRecord
    OnReconcileError = insaReconcileError
    Left = 56
    Top = 104
    object insaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object insaNAME: TStringField
      FieldName = 'NAME'
      Size = 10
    end
    object insaAGE: TSmallintField
      FieldName = 'AGE'
    end
    object insaDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 4
    end
    object insaCLASS: TStringField
      FieldName = 'CLASS'
      Size = 4
    end
    object insaIPSA_DATE: TSQLTimeStampField
      FieldName = 'IPSA_DATE'
    end
    object insaSALARY: TIntegerField
      FieldName = 'SALARY'
    end
    object insaPHOTO: TBlobField
      FieldName = 'PHOTO'
      Size = 1
    end
    object insaGRADE: TStringField
      FieldName = 'GRADE'
      Size = 1
    end
    object insatax: TFloatField
      FieldKind = fkCalculated
      FieldName = 'tax'
      Calculated = True
    end
  end
  object subinsa: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'DEPT_CODE'
    MasterFields = 'CODE'
    MasterSource = DEPTSource
    PacketRecords = 0
    Params = <>
    ProviderName = 'insaProvider'
    RemoteServer = DSProviderConnection1
    Left = 56
    Top = 184
  end
  object insaquery: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'code'
        ParamType = ptInput
      end>
    ProviderName = 'Insa_QueryProvider'
    RemoteServer = DSProviderConnection1
    Left = 208
    Top = 32
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Params.Strings = (
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=15.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'DriverUnit=DBXDataSnap'
      'Filters={}')
    Connected = True
    Left = 240
    Top = 104
    UniqueId = '{3510F430-51BC-4BDA-B9BB-D6180525895C}'
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 240
    Top = 176
  end
end
