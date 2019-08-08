object dm: Tdm
  OldCreateOrder = False
  Height = 332
  Width = 325
  object insaSource: TDataSource
    DataSet = INSA
    Left = 72
    Top = 24
  end
  object DeptSource: TDataSource
    DataSet = Dept
    OnDataChange = DeptSourceDataChange
    Left = 72
    Top = 96
  end
  object subinsaSource: TDataSource
    DataSet = subinsa
    Left = 72
    Top = 176
  end
  object insaquerySource: TDataSource
    DataSet = insaquery
    Left = 256
    Top = 24
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'INTERBASE'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXInterBase'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver150.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=15.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXInterbaseMetaDataCommandFactory,DbxInt' +
        'erBaseDriver150.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXInterbaseMetaDataCommand' +
        'Factory,Borland.Data.DbxInterBaseDriver,Version=15.0.0.0,Culture' +
        '=neutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxint.dll'
      'VendorLib=GDS32.DLL'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'ErrorResourceFile='
      'ServerCharSet='
      'drivername=INTERBASE'
      'blobsize=-1'
      'commitretain=False'
      'Database=D:\Book_SampleDB\sample.ib'
      'localecode=0000'
      'password=masterkey'
      'rolename=RoleName'
      'sqldialect=3'
      'isolationlevel=ReadCommitted'
      'user_name=sysdba'
      'waitonlocks=True'
      'trim char=False')
    VendorLib = 'GDS32.DLL'
    Connected = True
    Left = 200
    Top = 88
  end
  object INSA: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'INSA'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = 1
    DataSet.Params = <>
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
    StoreDefs = True
    BeforeInsert = insaBeforeInsert
    AfterPost = insaAfterPost
    OnCalcFields = insaCalcFields
    OnNewRecord = insaNewRecord
    Left = 24
    Top = 24
    object INSAID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object INSANAME: TStringField
      FieldName = 'NAME'
      Size = 10
    end
    object INSAAGE: TSmallintField
      FieldName = 'AGE'
    end
    object INSADEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 4
    end
    object INSACLASS: TStringField
      FieldName = 'CLASS'
      Size = 4
    end
    object INSAIPSA_DATE: TSQLTimeStampField
      FieldName = 'IPSA_DATE'
    end
    object INSASALARY: TIntegerField
      FieldName = 'SALARY'
    end
    object INSATAX: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TAX'
      Calculated = True
    end
    object INSAPHOTO: TBlobField
      FieldName = 'PHOTO'
      Size = 1
    end
    object INSAGRADE: TStringField
      FieldName = 'GRADE'
      Size = 1
    end
  end
  object Dept: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'DEPT'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 24
    Top = 96
  end
  object subinsa: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'INSA'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = 1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'DEPT_CODE'
        ParamType = ptInput
        Size = 5
        Value = 'M003'
      end>
    IndexFieldNames = 'DEPT_CODE'
    MasterFields = 'CODE'
    MasterSource = DeptSource
    PacketRecords = 0
    Params = <>
    Left = 24
    Top = 176
  end
  object insaquery: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 'select * from insa'#13#10'where dept_code =:code'
    DataSet.MaxBlobSize = 1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'code'
        ParamType = ptInput
      end>
    Params = <>
    Left = 200
    Top = 24
  end
end
