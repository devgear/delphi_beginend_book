object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Modal '#54868#47732
  ClientHeight = 274
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DateTimePicker1: TDateTimePicker
    Left = 24
    Top = 24
    Width = 259
    Height = 21
    Date = 40549.483533645840000000
    Time = 40549.483533645840000000
    ImeName = 'Microsoft IME 2003'
    ParseInput = True
    TabOrder = 0
    OnUserInput = DateTimePicker1UserInput
  end
  object MonthCalendar1: TMonthCalendar
    Left = 8
    Top = 51
    Width = 275
    Height = 160
    Date = 40549.099059965280000000
    FirstDayOfWeek = dowMonday
    ImeName = 'Microsoft IME 2003'
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 232
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkOK
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 112
    Top = 232
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkCancel
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 3
  end
  object Button1: TButton
    Left = 208
    Top = 232
    Width = 75
    Height = 25
    Caption = #54869#51064
    ModalResult = 1
    TabOrder = 4
  end
end
