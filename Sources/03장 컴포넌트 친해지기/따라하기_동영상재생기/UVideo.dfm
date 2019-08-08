object VideoPlayer_Form: TVideoPlayer_Form
  Left = 73
  Top = 106
  Caption = #48708#46356#50724#51116#49373#44592
  ClientHeight = 373
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 347
    Height = 202
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
  end
  object TrackBar1: TTrackBar
    Left = 0
    Top = 243
    Width = 347
    Height = 30
    Align = alBottom
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 273
    Width = 347
    Height = 81
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object mPlayFrame: TLabel
      Left = 87
      Top = 7
      Width = 67
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'mPlayFrame'
    end
    object mTotFrame: TLabel
      Left = 251
      Top = 8
      Width = 63
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'mTotFrame'
    end
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 71
      Height = 13
      AutoSize = False
      Caption = #54788#51116' '#54532#47112#51076
    end
    object Label2: TLabel
      Left = 183
      Top = 8
      Width = 68
      Height = 13
      AutoSize = False
      Caption = '  '#52509'  '#54532#47112#51076
    end
    object Label3: TLabel
      Left = 182
      Top = 24
      Width = 66
      Height = 13
      Caption = #52509' '#51116#49373#49884#44036' '
    end
    object mTime01: TLabel
      Left = 251
      Top = 22
      Width = 82
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'mTime01'
    end
    object mTime00: TLabel
      Left = 77
      Top = 22
      Width = 87
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'mTime00'
    end
    object Label5: TLabel
      Left = 19
      Top = 24
      Width = 54
      Height = 13
      Caption = #51116#49373' '#49884#44036' '
    end
    object mFileName: TPanel
      Left = 10
      Top = 48
      Width = 326
      Height = 25
      BevelOuter = bvLowered
      Caption = 'mFileName'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 347
    Height = 41
    Align = alTop
    TabOrder = 3
    object MediaPlayer1: TMediaPlayer
      Left = 144
      Top = 5
      Width = -6
      Height = 30
      EnabledButtons = [btPlay, btPause, btStop, btNext, btPrev, btStep, btBack]
      VisibleButtons = [btPlay, btPause, btStop, btNext, btPrev, btStep, btBack]
      Display = Panel1
      TabOrder = 0
      OnClick = MediaPlayer1Click
      OnNotify = MediaPlayer1Notify
    end
    object BitBtn1: TBitBtn
      Left = 0
      Top = 7
      Width = 66
      Height = 28
      Caption = 'Open'
      DoubleBuffered = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFFFF55555000000000055555577777777775F55500B8B8B8B8
        B05555775F555555575F550F0B8B8B8B8B05557F75F555555575550BF0B8B8B8
        B8B0557F575FFFFFFFF7550FBF0000000000557F557777777777500BFBFBFBFB
        0555577F555555557F550B0FBFBFBFBF05557F7F555555FF75550F0BFBFBF000
        55557F75F555577755550BF0BFBF0B0555557F575FFF757F55550FB700007F05
        55557F557777557F55550BFBFBFBFB0555557F555555557F55550FBFBFBFBF05
        55557FFFFFFFFF7555550000000000555555777777777755555550FBFB055555
        5555575FFF755555555557000075555555555577775555555555}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 72
      Top = 6
      Width = 66
      Height = 28
      Caption = 'Exit'
      DoubleBuffered = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = BitBtn2Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 354
    Width = 347
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 56
    Top = 56
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Avi Files|*.avi|MPEG Files|*.mpg|All Files|*.*'
    Left = 16
    Top = 57
  end
end
