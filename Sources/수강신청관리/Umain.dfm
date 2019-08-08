object mainForm: TmainForm
  Left = 0
  Top = 0
  Caption = #49688#44053#49888#52397#44288#47532
  ClientHeight = 101
  ClientWidth = 715
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 715
    Height = 79
    AutoSize = True
    Bands = <
      item
        Control = ActionMainMenuBar1
        ImageIndex = -1
        Width = 709
      end
      item
        Control = ActionToolBar1
        ImageIndex = -1
        MinHeight = 23
        Width = 709
      end
      item
        Control = ActionToolBar2
        ImageIndex = -1
        MinHeight = 23
        Width = 709
      end>
    DockSite = True
    object ActionMainMenuBar1: TActionMainMenuBar
      Left = 12
      Top = 0
      Width = 695
      Height = 25
      UseSystemFont = False
      ActionManager = ActionManager1
      Caption = 'ActionMainMenuBar1'
      ColorMap.HighlightColor = 15660791
      ColorMap.BtnSelectedColor = clBtnFace
      ColorMap.UnusedColor = 15660791
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548
      Font.Style = []
      PersistentHotKeys = True
      Spacing = 0
    end
    object ActionToolBar1: TActionToolBar
      Left = 12
      Top = 27
      Width = 695
      Height = 23
      ActionManager = ActionManager1
      Caption = 'ActionToolBar1'
      ColorMap.HighlightColor = 15660791
      ColorMap.BtnSelectedColor = clBtnFace
      ColorMap.UnusedColor = 15660791
      Spacing = 0
    end
    object ActionToolBar2: TActionToolBar
      Left = 12
      Top = 52
      Width = 695
      Height = 23
      ActionManager = ActionManager1
      Caption = 'ActionToolBar1'
      ColorMap.HighlightColor = 15660791
      ColorMap.BtnSelectedColor = clBtnFace
      ColorMap.UnusedColor = 15660791
      Spacing = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 80
    Width = 715
    Height = 21
    AutoHint = True
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = Accept_Action
                Caption = #49688#44053#49888#52397#51217#49688'(&Z)'
              end
              item
                Action = listofCustomer_Action
                Caption = #44256#44061#48324#51068#51221'(&Y)'
              end
              item
                Action = ListOfCurri_Action
                Caption = #44284#47785#48324#51068#51221'(&X)'
              end
              item
                Action = ListOfRoom_Action
                Caption = #44053#51032#49892#48324#51068#51221'(&W)'
              end>
            Caption = #49688#44053#49888#52397'(&Y)'
          end
          item
            Items = <
              item
                Action = custregister_Action
                Caption = #46321#47197'(&Z)'
              end
              item
                Action = announce_Action
                Caption = #53685#48372'(&Y)'
              end>
            Caption = #44256#44061'(&Z)'
          end
          item
            Items = <
              item
                Action = CurriOpen_Action
                Caption = #44053#51032#44060#49444'(&Z)'
              end
              item
                Action = curriappend_Action
                Caption = #44053#51032#46321#47197'(&Y)'
              end
              item
                Action = Email_Action
                Caption = #47700#51068#54869#51064'(&X)'
              end>
            Caption = #50868#50689'(&X)'
          end
          item
            Items = <
              item
                Action = RollBook_Action
                Caption = #52636#49437#48512'(&Z)'
              end
              item
                Action = Certificaion_Action
                Caption = #49688#47308#51613'(&Y)'
              end
              item
                Action = printsertup_Action
                Caption = #54532#47536#53552#49483#50629'(&X)'
              end>
            Caption = #52636#47141'(&W)'
          end>
        ActionBar = ActionMainMenuBar1
      end
      item
        Items = <
          item
            Action = announce_Action
            Caption = #53685#48372'(&Y)'
          end
          item
            Action = custregister_Action
            Caption = #46321#47197'(&Z)'
          end
          item
            Caption = '-'
          end
          item
            Action = ListOfRoom_Action
            Caption = #44053#51032#49892#48324#51068#51221'(&U)'
          end
          item
            Action = ListOfCurri_Action
            Caption = #44284#47785#48324#51068#51221'(&V)'
          end
          item
            Action = listofCustomer_Action
            Caption = #44256#44061#48324#51068#51221'(&W)'
          end
          item
            Action = Accept_Action
            Caption = #49688#44053#49888#52397#51217#49688'(&X)'
          end>
        ActionBar = ActionToolBar1
      end
      item
        Items = <
          item
            Action = CurriOpen_Action
            Caption = #44053#51032#44060#49444'(&Z)'
          end
          item
            Action = curriappend_Action
            Caption = #44053#51032#46321#47197'(&Y)'
          end
          item
            Action = Email_Action
            Caption = #47700#51068#54869#51064'(&X)'
          end
          item
            Caption = '-'
          end
          item
            Action = printsertup_Action
            Caption = #54532#47536#53552#49483#50629'(&U)'
          end
          item
            Action = Certificaion_Action
            Caption = #49688#47308#51613'(&V)'
          end
          item
            Action = RollBook_Action
            Caption = #52636#49437#48512'(&W)'
          end>
        ActionBar = ActionToolBar2
      end>
    Images = ImageList1
    Left = 600
    Top = 32
    StyleName = 'Platform Default'
    object Accept_Action: TAction
      Category = #49688#44053#49888#52397
      Caption = #49688#44053#49888#52397#51217#49688
      Hint = #49688#44053#49888#52397' '#47532#49828#53944#47484' '#51217#49688#52376#47532
      OnExecute = Accept_ActionExecute
    end
    object student_action: TAction
      Category = '(No Category)'#47532
      Caption = #49688#44053#49373#44288#47532
    end
    object RollBook_Action: TAction
      Category = #52636#47141
      Caption = #52636#49437#48512
      Hint = #44284#47785#48324#47196' '#52636#49437#48512' '#52636#47141#54633#45768#45796
    end
    object Certificaion_Action: TAction
      Category = #52636#47141
      Caption = #49688#47308#51613
      Hint = #51060#49688#54620' '#44284#47785#51032' '#49688#47308#51613#51012' '#52636#47141#54633#45768#45796'.'
    end
    object curri_action: TAction
      Caption = #44053#51032#44060#49444
    end
    object Action5: TAction
      Caption = #44053#51032#46321#47197
    end
    object printsertup_Action: TAction
      Category = #52636#47141
      Caption = #54532#47536#53552#49483#50629
    end
    object listofCustomer_Action: TAction
      Category = #49688#44053#49888#52397
      Caption = #44256#44061#48324#51068#51221
      Hint = #44256#44061#48324','#54924#49324#48324','#49688#44053#51068#49688#49692#51004#47196' '#51312#54924
    end
    object ListOfCurri_Action: TAction
      Category = #49688#44053#49888#52397
      Caption = #44284#47785#48324#51068#51221
      Hint = #44284#47785#48324#47196' '#44060#49444#46108' '#44592#44036#51012' '#51312#54924
    end
    object ListOfRoom_Action: TAction
      Category = #49688#44053#49888#52397
      Caption = #44053#51032#49892#48324#51068#51221
      Hint = #50900#48324#47196' '#44053#51032#49892#50640' '#50696#50557#46108' '#44053#51032' '#51312#54924'..'
    end
    object custregister_Action: TAction
      Category = #44256#44061
      Caption = #46321#47197
      Hint = #44256#44061#47749#45800' '#54869#51064#48143' '#51312#54924','#51077#47141#51089#50629
      OnExecute = custregister_ActionExecute
    end
    object announce_Action: TAction
      Category = #44256#44061
      Caption = #53685#48372
      Hint = #44256#44061#50640#44172' '#51064#53552#45367#51004#47196' '#49688#44053#49888#52397#51060' '#51217#49688#46104#50632#51020#51012' '#50508#47532#45716' '#51060#47700#51068#51012' '#46916#50868#45796'.'
    end
    object CurriOpen_Action: TAction
      Category = #50868#50689
      Caption = #44053#51032#44060#49444
      Hint = #49352#47213#44172' '#52964#47532#53336#47100#51012' '#52628#44032#54616#44144#45208' '#49688#51221#54616#47140' '#54624#46412
    end
    object curriappend_Action: TAction
      Category = #50868#50689
      Caption = #44053#51032#46321#47197
      Hint = #44284#47785#50640' '#46384#47480' '#51068#51221#51012' '#52628#44032#54616#45716' '#54868#47732
      OnExecute = curriappend_ActionExecute
    end
    object Email_Action: TAction
      Category = #50868#50689
      Caption = #47700#51068#54869#51064
      Hint = #46308#50612#50728' '#47700#51068#51012' '#54869#51064#54633#45768#45796'.'
      OnExecute = Email_ActionExecute
    end
  end
  object ImageList1: TImageList
    Left = 632
    Top = 32
  end
  object Timer1: TTimer
    OnTimer = ddd
    Left = 672
    Top = 32
  end
end
