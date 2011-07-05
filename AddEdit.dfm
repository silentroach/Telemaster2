object Form11: TForm11
  Left = 241
  Top = 215
  BorderStyle = bsDialog
  Caption = '< '#1085#1072#1079#1074#1072#1085#1080#1077' '#1086#1082#1085#1072' >'
  ClientHeight = 79
  ClientWidth = 383
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton3: TSpeedButton
    Left = 144
    Top = 53
    Width = 117
    Height = 23
    AllowAllUp = True
    Caption = '< '#1082#1085#1086#1087#1082#1072' >'
    NumGlyphs = 4
    Spacing = 8
    Transparent = False
    OnClick = SpeedButton3Click
  end
  object SpeedButton1: TSpeedButton
    Left = 263
    Top = 53
    Width = 117
    Height = 23
    AllowAllUp = True
    Caption = #1086#1090#1084#1077#1085#1072
    NumGlyphs = 4
    Spacing = 8
    Transparent = False
    OnClick = SpeedButton1Click
  end
  object PageControl1: TPageControl
    Left = -12
    Top = -11
    Width = 444
    Height = 60
    ActivePage = TabSheet1
    MultiLine = True
    TabOrder = 0
    TabPosition = tpRight
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Label1: TLabel
        Left = 14
        Top = 23
        Width = 113
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '< '#1084#1077#1090#1082#1072' >'
      end
      object Edit1: TEdit
        Left = 134
        Top = 20
        Width = 225
        Height = 21
        TabOrder = 0
        OnKeyPress = Edit1KeyPress
      end
    end
  end
end
