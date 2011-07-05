object Form28: TForm28
  Left = 561
  Top = 520
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093' '#1082#1083#1080#1077#1085#1090#1072
  ClientHeight = 201
  ClientWidth = 469
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 231
    Top = 176
    Width = 116
    Height = 23
    AllowAllUp = True
    Caption = #1089#1086#1093#1088#1072#1085#1080#1090#1100
    NumGlyphs = 4
    Spacing = 8
    Transparent = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton3: TSpeedButton
    Left = 349
    Top = 176
    Width = 116
    Height = 23
    AllowAllUp = True
    Caption = #1086#1090#1084#1077#1085#1072
    NumGlyphs = 4
    Spacing = 8
    Transparent = False
    OnClick = SpeedButton3Click
  end
  object PageControl1: TPageControl
    Left = -5
    Top = -9
    Width = 503
    Height = 182
    ActivePage = TabSheet1
    MultiLine = True
    TabOrder = 0
    TabPosition = tpRight
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Label5: TLabel
        Left = 17
        Top = 117
        Width = 90
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1058#1080#1087' '#1082#1083#1080#1077#1085#1090#1072
        Transparent = True
      end
      object Label3: TLabel
        Left = 17
        Top = 79
        Width = 90
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1044#1086#1084'.'#1090#1077#1083#1077#1092#1086#1085
        Transparent = True
      end
      object Label2: TLabel
        Left = 17
        Top = 55
        Width = 90
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1040#1076#1088#1077#1089
        Transparent = True
      end
      object Label1: TLabel
        Left = 17
        Top = 23
        Width = 90
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1060'.'#1048'.'#1054'. '#1082#1083#1080#1077#1085#1090#1072
        Transparent = True
      end
      object Label4: TLabel
        Left = 257
        Top = 79
        Width = 66
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1056#1072#1073'.'#1090#1077#1083#1077#1092#1086#1085
        Transparent = True
      end
      object RadioButton1: TRadioButton
        Left = 113
        Top = 116
        Width = 113
        Height = 17
        Caption = #1087#1088#1086#1089#1090#1086#1081' '#1082#1083#1080#1077#1085#1090
        TabOrder = 4
      end
      object RadioButton2: TRadioButton
        Left = 113
        Top = 132
        Width = 113
        Height = 17
        Caption = #1074' '#1073#1077#1083#1086#1084' '#1089#1087#1080#1089#1082#1077
        TabOrder = 5
      end
      object RadioButton3: TRadioButton
        Left = 113
        Top = 148
        Width = 113
        Height = 17
        Caption = #1074' '#1095#1077#1088#1085#1086#1084' '#1089#1087#1080#1089#1082#1077
        TabOrder = 6
      end
      object Edit3: TEdit
        Left = 113
        Top = 76
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 113
        Top = 52
        Width = 337
        Height = 21
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 113
        Top = 20
        Width = 193
        Height = 21
        TabOrder = 0
      end
      object Edit4: TEdit
        Left = 329
        Top = 76
        Width = 121
        Height = 21
        TabOrder = 3
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 32
    Top = 172
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 4
    Top = 172
  end
end
