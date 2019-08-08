object Form1: TForm1
  Left = 192
  Top = 153
  Width = 458
  Height = 146
  Caption = 'TImpProcessExec '#45936#47784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 55
    Top = 19
    Width = 337
    Height = 21
    ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
    TabOrder = 0
    Text = 'c:\winnt\notepad.exe'
  end
  object Button1: TButton
    Left = 143
    Top = 59
    Width = 146
    Height = 25
    Caption = #49892#54665#49884#53020' '#51452#49464#50836'!'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ImpProcessExec1: TImpProcessExec
    CommandLine = 'c:\winnt\notepad.exe'
    OnProcessTerminate = ImpProcessExec1ProcessTerminate
    Left = 47
    Top = 43
  end
end
