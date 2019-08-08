object ServerMethods: TServerMethods
  OldCreateOrder = False
  Height = 588
  Width = 566
  object SQLConnection: TSQLConnection
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
      'Database=D:\Book_SampleDB\MUSICMALL.IB'
      'localecode=0000'
      'Password=masterkey'
      'rolename=RoleName'
      'sqldialect=3'
      'isolationlevel=ReadCommitted'
      'user_name=sysdba'
      'waitonlocks=True'
      'trim char=False')
    VendorLib = 'GDS32.DLL'
    Connected = True
    Left = 248
    Top = 24
  end
  object OrderTable: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'order'
    Left = 56
    Top = 104
  end
  object OrderTableProvider: TDataSetProvider
    DataSet = OrderTable
    Left = 88
    Top = 104
  end
  object OrderedProductsQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pnum'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM "ordered_products"'
      'WHERE "order_num" = :pnum')
    SQLConnection = SQLConnection
    Left = 56
    Top = 168
  end
  object OrderedProductsQueryProvider: TDataSetProvider
    DataSet = OrderedProductsQuery
    Left = 96
    Top = 168
  end
  object InvoiceQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pnum'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM "invoice"'
      'WHERE "order_num" = :pnum')
    SQLConnection = SQLConnection
    Left = 56
    Top = 240
  end
  object InvoiceQueryProvider: TDataSetProvider
    DataSet = InvoiceQuery
    Left = 64
    Top = 248
  end
  object MemberQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pnum'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM "member"'
      'WHERE "id" = :pnum')
    SQLConnection = SQLConnection
    Left = 344
    Top = 104
  end
  object MemberQueryProvider: TDataSetProvider
    DataSet = MemberQuery
    Left = 376
    Top = 104
  end
  object InsertOrderQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'porder_num'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pid'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftDateTime
        Name = 'pdate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pdelivery_charge'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pdelivery_state'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'ptotal_mileage'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ptotal_charge'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'INSERT INTO "order"'
      
        '("order_num",  "id", "date", "delivery_charge", "delivery_state"' +
        ', "total_mileage", "total_charge")'
      
        'VALUES (:porder_num, :pid, :pdate, :pdelivery_charge, :pdelivery' +
        '_state, :ptotal_mileage, :ptotal_charge);')
    SQLConnection = SQLConnection
    Left = 304
    Top = 472
  end
  object GetOrderNumQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 40
    Top = 472
  end
  object InsertInvoiceQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'porder_num'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pinvoice_num'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pname'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ptel'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'paddress'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO "invoice"'
      '("order_num",  "invoice_num", "name", "tel", "address")'
      'VALUES (:porder_num, :pinvoice_num, :pname, :ptel, :paddress);')
    SQLConnection = SQLConnection
    Left = 392
    Top = 472
  end
  object InsertOrderedProductsSQLQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'porder_num'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pdate'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pproduct_num'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pname'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pprice'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pa_unit_mileage'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pquantity'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'preturn'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO "ordered_products"'
      
        '("order_num", "order_date", "product_num", "name", "price", "a_u' +
        'nit_mileage", "quantity", "return")'
      
        'VALUES (:porder_num, :pdate, :pproduct_num, :pname, :pprice, :pa' +
        '_unit_mileage, :pquantity, :preturn);')
    SQLConnection = SQLConnection
    Left = 216
    Top = 472
  end
  object CartQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'pid'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM "cart"'
      'WHERE "id" = :pid')
    SQLConnection = SQLConnection
    Left = 488
    Top = 272
  end
  object ProductQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'pproduct_num'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM "product"'
      'WHERE "product_num" = :pproduct_num')
    SQLConnection = SQLConnection
    Left = 216
    Top = 408
  end
  object InsertProductToCartQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'pid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pproduct_num'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'quantity'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO "cart"'
      '("id", "product_num", "quantity")'
      'VALUES (:pid, :pproduct_num, :quantity)')
    SQLConnection = SQLConnection
    Left = 128
    Top = 408
  end
  object ProductStockUpdateQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'pnewstock'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pproduct_num'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'update "product" set "stock_num"=:pnewstock'
      'where "product_num" = :pproduct_num')
    SQLConnection = SQLConnection
    Left = 320
    Top = 408
  end
  object CartDelQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'pid'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from "cart" where "id" = :pid')
    SQLConnection = SQLConnection
    Left = 488
    Top = 368
  end
  object CartUpateQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'pquantity'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pproduct_num'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'update "cart" set "quantity"= :pquantity'
      'where "product_num" = :pproduct_num')
    SQLConnection = SQLConnection
    Left = 488
    Top = 320
  end
  object ProductTable: TSQLTable
    MaxBlobSize = 1
    SQLConnection = SQLConnection
    TableName = 'product'
    Left = 216
    Top = 104
  end
  object ProductTableProvider: TDataSetProvider
    DataSet = ProductTable
    Left = 256
    Top = 104
  end
  object CartQueryProvider: TDataSetProvider
    DataSet = CartQuery
    Left = 488
    Top = 232
  end
  object CartProductDelQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'pid'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pnum'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from "cart" '
      'where "id" = :pid and "product_num" = :pnum'
      '')
    SQLConnection = SQLConnection
    Left = 488
    Top = 416
  end
  object ProductQueryProvider: TDataSetProvider
    DataSet = ProductQuery
    Left = 216
    Top = 352
  end
  object OrderedProductByMonth: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'begin_date'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'end_date'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select "name", sum("quantity") '
      'from "ordered_products"'
      'where "order_date" >= :begin_date and "order_date" <= :end_date'
      'group by "name"'
      'order by "quantity" desc')
    SQLConnection = SQLConnection
    Left = 224
    Top = 200
  end
  object OrderedProductByMonthProvider: TDataSetProvider
    DataSet = OrderedProductByMonth
    Left = 224
    Top = 256
  end
  object VisitCountTable: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'visitcount'
    Left = 488
    Top = 104
  end
  object VisitCountProvider: TDataSetProvider
    DataSet = VisitCountTable
    Left = 488
    Top = 160
  end
  object MemberTable: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection
    TableName = 'member'
    Left = 376
    Top = 184
  end
  object MemberTableProvider: TDataSetProvider
    DataSet = MemberTable
    Left = 376
    Top = 232
  end
end
