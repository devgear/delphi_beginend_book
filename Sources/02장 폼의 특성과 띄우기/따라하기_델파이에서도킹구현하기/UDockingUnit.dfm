object Docking_Form: TDocking_Form
  Left = 0
  Top = 0
  Caption = #46020#53433#50696#51228
  ClientHeight = 378
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 272
    Top = 18
    Width = 138
    Height = 13
    Caption = #50500#47000' '#48260#53948#51012' '#53364#47533#54616#49901#49884#50724
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 266
    Height = 378
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 264
      Height = 48
      Align = alTop
      Caption = #51060#44275#50640' '#46020#53433#51060' '#46121#45768#45796'.'
      TabOrder = 0
    end
    object Docking_Panel: TPanel
      Left = 1
      Top = 49
      Width = 264
      Height = 328
      Align = alClient
      DockSite = True
      TabOrder = 1
      OnDockDrop = Docking_PanelDockDrop
      OnDockOver = Docking_PanelDockOver
      OnUnDock = Docking_PanelUnDock
    end
  end
  object Button1: TButton
    Left = 296
    Top = 49
    Width = 75
    Height = 25
    Caption = #53364#47533
    TabOrder = 1
    OnClick = Button1Click
  end
end
