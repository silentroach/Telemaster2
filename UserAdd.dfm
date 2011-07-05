object AddMasterForm: TAddMasterForm
  Left = 359
  Top = 155
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1084#1072#1089#1090#1077#1088#1072
  ClientHeight = 342
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RThemedPanel1: TRThemedPanel
    Left = 0
    Top = 0
    Width = 437
    Height = 305
    Align = alTop
    Caption = 'RThemedPanel1'
    TabOrder = 0
    object Bevel1: TBevel
      Left = -2
      Top = 158
      Width = 435
      Height = 9
      Shape = bsTopLine
    end
    object lPercent: TLabel
      Left = 13
      Top = 278
      Width = 419
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '0 %'
      Transparent = True
    end
    object lFName: TLabel
      Left = 18
      Top = 61
      Width = 82
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      Transparent = True
    end
    object lName: TLabel
      Left = 18
      Top = 37
      Width = 82
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1048#1084#1103
      Transparent = True
    end
    object lSurname: TLabel
      Left = 18
      Top = 13
      Width = 82
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1060#1072#1084#1080#1083#1080#1103
      Transparent = True
    end
    object lPhone: TLabel
      Left = 18
      Top = 125
      Width = 82
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1058#1077#1083#1077#1092#1086#1085
      Transparent = True
    end
    object lAddress: TLabel
      Left = 18
      Top = 101
      Width = 82
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1040#1076#1088#1077#1089
      Transparent = True
    end
    object Label12: TLabel
      Left = 336
      Top = 180
      Width = 22
      Height = 13
      Caption = #1088#1091#1073'.'
      Transparent = True
    end
    object lPayment: TLabel
      Left = 18
      Top = 180
      Width = 82
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1047#1072#1088#1087#1083#1072#1090#1072
      Transparent = True
    end
    object lPPrice: TLabel
      Left = 127
      Top = 180
      Width = 106
      Height = 13
      AutoSize = False
      Caption = #1089#1090#1072#1074#1082#1072
      Transparent = True
      OnClick = lPPriceClick
    end
    object lPPercent: TLabel
      Left = 127
      Top = 203
      Width = 188
      Height = 13
      AutoSize = False
      Caption = #1087#1088#1086#1094#1077#1085#1090' '#1089' '#1087#1088#1080#1073#1099#1083#1080' '#1084#1072#1089#1090#1077#1088#1072
      Transparent = True
      OnClick = lPPercentClick
    end
    object lPOrganization: TLabel
      Left = 127
      Top = 225
      Width = 180
      Height = 13
      AutoSize = False
      Caption = #1087#1088#1086#1094#1077#1085#1090' '#1089' '#1087#1088#1080#1073#1099#1083#1080' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      Transparent = True
      OnClick = lPOrganizationClick
    end
    object eSurname: TEdit
      Left = 106
      Top = 10
      Width = 153
      Height = 21
      TabOrder = 0
    end
    object eName: TEdit
      Left = 106
      Top = 34
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object eFather: TEdit
      Left = 106
      Top = 58
      Width = 169
      Height = 21
      TabOrder = 2
    end
    object eAddress: TEdit
      Left = 106
      Top = 98
      Width = 321
      Height = 21
      TabOrder = 3
    end
    object ePhone: TEdit
      Left = 106
      Top = 122
      Width = 153
      Height = 21
      TabOrder = 4
    end
    object ePayment: TEdit
      Left = 242
      Top = 177
      Width = 89
      Height = 21
      TabOrder = 5
    end
    object rbPOrganization: TRadioButton
      Left = 106
      Top = 225
      Width = 13
      Height = 16
      TabOrder = 6
      OnClick = rbPOrganizationClick
    end
    object rbPPercent: TRadioButton
      Left = 106
      Top = 203
      Width = 13
      Height = 16
      TabOrder = 7
      OnClick = rbPPercentClick
    end
    object rbPPrice: TRadioButton
      Left = 106
      Top = 181
      Width = 13
      Height = 16
      Checked = True
      TabOrder = 8
      TabStop = True
      OnClick = rbPPriceClick
    end
    object tbPercent: TTrackBar
      Left = 13
      Top = 251
      Width = 419
      Height = 26
      Enabled = False
      Max = 100
      TabOrder = 9
      ThumbLength = 14
      OnChange = tbPercentChange
    end
  end
  object rbAdd: TRButton
    Left = 216
    Top = 312
    Width = 105
    Height = 25
    Caption = #1076#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = rbAddClick
  end
  object rbCancel: TRButton
    Left = 328
    Top = 312
    Width = 105
    Height = 25
    Caption = #1086#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = rbCancelClick
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 36
    Top = 314
  end
  object ADOTable1: TADOTable
    TableName = 'Users'
    Left = 8
    Top = 314
  end
end
