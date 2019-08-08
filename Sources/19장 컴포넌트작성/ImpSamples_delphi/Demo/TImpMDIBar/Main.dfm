object MainForm: TMainForm
  Left = 213
  Top = 194
  Width = 870
  Height = 600
  Caption = 'ImpMDIBar '#45936#47784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 862
    Height = 25
    ButtonHeight = 21
    ButtonWidth = 55
    Caption = 'ToolBar1'
    EdgeBorders = [ebBottom]
    Flat = True
    ShowCaptions = True
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = #51116#44256#44288#47532
      ImageIndex = 0
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 55
      Top = 0
      Caption = #51064#49324#44288#47532
      ImageIndex = 1
      OnClick = ToolButton2Click
    end
    object ToolButton3: TToolButton
      Left = 110
      Top = 0
      Caption = #54924#44228#44288#47532
      ImageIndex = 2
      OnClick = ToolButton3Click
    end
    object ToolButton5: TToolButton
      Left = 165
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 173
      Top = 0
      Caption = #50500#47000
      ImageIndex = 3
      OnClick = ToolButton4Click
    end
    object ToolButton6: TToolButton
      Left = 228
      Top = 0
      Caption = #50948
      ImageIndex = 4
      OnClick = ToolButton6Click
    end
  end
  object ImpMDIBar1: TImpMDIBar
    Left = 0
    Top = 552
    Width = 862
    Height = 21
  end
end
