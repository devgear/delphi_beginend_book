object IWForm1: TIWForm1
  Left = 0
  Top = 0
  Width = 873
  Height = 623
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  ExtraHeader.Strings = (
    
      '<meta http-equiv="content-type" content="text/html; charset=ks_c' +
      '_5601-1987">')
  Title = #45936#48652#44592#50612' '#50728#46972#51064' '#49397' '#51452#47928#54788#54889' ('#49368#54540'^^)'
  SupportedBrowsers = [brNetscape7, brIE, brOpera, brSafari, brNetscape6]
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object IWDBGrid1: TIWDBGrid
    Left = 3
    Top = 39
    Width = 867
    Height = 322
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    StyleRenderOptions.RenderSize = True
    StyleRenderOptions.RenderPosition = True
    StyleRenderOptions.RenderFont = True
    StyleRenderOptions.RenderZIndex = True
    StyleRenderOptions.RenderVisibility = True
    StyleRenderOptions.RenderStatus = True
    StyleRenderOptions.RenderAbsolute = True
    BorderColors.Color = clNone
    BorderColors.Light = clNone
    BorderColors.Dark = clNone
    BGColor = clNone
    BorderSize = 1
    BorderStyle = tfDefault
    Caption = #51452#47928' '#47532#49828#53944
    CellPadding = 3
    CellSpacing = 0
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FrameBuffer = 40
    Lines = tlRows
    UseFrame = True
    UseSize = True
    ScrollToCurrentRow = True
    Columns = <
      item
        Alignment = taCenter
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'ORDERID'
        LinkField = 'ORDERID'
        OnClick = IWDBGrid1Columns0Click
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.Size = 10
        Title.Font.Style = []
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = #51452#47928#48264#54840
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taCenter
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'USERNAME'
        LinkField = 'ORDERID'
        OnClick = IWDBGrid1Columns0Click
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.Size = 10
        Title.Font.Style = []
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = #51452#47928#51088
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taCenter
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'ISCOMPANY'
        OnClick = IWDBGrid1Columns0Click
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.Size = 10
        Title.Font.Style = []
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = #44592#50629#50668#48512
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taCenter
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'COMPANY'
        LinkField = 'ORDERID'
        OnClick = IWDBGrid1Columns0Click
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.Size = 10
        Title.Font.Style = []
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = #44592#50629#51060#47492
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taCenter
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'TOTALCNT'
        OnClick = IWDBGrid1Columns0Click
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.Size = 10
        Title.Font.Style = []
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = #52852#54588#49688
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taCenter
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'REGDATE'
        OnClick = IWDBGrid1Columns0Click
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.Size = 10
        Title.Font.Style = []
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = #51452#47928#51068#51088
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end>
    DataSource = dsOrderList
    FooterRowCount = 0
    FriendlyName = 'IWDBGrid1'
    FromStart = True
    HighlightColor = clHighlightText
    HighlightRows = True
    Options = [dgShowTitles]
    RefreshMode = rmAutomatic
    RowLimit = 0
    RollOver = True
    RowClick = True
    RollOverColor = clInfoBk
    RowHeaderColor = clNone
    RowAlternateColor = clWebWHITE
    RowCurrentColor = clNone
    TabOrder = -1
  end
  object IWDBGrid2: TIWDBGrid
    Left = 3
    Top = 464
    Width = 867
    Height = 153
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    StyleRenderOptions.RenderSize = True
    StyleRenderOptions.RenderPosition = True
    StyleRenderOptions.RenderFont = True
    StyleRenderOptions.RenderZIndex = True
    StyleRenderOptions.RenderVisibility = True
    StyleRenderOptions.RenderStatus = True
    StyleRenderOptions.RenderAbsolute = True
    BorderColors.Color = clNone
    BorderColors.Light = clNone
    BorderColors.Dark = clNone
    BGColor = clNone
    BorderSize = 1
    BorderStyle = tfDefault
    Caption = #51452#47928' '#49345#49464' '#45236#50669
    CellPadding = 4
    CellSpacing = 0
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FrameBuffer = 40
    Lines = tlAll
    UseFrame = True
    UseSize = True
    ScrollToCurrentRow = False
    Columns = <
      item
        Alignment = taCenter
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'ITEMID'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.Size = 10
        Title.Font.Style = []
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = #48264#54840
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taCenter
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'ITEMNAME'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.Size = 10
        Title.Font.Style = []
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = #51228#54408#47749
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taCenter
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'PRICE'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.Size = 10
        Title.Font.Style = []
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = #45800#44032
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taCenter
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'ORDERCNT'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.Size = 10
        Title.Font.Style = []
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = #51452#47928#49688#47049
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taCenter
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'TOTALPRICE'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.Size = 10
        Title.Font.Style = []
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = #49548#44228
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end>
    DataSource = dsItemList
    FooterRowCount = 0
    FriendlyName = 'IWDBGrid1'
    FromStart = True
    HighlightColor = clHighlightText
    HighlightRows = False
    Options = [dgShowTitles]
    RefreshMode = rmAutomatic
    RowLimit = 0
    RollOver = True
    RowClick = False
    RollOverColor = clInfoBk
    RowHeaderColor = clNone
    RowAlternateColor = clNone
    RowCurrentColor = clNone
    TabOrder = -1
  end
  object IWDBLabel9: TIWDBLabel
    Left = 91
    Top = 378
    Width = 57
    Height = 16
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    StyleRenderOptions.RenderSize = True
    StyleRenderOptions.RenderPosition = True
    StyleRenderOptions.RenderFont = True
    StyleRenderOptions.RenderZIndex = True
    StyleRenderOptions.RenderVisibility = True
    StyleRenderOptions.RenderStatus = True
    StyleRenderOptions.RenderAbsolute = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    DataField = 'ORDERID'
    DataSource = dsOrderList
    FriendlyName = 'IWDBLabel1'
  end
  object IWLabel7: TIWLabel
    Left = 11
    Top = 378
    Width = 75
    Height = 16
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    StyleRenderOptions.RenderSize = True
    StyleRenderOptions.RenderPosition = True
    StyleRenderOptions.RenderFont = True
    StyleRenderOptions.RenderZIndex = True
    StyleRenderOptions.RenderVisibility = True
    StyleRenderOptions.RenderStatus = True
    StyleRenderOptions.RenderAbsolute = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsBold]
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = #51452#47928#48264#54840':'
    RawText = False
  end
  object IWDBLabel10: TIWDBLabel
    Left = 291
    Top = 378
    Width = 59
    Height = 16
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    StyleRenderOptions.RenderSize = True
    StyleRenderOptions.RenderPosition = True
    StyleRenderOptions.RenderFont = True
    StyleRenderOptions.RenderZIndex = True
    StyleRenderOptions.RenderVisibility = True
    StyleRenderOptions.RenderStatus = True
    StyleRenderOptions.RenderAbsolute = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    DataField = 'REGDATE'
    DataSource = dsOrderList
    FriendlyName = 'IWDBLabel1'
  end
  object IWLabel8: TIWLabel
    Left = 211
    Top = 378
    Width = 75
    Height = 16
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    StyleRenderOptions.RenderSize = True
    StyleRenderOptions.RenderPosition = True
    StyleRenderOptions.RenderFont = True
    StyleRenderOptions.RenderZIndex = True
    StyleRenderOptions.RenderVisibility = True
    StyleRenderOptions.RenderStatus = True
    StyleRenderOptions.RenderAbsolute = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsBold]
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = #51452#47928#51068#51088':'
    RawText = False
  end
  object IWLabel9: TIWLabel
    Left = 225
    Top = 0
    Width = 382
    Height = 33
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    StyleRenderOptions.RenderSize = True
    StyleRenderOptions.RenderPosition = True
    StyleRenderOptions.RenderFont = True
    StyleRenderOptions.RenderZIndex = True
    StyleRenderOptions.RenderVisibility = True
    StyleRenderOptions.RenderStatus = True
    StyleRenderOptions.RenderAbsolute = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clHighlight
    Font.Size = 20
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'IWLabel9'
    Caption = #45936#48652#44592#50612' '#50728#46972#51064' '#49397' '#51452#47928#54788#54889
    RawText = False
  end
  object IWRegion1: TIWRegion
    Left = 3
    Top = 402
    Width = 867
    Height = 56
    Cursor = crAuto
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    RenderInvisibleControls = False
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsSolid
    BorderOptions.Color = clNone
    Color = clNone
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1000
    Splitter = False
    object IWDBLabel1: TIWDBLabel
      Left = 89
      Top = 8
      Width = 70
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      StyleRenderOptions.RenderSize = True
      StyleRenderOptions.RenderPosition = True
      StyleRenderOptions.RenderFont = True
      StyleRenderOptions.RenderZIndex = True
      StyleRenderOptions.RenderVisibility = True
      StyleRenderOptions.RenderStatus = True
      StyleRenderOptions.RenderAbsolute = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      DataField = 'USERNAME'
      DataSource = dsOrderList
      FriendlyName = 'IWDBLabel1'
    end
    object IWLabel1: TIWLabel
      Left = 8
      Top = 8
      Width = 40
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      StyleRenderOptions.RenderSize = True
      StyleRenderOptions.RenderPosition = True
      StyleRenderOptions.RenderFont = True
      StyleRenderOptions.RenderZIndex = True
      StyleRenderOptions.RenderVisibility = True
      StyleRenderOptions.RenderStatus = True
      StyleRenderOptions.RenderAbsolute = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = [fsBold]
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = #51060#47492':'
      RawText = False
    end
    object IWDBLabel2: TIWDBLabel
      Left = 212
      Top = 8
      Width = 103
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      StyleRenderOptions.RenderSize = True
      StyleRenderOptions.RenderPosition = True
      StyleRenderOptions.RenderFont = True
      StyleRenderOptions.RenderZIndex = True
      StyleRenderOptions.RenderVisibility = True
      StyleRenderOptions.RenderStatus = True
      StyleRenderOptions.RenderAbsolute = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      DataField = 'USERNAME_ENG'
      DataSource = dsOrderList
      FriendlyName = 'IWDBLabel1'
    end
    object IWDBLabel3: TIWDBLabel
      Left = 88
      Top = 30
      Width = 62
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      StyleRenderOptions.RenderSize = True
      StyleRenderOptions.RenderPosition = True
      StyleRenderOptions.RenderFont = True
      StyleRenderOptions.RenderZIndex = True
      StyleRenderOptions.RenderVisibility = True
      StyleRenderOptions.RenderStatus = True
      StyleRenderOptions.RenderAbsolute = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      DataField = 'COMPANY'
      DataSource = dsOrderList
      FriendlyName = 'IWDBLabel1'
    end
    object IWLabel2: TIWLabel
      Left = 8
      Top = 30
      Width = 75
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      StyleRenderOptions.RenderSize = True
      StyleRenderOptions.RenderPosition = True
      StyleRenderOptions.RenderFont = True
      StyleRenderOptions.RenderZIndex = True
      StyleRenderOptions.RenderVisibility = True
      StyleRenderOptions.RenderStatus = True
      StyleRenderOptions.RenderAbsolute = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = [fsBold]
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = #54924#49324#51060#47492':'
      RawText = False
    end
    object IWDBLabel4: TIWDBLabel
      Left = 212
      Top = 30
      Width = 95
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      StyleRenderOptions.RenderSize = True
      StyleRenderOptions.RenderPosition = True
      StyleRenderOptions.RenderFont = True
      StyleRenderOptions.RenderZIndex = True
      StyleRenderOptions.RenderVisibility = True
      StyleRenderOptions.RenderStatus = True
      StyleRenderOptions.RenderAbsolute = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      DataField = 'COMPANY_ENG'
      DataSource = dsOrderList
      FriendlyName = 'IWDBLabel1'
    end
    object IWDBLabel5: TIWDBLabel
      Left = 480
      Top = 8
      Width = 72
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      StyleRenderOptions.RenderSize = True
      StyleRenderOptions.RenderPosition = True
      StyleRenderOptions.RenderFont = True
      StyleRenderOptions.RenderZIndex = True
      StyleRenderOptions.RenderVisibility = True
      StyleRenderOptions.RenderStatus = True
      StyleRenderOptions.RenderAbsolute = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      DataField = 'USEREMAIL'
      DataSource = dsOrderList
      FriendlyName = 'IWDBLabel1'
    end
    object IWLabel3: TIWLabel
      Left = 409
      Top = 8
      Width = 75
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      StyleRenderOptions.RenderSize = True
      StyleRenderOptions.RenderPosition = True
      StyleRenderOptions.RenderFont = True
      StyleRenderOptions.RenderZIndex = True
      StyleRenderOptions.RenderVisibility = True
      StyleRenderOptions.RenderStatus = True
      StyleRenderOptions.RenderAbsolute = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = [fsBold]
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = #47700#51068#51452#49548':'
      RawText = False
    end
    object IWDBLabel6: TIWDBLabel
      Left = 480
      Top = 30
      Width = 70
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      StyleRenderOptions.RenderSize = True
      StyleRenderOptions.RenderPosition = True
      StyleRenderOptions.RenderFont = True
      StyleRenderOptions.RenderZIndex = True
      StyleRenderOptions.RenderVisibility = True
      StyleRenderOptions.RenderStatus = True
      StyleRenderOptions.RenderAbsolute = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      DataField = 'HOMEPAGE'
      DataSource = dsOrderList
      FriendlyName = 'IWDBLabel1'
    end
    object IWLabel4: TIWLabel
      Left = 409
      Top = 30
      Width = 75
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      StyleRenderOptions.RenderSize = True
      StyleRenderOptions.RenderPosition = True
      StyleRenderOptions.RenderFont = True
      StyleRenderOptions.RenderZIndex = True
      StyleRenderOptions.RenderVisibility = True
      StyleRenderOptions.RenderStatus = True
      StyleRenderOptions.RenderAbsolute = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = [fsBold]
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = #54856#54168#51060#51648':'
      RawText = False
    end
    object IWDBLabel7: TIWDBLabel
      Left = 744
      Top = 8
      Width = 77
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      StyleRenderOptions.RenderSize = True
      StyleRenderOptions.RenderPosition = True
      StyleRenderOptions.RenderFont = True
      StyleRenderOptions.RenderZIndex = True
      StyleRenderOptions.RenderVisibility = True
      StyleRenderOptions.RenderStatus = True
      StyleRenderOptions.RenderAbsolute = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      DataField = 'USERPHONE'
      DataSource = dsOrderList
      FriendlyName = 'IWDBLabel1'
    end
    object IWLabel5: TIWLabel
      Left = 664
      Top = 8
      Width = 75
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      StyleRenderOptions.RenderSize = True
      StyleRenderOptions.RenderPosition = True
      StyleRenderOptions.RenderFont = True
      StyleRenderOptions.RenderZIndex = True
      StyleRenderOptions.RenderVisibility = True
      StyleRenderOptions.RenderStatus = True
      StyleRenderOptions.RenderAbsolute = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = [fsBold]
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = #51204#54868#48264#54840':'
      RawText = False
    end
    object IWDBLabel8: TIWDBLabel
      Left = 744
      Top = 30
      Width = 81
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      StyleRenderOptions.RenderSize = True
      StyleRenderOptions.RenderPosition = True
      StyleRenderOptions.RenderFont = True
      StyleRenderOptions.RenderZIndex = True
      StyleRenderOptions.RenderVisibility = True
      StyleRenderOptions.RenderStatus = True
      StyleRenderOptions.RenderAbsolute = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      DataField = 'COMPANYNO'
      DataSource = dsOrderList
      FriendlyName = 'IWDBLabel1'
    end
    object IWLabel6: TIWLabel
      Left = 664
      Top = 30
      Width = 93
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      StyleRenderOptions.RenderSize = True
      StyleRenderOptions.RenderPosition = True
      StyleRenderOptions.RenderFont = True
      StyleRenderOptions.RenderZIndex = True
      StyleRenderOptions.RenderVisibility = True
      StyleRenderOptions.RenderStatus = True
      StyleRenderOptions.RenderAbsolute = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = [fsBold]
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = #49324#50629#51088#48264#54840':'
      RawText = False
    end
  end
  object SQLConnection: TSQLConnection
    DriverName = 'FIREBIRD'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver150.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=15.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver150.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=15.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'VendorLib=fbclient.DLL'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False'
      'drivername=FIREBIRD'
      'Database=localhost:D:\Book_SampleDB\ONLINESHOPDB.FDB')
    VendorLib = 'fbclient.dll'
    Left = 25
    Top = 15
  end
  object qrOrderList: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select'#13#10'    o.*, i.totalcnt'#13#10'from TB_SHOPORDER o'#13#10'    inner join' +
      ' (select orderid, sum(ordercnt) as totalcnt from tb_shoporderite' +
      'm where shopid='#39'DEVGEAR'#39' group by orderid) i on o.orderid=i.orde' +
      'rid'#13#10'order by o.ORDERID'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 25
    Top = 88
    object qrOrderListSHOPID: TStringField
      FieldName = 'SHOPID'
      Required = True
    end
    object qrOrderListORDERID: TIntegerField
      FieldName = 'ORDERID'
      Required = True
    end
    object qrOrderListUSERNAME: TStringField
      FieldName = 'USERNAME'
    end
    object qrOrderListUSERNAME_ENG: TStringField
      FieldName = 'USERNAME_ENG'
    end
    object qrOrderListUSEREMAIL: TStringField
      FieldName = 'USEREMAIL'
      Size = 100
    end
    object qrOrderListUSERPHONE: TStringField
      FieldName = 'USERPHONE'
    end
    object qrOrderListISCOMPANY: TSmallintField
      FieldName = 'ISCOMPANY'
      Required = True
    end
    object qrOrderListCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 30
    end
    object qrOrderListCOMPANY_ENG: TStringField
      FieldName = 'COMPANY_ENG'
      Size = 30
    end
    object qrOrderListCOMPANYNO: TStringField
      FieldName = 'COMPANYNO'
      Size = 50
    end
    object qrOrderListHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 200
    end
    object qrOrderListREGDATE: TSQLTimeStampField
      FieldName = 'REGDATE'
    end
    object qrOrderListTOTALCNT: TLargeintField
      FieldName = 'TOTALCNT'
    end
  end
  object dsOrderList: TDataSource
    DataSet = qrOrderList
    Left = 23
    Top = 256
  end
  object dsItemList: TDataSource
    DataSet = qrItemList
    Left = 137
    Top = 256
  end
  object qrItemList: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select'#13#10'  i.itemid, s.itemname, s.price, i.ordercnt, s.price*i.o' +
      'rdercnt as totalprice'#13#10'from TB_SHOPORDERITEM i'#13#10'inner join tb_sh' +
      'opitem s on s.itemid=i.itemid'#13#10'where ORDERID=:ORDERID'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ORDERID'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnection
    Left = 137
    Top = 88
  end
  object cdsOrderList: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'SHOPID'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ORDERID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'USERNAME'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'USERNAME_ENG'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'USEREMAIL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'USERPHONE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SMALLIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ISCOMPANY'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'COMPANY'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'COMPANY_ENG'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'COMPANYNO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'HOMEPAGE'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'REGDATE'
        DataType = ftTimeStamp
      end
      item
        Name = 'TOTALCNT'
        DataType = ftLargeint
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspOrderList'
    StoreDefs = True
    Left = 24
    Top = 200
    object cdsOrderListSHOPID: TStringField
      FieldName = 'SHOPID'
      Required = True
    end
    object cdsOrderListORDERID: TIntegerField
      FieldName = 'ORDERID'
      Required = True
    end
    object cdsOrderListUSERNAME: TStringField
      FieldName = 'USERNAME'
    end
    object cdsOrderListUSERNAME_ENG: TStringField
      FieldName = 'USERNAME_ENG'
    end
    object cdsOrderListUSEREMAIL: TStringField
      FieldName = 'USEREMAIL'
      Size = 100
    end
    object cdsOrderListUSERPHONE: TStringField
      FieldName = 'USERPHONE'
    end
    object cdsOrderListISCOMPANY: TSmallintField
      FieldName = 'ISCOMPANY'
      Required = True
    end
    object cdsOrderListCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 30
    end
    object cdsOrderListCOMPANY_ENG: TStringField
      FieldName = 'COMPANY_ENG'
      Size = 30
    end
    object cdsOrderListCOMPANYNO: TStringField
      FieldName = 'COMPANYNO'
      Size = 50
    end
    object cdsOrderListHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 200
    end
    object cdsOrderListREGDATE: TSQLTimeStampField
      FieldName = 'REGDATE'
    end
    object cdsOrderListTOTALCNT: TLargeintField
      FieldName = 'TOTALCNT'
    end
  end
  object dspOrderList: TDataSetProvider
    DataSet = qrOrderList
    Left = 24
    Top = 144
  end
  object dspItemList: TDataSetProvider
    DataSet = qrItemList
    Left = 136
    Top = 144
  end
  object cdsItemList: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItemList'
    Left = 136
    Top = 200
    object cdsItemListITEMID: TIntegerField
      FieldName = 'ITEMID'
      Required = True
    end
    object cdsItemListITEMNAME: TStringField
      FieldName = 'ITEMNAME'
      Required = True
      Size = 100
    end
    object cdsItemListPRICE: TIntegerField
      FieldName = 'PRICE'
    end
    object cdsItemListORDERCNT: TIntegerField
      FieldName = 'ORDERCNT'
    end
    object cdsItemListTOTALPRICE: TLargeintField
      FieldName = 'TOTALPRICE'
    end
  end
end
