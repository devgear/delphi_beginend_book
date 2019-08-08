object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 406
  Width = 526
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
      'Database=D:\Book_SampleDB\SAMPLE.IB'
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
    Left = 40
    Top = 32
  end
  object dept: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection1
    TableName = 'DEPT'
    Left = 152
    Top = 32
  end
  object DeptProvider: TDataSetProvider
    DataSet = dept
    Left = 192
    Top = 32
  end
  object insa: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection1
    TableName = 'INSA'
    Left = 152
    Top = 88
  end
  object insaProvider: TDataSetProvider
    DataSet = insa
    Left = 224
    Top = 88
  end
  object dept_query: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from dept'
      'order by dept,section'
      '')
    SQLConnection = SQLConnection1
    Left = 152
    Top = 160
  end
  object Dept_queryProvider: TDataSetProvider
    DataSet = dept_query
    Left = 224
    Top = 160
  end
  object SQLDataSet1: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'delete from insa'#13#10'where dept_code =:code'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'code'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    Left = 144
    Top = 248
  end
  object SQLStoredProc1: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Precision = 4
        Name = 'PCODE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 6
        Name = 'PDEPT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Precision = 8
        Name = 'PSECTION'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection1
    StoredProcName = 'INSERT_DEPT'
    Left = 240
    Top = 248
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 336
    Top = 248
  end
  object Insa_Query: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'code'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select name, class'
      'from insa'
      'where dept_code = :code')
    SQLConnection = SQLConnection1
    Left = 328
    Top = 168
  end
  object Insa_QueryProvider: TDataSetProvider
    DataSet = Insa_Query
    Left = 424
    Top = 168
  end
  object Tot_Query: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CODE'
        ParamType = ptInput
        Size = 5
      end>
    SQL.Strings = (
      'select count(id) as total'
      'from insa'
      'where dept_code like :code')
    SQLConnection = SQLConnection1
    Left = 328
    Top = 104
  end
  object SubInsa_Query: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'code'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from insa'
      'where dept_code = :code')
    SQLConnection = SQLConnection1
    Left = 328
    Top = 32
  end
  object SubInsaProvider: TDataSetProvider
    DataSet = SubInsa_Query
    Left = 432
    Top = 32
  end
end
