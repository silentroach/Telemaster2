object Form10: TForm10
  Left = 248
  Top = 183
  BorderStyle = bsDialog
  Caption = #1060#1080#1088#1084#1099'-'#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1080' '#1091#1089#1090#1088#1086#1081#1089#1090#1074
  ClientHeight = 331
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton7: TSpeedButton
    Left = 364
    Top = 305
    Width = 184
    Height = 23
    AllowAllUp = True
    Caption = #1074#1099#1093#1086#1076
    NumGlyphs = 4
    Spacing = 8
    Transparent = False
    OnClick = SpeedButton7Click
  end
  object SpeedButton2: TSpeedButton
    Left = 364
    Top = 116
    Width = 184
    Height = 23
    AllowAllUp = True
    Caption = #1091#1076#1072#1083#1080#1090#1100
    NumGlyphs = 4
    Spacing = 8
    Transparent = False
    OnClick = N4Click
  end
  object SpeedButton4: TSpeedButton
    Left = 364
    Top = 84
    Width = 184
    Height = 23
    AllowAllUp = True
    Caption = #1080#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1088#1084#1099
    NumGlyphs = 4
    Spacing = 8
    Transparent = False
    OnClick = N9Click
  end
  object SpeedButton1: TSpeedButton
    Left = 364
    Top = 60
    Width = 184
    Height = 23
    AllowAllUp = True
    Caption = #1080#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
    NumGlyphs = 4
    Spacing = 8
    Transparent = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton3: TSpeedButton
    Left = 364
    Top = 28
    Width = 184
    Height = 23
    AllowAllUp = True
    Caption = #1076#1086#1073#1072#1074#1080#1090#1100' '#1092#1080#1088#1084#1091'...'
    NumGlyphs = 4
    Spacing = 8
    Transparent = False
    OnClick = N2Click
  end
  object SpeedButton6: TSpeedButton
    Left = 364
    Top = 4
    Width = 184
    Height = 23
    AllowAllUp = True
    Caption = #1076#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102'...'
    NumGlyphs = 4
    Spacing = 8
    Transparent = False
    OnClick = N1Click
  end
  object SpeedButton5: TSpeedButton
    Left = 364
    Top = 280
    Width = 184
    Height = 23
    Caption = #1101#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
    Transparent = False
    OnClick = SpeedButton5Click
  end
  object PageControl1: TPageControl
    Left = -36
    Top = -7
    Width = 397
    Height = 365
    ActivePage = TabSheet1
    MultiLine = True
    TabOrder = 0
    TabPosition = tpLeft
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Label1: TLabel
        Left = 18
        Top = 310
        Width = 77
        Height = 13
        Caption = #1041#1099#1089#1090#1088#1099#1081' '#1087#1086#1080#1089#1082
      end
      object Edit1: TEdit
        Left = 102
        Top = 308
        Width = 261
        Height = 21
        TabOrder = 0
        OnChange = Edit1Change
        OnExit = Edit1Exit
      end
      object ElTree1: TElTree
        Left = 18
        Top = 8
        Width = 345
        Height = 296
        BorderColorWindow = clWindow
        FocusedSelectColor = 16116704
        FocusedSelectTextColor = 6504231
        ForcedScrollBars = ssVertical
        FullRowSelect = False
        HeaderActiveFilterColor = clWhite
        HeaderHeight = 17
        HeaderHotTrack = False
        HeaderSections.Data = {
          F4FFFFFF020000000000000000000000FFFFFFFF0000010100000000FA000000
          0000000010270000000000001017D7060000000001010000FFFFFFFF00000100
          0000000000000000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000012000000CAE0F2E5E3EEF0E8
          E820E820F4E8F0ECFB00010000000000000000000000000000000000000000FF
          FFFFFF000001010100000049000000000000001027000000010000B4AF300501
          00000002000000FFFFFFFF000001000000000000000000000100000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000007000000CAEEEB2DE2EE0001000000000000000000000000}
        HeaderFilterColor = clWhite
        HeaderFlat = True
        HorzScrollBarStyles.ShowTrackHint = False
        HorzScrollBarStyles.Width = 17
        HorzScrollBarStyles.ButtonSize = 17
        LineHeight = 17
        LinesColor = clBtnShadow
        LinesStyle = psSolid
        MultiSelect = False
        PopupMenu = FirmsPopup
        ShowColumns = True
        ShowLeafButton = False
        ShowRoot = True
        SortMode = smAdd
        StoragePath = '\Tree'
        StripedOddColor = clWhite
        StripedEvenColor = clWhite
        StripedItems = True
        TabOrder = 1
        TabStop = True
        UseCustomScrollBars = False
        VertScrollBarStyles.ActiveFlat = True
        VertScrollBarStyles.ShowTrackHint = False
        VertScrollBarStyles.Width = 17
        VertScrollBarStyles.ButtonSize = 17
        TextColor = clBtnText
        BkColor = clWhite
        OnItemExpand = ElTree1ItemExpand
        OnItemSelectedChange = ElTree1ItemSelectedChange
        OnDblClick = N9Click
      end
    end
  end
  object CategoryTable: TADOTable
    Connection = MainForm.MainConnection
    TableName = 'Categories'
    Left = 28
    Top = 100
  end
  object FirmsQuery: TADOQuery
    Connection = MainForm.MainConnection
    Parameters = <>
    Left = 28
    Top = 132
  end
  object DataSource1: TDataSource
    DataSet = CategoryTable
    Left = 60
    Top = 100
  end
  object DataSource2: TDataSource
    DataSet = FirmsQuery
    Left = 60
    Top = 132
  end
  object FirmsPopup: TPopupMenu
    OwnerDraw = True
    Left = 28
    Top = 172
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102'...'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1080#1088#1084#1091'...'
      OnClick = N2Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1092#1080#1088#1084#1091' '#1074' '#1076#1088#1091#1075#1091#1102' '#1082#1072#1090#1077#1075#1086#1088#1080#1102
      object TMenuItem
      end
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102
      OnClick = SpeedButton1Click
    end
    object N9: TMenuItem
      Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100' '#1092#1080#1088#1084#1091
      OnClick = N9Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1102
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1080#1088#1084#1091
      OnClick = N4Click
    end
  end
  object ElTreeInplaceEdit1: TElTreeInplaceEdit
    Tree = ElTree1
    Types = [sftText]
    OnValidateResult = ElTreeInplaceEdit1ValidateResult
    Left = 252
    Top = 108
  end
  object PopupMenu1: TPopupMenu
    Left = 520
    Top = 248
    object N11: TMenuItem
      Caption = #1101#1082#1089#1087#1086#1088#1090' '#1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083'...'
      OnClick = N11Click
    end
    object MicrosoftExcel1: TMenuItem
      Caption = #1101#1082#1089#1087#1086#1088#1090' '#1074' Microsoft Excel'
      OnClick = MicrosoftExcel1Click
    end
  end
end
