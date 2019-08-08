object WebModule8: TWebModule8
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/PageProducer1'
      Producer = PageProducer1
    end
    item
      Name = 'WebActionItem1'
      PathInfo = '/Dept'
      Producer = DataSetTableProducer1
    end
    item
      Name = 'WebActionItem2'
      PathInfo = '/Insa'
      OnAction = WebModule8WebActionItem2Action
    end
    item
      Name = 'WebActionItem3'
      PathInfo = '/Etc'
    end>
  Height = 403
  Width = 472
  object SQLConnection1: TSQLConnection
    ConnectionName = 'SAMPLE'
    DriverName = 'INTERBASE'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxint.dll'
    LoginPrompt = False
    Params.Strings = (
      'drivername=INTERBASE'
      'blobsize=-1'
      'commitretain=False'
      'Database=D:\BOOK_SampleDB\SAMPLE.IB'
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
    Left = 368
    Top = 40
  end
  object Dept: TSQLTable
    Active = True
    MaxBlobSize = -1
    SQLConnection = SQLConnection1
    TableName = 'DEPT'
    Left = 368
    Top = 104
    object DeptCODE: TStringField
      FieldName = 'CODE'
      Size = 4
    end
    object DeptDEPT: TStringField
      FieldName = 'DEPT'
      Size = 6
    end
    object DeptSECTION: TStringField
      FieldName = 'SECTION'
      Size = 8
    end
  end
  object InsaQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'code'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from insa where dept_code = :code')
    SQLConnection = SQLConnection1
    Left = 368
    Top = 168
  end
  object Insa: TSQLTable
    Active = True
    IndexName = 'I_NAME'
    MaxBlobSize = 1
    SQLConnection = SQLConnection1
    TableName = 'INSA'
    Left = 368
    Top = 248
  end
  object DataSetTableProducer1: TDataSetTableProducer
    Columns = <
      item
        FieldName = 'CODE'
      end
      item
        FieldName = 'DEPT'
      end
      item
        FieldName = 'SECTION'
      end>
    DataSet = Dept
    TableAttributes.Border = 1
    OnFormatCell = DataSetTableProducer1FormatCell
    Left = 280
    Top = 104
  end
  object DataSetPageProducer1: TDataSetPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '<title>'#49324#50896#51221#48372'</title>'
      '</head>'
      '<body>'
      '<p><h2>'#49324#50896#51060#47492':<#Name></h2><p>'
      '<table border=0>'
      '<tr>'
      '<td><b>'#45208#51060': </b></td>'
      '<td><#Age></td>'
      '</tr>'
      '<tr>'
      '<td><b>'#51649#44553':</b></td>'
      '<td><#Class></td>'
      '</tr>'
      '<tr>'
      '<td><b>'#51077#49324#51068#51088':</b></td>'
      '<td><#Ipsa_date></td>'
      '</tr>'
      '</table>'
      '</body>')
    DataSet = Insa
    Left = 272
    Top = 240
  end
  object SQLQueryTableProducer1: TSQLQueryTableProducer
    Query = InsaQuery
    OnFormatCell = SQLQueryTableProducer1FormatCell
    Left = 280
    Top = 168
  end
  object PageProducer1: TPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '<title>'#45208#51032' '#54168#51060#51648'</title>'
      
        '<meta http-ecube="content-type" content="text/html; charset=euc-' +
        'kr">'
      '</head>'
      '</body>'
      '<p>'
      '<ul>'
      
        '<li><a href="http://localhost:80/kwk/PwebBroker.exe/Dept">'#48512#49436#47532#49828#53944'<' +
        '/p></a></ul>'
      '</body>'
      '</html>')
    Left = 272
    Top = 312
  end
end
