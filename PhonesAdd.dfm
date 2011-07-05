object Form17: TForm17
  Left = 273
  Top = 143
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1072#1073#1086#1085#1077#1085#1090#1072' '#1074' '#1079#1072#1087#1080#1089#1085#1091#1102' '#1082#1085#1080#1078#1082#1091
  ClientHeight = 249
  ClientWidth = 316
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 81
    Top = 224
    Width = 115
    Height = 22
    Caption = #1076#1086#1073#1072#1074#1080#1090#1100
    Layout = blGlyphBottom
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 198
    Top = 224
    Width = 115
    Height = 22
    Caption = #1074#1099#1093#1086#1076
    Layout = blGlyphBottom
    OnClick = SpeedButton2Click
  end
  object PageControl1: TPageControl
    Left = -3
    Top = -10
    Width = 453
    Height = 230
    ActivePage = TabSheet1
    MultiLine = True
    TabOrder = 0
    TabPosition = tpRight
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Label8: TLabel
        Left = 16
        Top = 23
        Width = 72
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1047#1072#1082#1083#1072#1076#1082#1072
        Transparent = True
      end
      object Label1: TLabel
        Left = 16
        Top = 47
        Width = 72
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1040#1073#1086#1085#1077#1085#1090
        Transparent = True
      end
      object Label2: TLabel
        Left = 16
        Top = 71
        Width = 72
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1040#1076#1088#1077#1089
        Transparent = True
      end
      object Label3: TLabel
        Left = 16
        Top = 95
        Width = 72
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1058#1077#1083#1077#1092#1086#1085' 1'
        Transparent = True
      end
      object Label4: TLabel
        Left = 16
        Top = 119
        Width = 72
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1058#1077#1083#1077#1092#1086#1085' 2'
        Transparent = True
      end
      object Label5: TLabel
        Left = 16
        Top = 143
        Width = 72
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'E-Mail'
        Transparent = True
      end
      object Label6: TLabel
        Left = 16
        Top = 167
        Width = 72
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1057#1072#1081#1090
        Transparent = True
      end
      object Label7: TLabel
        Left = 16
        Top = 191
        Width = 72
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Transparent = True
      end
      object Edit7: TEdit
        Left = 96
        Top = 188
        Width = 209
        Height = 21
        TabOrder = 7
      end
      object Edit6: TEdit
        Left = 96
        Top = 164
        Width = 177
        Height = 21
        TabOrder = 6
      end
      object Edit5: TEdit
        Left = 96
        Top = 140
        Width = 153
        Height = 21
        TabOrder = 5
      end
      object Edit4: TEdit
        Left = 96
        Top = 116
        Width = 89
        Height = 21
        TabOrder = 4
      end
      object Edit3: TEdit
        Left = 96
        Top = 92
        Width = 89
        Height = 21
        TabOrder = 3
      end
      object Edit2: TEdit
        Left = 96
        Top = 68
        Width = 209
        Height = 21
        TabOrder = 2
      end
      object Edit1: TEdit
        Left = 96
        Top = 44
        Width = 145
        Height = 21
        TabOrder = 1
      end
      object ComboBox1: TComboBox
        Left = 96
        Top = 20
        Width = 161
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  object ADOTable1: TADOTable
    Connection = Form1.ADOConnection1
    TableName = 'Phones'
    Left = 4
    Top = 220
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 32
    Top = 220
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 252
    Top = 28
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 284
    Top = 28
  end
end
