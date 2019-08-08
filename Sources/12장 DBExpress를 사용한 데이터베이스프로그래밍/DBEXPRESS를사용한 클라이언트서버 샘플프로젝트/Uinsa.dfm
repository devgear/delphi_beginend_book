object insaForm: TinsaForm
  Left = 0
  Top = 0
  Caption = #49324#50896#44288#47532
  ClientHeight = 486
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 404
    Top = 20
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333FF3333333333333003333333333333F77F33333333333009033
      333333333F7737F333333333009990333333333F773337FFFFFF330099999000
      00003F773333377777770099999999999990773FF33333FFFFF7330099999000
      000033773FF33777777733330099903333333333773FF7F33333333333009033
      33333333337737F3333333333333003333333333333377333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 451
    Top = 20
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
      333333333337F33333333333333033333333333333373F333333333333090333
      33333333337F7F33333333333309033333333333337373F33333333330999033
      3333333337F337F33333333330999033333333333733373F3333333309999903
      333333337F33337F33333333099999033333333373333373F333333099999990
      33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333300033333333333337773333333}
    NumGlyphs = 2
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 427
    Top = 20
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
      3333333333777F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
      3333333777737777F333333099999990333333373F3333373333333309999903
      333333337F33337F33333333099999033333333373F333733333333330999033
      3333333337F337F3333333333099903333333333373F37333333333333090333
      33333333337F7F33333333333309033333333333337373333333333333303333
      333333333337F333333333333330333333333333333733333333}
    NumGlyphs = 2
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TSpeedButton
    Left = 472
    Top = 20
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333FF3333333333333003333
      3333333333773FF3333333333309003333333333337F773FF333333333099900
      33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
      99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
      33333333337F3F77333333333309003333333333337F77333333333333003333
      3333333333773333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    OnClick = SpeedButton4Click
  end
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 36
    Height = 13
    Caption = #44160#49353#49692
  end
  object Label2: TLabel
    Left = 224
    Top = 24
    Width = 48
    Height = 13
    Caption = #44160#49353#51060#47492
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 80
    Width = 521
    Height = 398
    ActivePage = TabSheet2
    MultiLine = True
    TabOrder = 0
    OnDragDrop = PageControl1DragDrop
    OnDragOver = PageControl1DragOver
    OnMouseDown = PageControl1MouseDown
    OnMouseMove = PageControl1MouseMove
    OnMouseUp = PageControl1MouseUp
    OnStartDrag = PageControl1StartDrag
    object TabSheet1: TTabSheet
      Caption = #51312#54924
      object TabControl1: TTabControl
        Left = 3
        Top = 3
        Width = 510
        Height = 364
        TabOrder = 0
        Tabs.Strings = (
          #51204#52404
          #49324#50896
          #45824#47532
          #44284#51109
          #48512#51109
          #52264#51109
          #51060#49324
          #49345#47924
          #51204#47924
          #49324#51109
          #54924#51109
          #51452#51076' '
          #51204#51076
          #52293#51076
          #49440#51076)
        TabIndex = 0
        OnChange = TabControl1Change
        object DBGrid1: TDBGrid
          Left = 3
          Top = 24
          Width = 504
          Height = 329
          DataSource = dm.insaSource
          ImeName = 'Microsoft IME 2003'
          Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #54200#51665
      ImageIndex = 1
      object Label3: TLabel
        Left = 30
        Top = 48
        Width = 24
        Height = 13
        Caption = #49324#48264
      end
      object Label4: TLabel
        Left = 30
        Top = 88
        Width = 24
        Height = 13
        Caption = #51060#47492
      end
      object Label5: TLabel
        Left = 30
        Top = 168
        Width = 24
        Height = 13
        Caption = #51649#44553
      end
      object Label6: TLabel
        Left = 30
        Top = 208
        Width = 48
        Height = 13
        Caption = #48512#49436#53076#46300
      end
      object Label7: TLabel
        Left = 30
        Top = 245
        Width = 48
        Height = 13
        Caption = #51077#49324#51068#51088
      end
      object Label8: TLabel
        Left = 30
        Top = 285
        Width = 24
        Height = 13
        Caption = #44553#50668
      end
      object Label9: TLabel
        Left = 30
        Top = 133
        Width = 24
        Height = 13
        Caption = #45208#51060
      end
      object Label10: TLabel
        Left = 230
        Top = 48
        Width = 24
        Height = 13
        Caption = #49324#51652
      end
      object DBEdit1: TDBEdit
        Left = 86
        Top = 45
        Width = 121
        Height = 21
        DataField = 'ID'
        DataSource = dm.insaSource
        ImeName = 'Microsoft IME 2003'
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 84
        Top = 85
        Width = 121
        Height = 21
        DataField = 'NAME'
        DataSource = dm.insaSource
        ImeName = 'Microsoft IME 2003'
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 86
        Top = 130
        Width = 121
        Height = 21
        DataField = 'AGE'
        DataSource = dm.insaSource
        ImeName = 'Microsoft IME 2003'
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 84
        Top = 242
        Width = 119
        Height = 21
        DataField = 'IPSA_DATE'
        DataSource = dm.insaSource
        ImeName = 'Microsoft IME 2003'
        TabOrder = 5
      end
      object DBEdit5: TDBEdit
        Left = 86
        Top = 277
        Width = 121
        Height = 21
        DataField = 'SALARY'
        DataSource = dm.insaSource
        ImeName = 'Microsoft IME 2003'
        TabOrder = 6
      end
      object DBComboBox1: TDBComboBox
        Left = 86
        Top = 165
        Width = 121
        Height = 21
        DataField = 'CLASS'
        DataSource = dm.insaSource
        ImeName = 'Microsoft IME 2003'
        Items.Strings = (
          #49324#50896
          #45824#47532
          #44284#51109
          #52264#51109
          #48512#51109
          #51060#49324
          #49345#47924)
        TabOrder = 3
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 84
        Top = 200
        Width = 123
        Height = 21
        DataField = 'DEPT_CODE'
        DataSource = dm.insaSource
        ImeName = 'Microsoft IME 2003'
        KeyField = 'CODE'
        ListField = 'SECTION'
        ListSource = dm.DeptSource
        TabOrder = 4
      end
      object DBImage1: TDBImage
        Left = 260
        Top = 40
        Width = 108
        Height = 146
        DataField = 'PHOTO'
        DataSource = dm.insaSource
        TabOrder = 7
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 385
        Top = 40
        Width = 97
        Height = 146
        Caption = #50629#47924#45733#47141
        DataField = 'GRADE'
        DataSource = dm.insaSource
        Items.Strings = (
          #47588#50864' '#51339#51008
          #51339#51020
          #48372#53685
          #44536#51200#44536#47100)
        ParentBackground = True
        TabOrder = 8
        Values.Strings = (
          '1'
          '2'
          '3'
          '4')
      end
      object Button1: TButton
        Left = 260
        Top = 216
        Width = 108
        Height = 33
        Caption = 'INSERT'
        TabOrder = 9
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 374
        Top = 216
        Width = 108
        Height = 33
        Caption = 'DELETE'
        TabOrder = 10
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 261
        Top = 264
        Width = 108
        Height = 33
        Caption = 'CANCEL'
        TabOrder = 11
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 375
        Top = 264
        Width = 108
        Height = 33
        Caption = 'POST'
        TabOrder = 12
        OnClick = Button4Click
      end
      object Button9: TButton
        Left = 264
        Top = 312
        Width = 104
        Height = 33
        Caption = #50892#46300#47196
        TabOrder = 13
        OnClick = Button9Click
      end
    end
    object TABSHEET3: TTabSheet
      Caption = #52264#53944
      ImageIndex = 2
      object DBChart1: TDBChart
        Left = 3
        Top = 3
        Width = 507
        Height = 246
        BackWall.Size = 3
        BottomWall.Color = clBlue
        BottomWall.Size = 4
        BottomWall.StartPosition = 1
        Gradient.Direction = gdFromBottomLeft
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          #49324#50896#48324' '#44553#50668' '#54788#54889)
        Chart3DPercent = 35
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Maximum = 6000000.000000000000000000
        LeftAxis.Minimum = 500000.000000000000000000
        LeftAxis.Title.Caption = #44553#50668#50529#49688
        LeftAxis.Title.Font.Style = [fsBold]
        Legend.Color = 16777088
        Legend.Font.Style = [fsBold]
        Legend.Frame.Width = 2
        Legend.TextStyle = ltsRightValue
        Pages.MaxPointsPerPage = 3
        View3DOptions.Zoom = 102
        BevelInner = bvLowered
        TabOrder = 0
        PrintMargins = (
          15
          26
          15
          26)
        ColorPaletteIndex = 13
        object Series1: TBarSeries
          BarPen.Width = 2
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Callout.Length = 21
          Marks.BackColor = 8454143
          Marks.Bevel = bvRaised
          Marks.Color = 8454143
          Marks.Font.Style = [fsBold]
          Marks.Frame.Width = 2
          Marks.Style = smsLabelPercent
          Marks.Visible = True
          DataSource = dm.INSA
          SeriesColor = clRed
          XLabelsSource = 'NAME'
          BarWidthPercent = 80
          Emboss.Color = 8553090
          Shadow.Color = 8553090
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          YValues.ValueSource = 'SALARY'
        end
        object Series2: TLineSeries
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Style = smsLabelPercent
          Marks.Visible = True
          DataSource = dm.INSA
          SeriesColor = clRed
          XLabelsSource = 'NAME'
          Pointer.Brush.Gradient.EndColor = clRed
          Pointer.Gradient.EndColor = clRed
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
          YValues.ValueSource = 'SALARY'
        end
      end
      object Button5: TButton
        Left = 3
        Top = 279
        Width = 75
        Height = 25
        Caption = #52376#51020
        TabOrder = 1
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 84
        Top = 279
        Width = 75
        Height = 25
        Caption = #51060#51204
        TabOrder = 2
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 3
        Top = 319
        Width = 75
        Height = 28
        Caption = #45796#51020
        TabOrder = 3
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 84
        Top = 327
        Width = 75
        Height = 24
        Caption = #47592#45149
        TabOrder = 4
        OnClick = Button8Click
      end
      object ComboBox2: TComboBox
        Left = 183
        Top = 327
        Width = 105
        Height = 21
        ImeName = 'Microsoft IME 2003'
        ItemIndex = 2
        TabOrder = 5
        Text = '100'
        OnChange = ComboBox2Change
        Items.Strings = (
          '50'
          '75'
          '100'
          '125'
          '150')
      end
      object CheckBox1: TCheckBox
        Left = 183
        Top = 279
        Width = 50
        Height = 26
        Caption = '3D'
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = CheckBox1Click
      end
      object ComboBox3: TComboBox
        Left = 338
        Top = 328
        Width = 145
        Height = 21
        ImeName = 'Microsoft IME 2003'
        ItemIndex = 0
        TabOrder = 7
        Text = #48744#44053
        OnChange = ComboBox3Change
        Items.Strings = (
          #48744#44053
          #54028#46993
          #45432#46993
          #52488#47197
          #50500#53216#50500)
      end
      object RadioGroup1: TRadioGroup
        Left = 338
        Top = 255
        Width = 145
        Height = 67
        Hint = '-1'
        Caption = #52264#53944#51333#47448
        ItemIndex = 0
        Items.Strings = (
          'BAR'
          'LINE')
        TabOrder = 8
        OnClick = RadioGroup1Click
      end
    end
  end
  object ComboBox1: TComboBox
    Left = 50
    Top = 21
    Width = 145
    Height = 21
    ImeName = 'Microsoft IME 2003'
    ItemIndex = 0
    TabOrder = 1
    Text = #48264#54840#49692
    OnChange = ComboBox1Change
    Items.Strings = (
      #48264#54840#49692
      #51060#47492#49692
      #48512#49436#49692)
  end
  object edit1: TEdit
    Left = 277
    Top = 21
    Width = 121
    Height = 21
    ImeName = 'Microsoft IME 2003'
    TabOrder = 2
    OnChange = edit1Change
    OnKeyPress = edit1KeyPress
  end
  object WordApplication1: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 424
    Top = 48
  end
  object WordDocument1: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 464
    Top = 48
  end
end
