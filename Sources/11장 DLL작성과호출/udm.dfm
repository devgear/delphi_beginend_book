object Dm: TDm
  OldCreateOrder = False
  Height = 287
  Width = 357
  object Dept: TTable
    Active = True
    DatabaseName = 'sample'
    TableName = 'DEPT'
    Left = 40
    Top = 16
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
  object DeptSource: TDataSource
    DataSet = Dept
    Left = 80
    Top = 16
  end
  object Insa: TTable
    Active = True
    BeforeInsert = InsaBeforeInsert
    AfterPost = InsaAfterPost
    OnCalcFields = InsaCalcFields
    OnNewRecord = InsaNewRecord
    DatabaseName = 'sample'
    IndexFieldNames = 'DEPT_CODE'
    TableName = 'INSA'
    Left = 40
    Top = 72
    object InsaID: TIntegerField
      FieldName = 'ID'
    end
    object InsaNAME: TStringField
      DisplayLabel = #51060#47492
      DisplayWidth = 12
      FieldName = 'NAME'
      Size = 10
    end
    object InsaAGE: TSmallintField
      CustomConstraint = 'age >= 20 '
      ConstraintErrorMessage = #45320#47924#50612#47532#45796
      DisplayLabel = #45208#51060
      DisplayWidth = 12
      FieldName = 'AGE'
    end
    object InsaDEPT_CODE: TStringField
      DisplayLabel = #48512#49436#53076#46300
      DisplayWidth = 11
      FieldName = 'DEPT_CODE'
      Size = 4
    end
    object Insasection: TStringField
      FieldKind = fkLookup
      FieldName = 'section'
      LookupDataSet = Dept
      LookupKeyFields = 'CODE'
      LookupResultField = 'SECTION'
      KeyFields = 'DEPT_CODE'
      Lookup = True
    end
    object InsaCLASS: TStringField
      DisplayLabel = #51649#44553
      DisplayWidth = 11
      FieldName = 'CLASS'
      Size = 4
    end
    object InsaSALARY: TIntegerField
      DisplayLabel = #44553#50668
      DisplayWidth = 19
      FieldName = 'SALARY'
      DisplayFormat = '#,##0'#50896
    end
    object Insatax: TFloatField
      DisplayLabel = #49464#44552
      FieldKind = fkCalculated
      FieldName = 'tax'
      DisplayFormat = '#,##0'#50896
      Calculated = True
    end
    object InsaPHOTO: TGraphicField
      DisplayLabel = #49324#51652
      FieldName = 'PHOTO'
      Visible = False
      BlobType = ftGraphic
    end
    object InsaGRADE: TStringField
      DisplayLabel = #46321#44553
      DisplayWidth = 11
      FieldName = 'GRADE'
      Size = 1
    end
    object InsaIPSA_DATE: TDateField
      FieldName = 'IPSA_DATE'
    end
  end
  object InsaSource: TDataSource
    DataSet = Insa
    Left = 80
    Top = 72
  end
  object SubInsa: TTable
    Active = True
    DatabaseName = 'sample'
    IndexName = 'I_DEPT'
    MasterFields = 'CODE'
    MasterSource = DeptSource
    TableName = 'INSA'
    Left = 40
    Top = 136
  end
  object SubInsaSource: TDataSource
    DataSet = SubInsa
    Left = 80
    Top = 136
  end
  object InsaQuery: TQuery
    Active = True
    DatabaseName = 'sample'
    DataSource = DeptSource
    SQL.Strings = (
      'select * from insa'
      'where dept_code = :code')
    Left = 200
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'CODE'
        ParamType = ptUnknown
        Size = 5
      end>
  end
  object InsaQuery_Source: TDataSource
    DataSet = InsaQuery
    Left = 240
    Top = 16
  end
end
