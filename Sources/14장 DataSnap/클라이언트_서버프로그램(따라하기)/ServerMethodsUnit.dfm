object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 255
  Width = 330
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
    VendorLib = 'GDS32.DLL'
    Connected = True
    Left = 40
    Top = 24
  end
  object dept: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection1
    TableName = 'DEPT'
    Left = 120
    Top = 24
  end
  object deptprovider: TDataSetProvider
    DataSet = dept
    Left = 176
    Top = 24
  end
  object insaQuery: TSQLQuery
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
    Left = 120
    Top = 96
  end
  object insaqueryprovider: TDataSetProvider
    DataSet = insaQuery
    Left = 176
    Top = 96
  end
  object totQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'pcode'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select count(id) as total'
      'from insa'
      'where dept_code like :pcode')
    SQLConnection = SQLConnection1
    Left = 248
    Top = 24
  end
end
