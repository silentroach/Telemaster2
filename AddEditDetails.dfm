object Form15: TForm15
  Left = 400
  Top = 196
  BorderStyle = bsDialog
  Caption = '< '#1079#1072#1075#1086#1083#1086#1074#1086#1082' >'
  ClientHeight = 103
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
    Top = 77
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
    Top = 77
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
    Left = -9
    Top = -6
    Width = 430
    Height = 79
    ActivePage = TabSheet1
    MultiLine = True
    TabOrder = 0
    TabPosition = tpRight
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Label1: TLabel
        Left = 17
        Top = 18
        Width = 113
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1077#1090#1072#1083#1080
      end
      object Label2: TLabel
        Left = 17
        Top = 42
        Width = 113
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1062#1077#1085#1072' '#1076#1077#1090#1072#1083#1080
      end
      object Edit2: TEdit
        Left = 137
        Top = 39
        Width = 121
        Height = 21
        TabOrder = 1
        OnKeyPress = Edit2KeyPress
      end
      object Edit1: TEdit
        Left = 137
        Top = 15
        Width = 225
        Height = 21
        TabOrder = 0
        OnKeyPress = Edit1KeyPress
      end
    end
  end
end
