object Form12: TForm12
  Left = 244
  Top = 244
  BorderStyle = bsDialog
  Caption = #1058#1080#1087#1099' '#1091#1089#1090#1088#1086#1081#1089#1090#1074
  ClientHeight = 350
  ClientWidth = 677
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
  object SpeedButton4: TSpeedButton
    Left = 522
    Top = 94
    Width = 149
    Height = 23
    AllowAllUp = True
    Caption = #1091#1076#1072#1083#1080#1090#1100
    NumGlyphs = 4
    Spacing = 8
    Transparent = False
    OnClick = SpeedButton4Click
  end
  object SpeedButton2: TSpeedButton
    Left = 522
    Top = 62
    Width = 149
    Height = 23
    AllowAllUp = True
    Caption = #1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1094#1077#1085#1091
    NumGlyphs = 4
    Spacing = 8
    Transparent = False
    OnClick = SpeedButton2Click
  end
  object SpeedButton5: TSpeedButton
    Left = 522
    Top = 30
    Width = 149
    Height = 23
    AllowAllUp = True
    Caption = #1080#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1077
    NumGlyphs = 4
    Spacing = 8
    Transparent = False
    OnClick = SpeedButton5Click
  end
  object SpeedButton3: TSpeedButton
    Left = 522
    Top = 6
    Width = 149
    Height = 23
    AllowAllUp = True
    Caption = #1076#1086#1073#1072#1074#1080#1090#1100' '#1090#1080#1087'...'
    NumGlyphs = 4
    Spacing = 8
    Transparent = False
    OnClick = SpeedButton3Click
  end
  object SpeedButton7: TSpeedButton
    Left = 522
    Top = 322
    Width = 149
    Height = 23
    AllowAllUp = True
    Caption = #1074#1099#1093#1086#1076
    NumGlyphs = 4
    Spacing = 8
    Transparent = False
    OnClick = SpeedButton7Click
  end
  object SpeedButton1: TSpeedButton
    Left = 522
    Top = 298
    Width = 149
    Height = 23
    Caption = #1101#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
    Transparent = False
    OnClick = SpeedButton1Click
  end
  object PageControl1: TPageControl
    Left = -35
    Top = -10
    Width = 552
    Height = 381
    ActivePage = TabSheet1
    MultiLine = True
    TabOrder = 0
    TabPosition = tpLeft
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object ElTree1: TElTree
        Left = 17
        Top = 12
        Width = 501
        Height = 339
        BorderColorWindow = clWindow
        FocusedSelectColor = 16116704
        FocusedSelectTextColor = 6504231
        ForcedScrollBars = ssVertical
        FullRowSelect = False
        HeaderActiveFilterColor = clWhite
        HeaderHeight = 17
        HeaderHotTrack = False
        HeaderSections.Data = {
          F4FFFFFF010000000000000000000000FFFFFFFF0000010100000000FA000000
          0000000010270000000000001017D7060000000001010000FFFFFFFF00000100
          0000000000000000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000020000002000010000000000
          00000000000000}
        HeaderFilterColor = clWhite
        HeaderFlat = True
        HorzScrollBarStyles.ShowTrackHint = False
        HorzScrollBarStyles.Width = 17
        HorzScrollBarStyles.ButtonSize = 17
        KeepSelectionWithinLevel = True
        LineHeight = 17
        LinesColor = clBtnShadow
        LinesStyle = psSolid
        MultiSelect = False
        ShowColumns = True
        ShowLeafButton = False
        ShowLines = False
        ShowRootButtons = False
        SortMode = smAdd
        StoragePath = '\Tree'
        StripedOddColor = clWhite
        StripedEvenColor = clWhite
        StripedItems = True
        TabOrder = 0
        TabStop = True
        UseCustomScrollBars = False
        VerticalLines = True
        VertScrollBarStyles.ActiveFlat = True
        VertScrollBarStyles.ShowTrackHint = False
        VertScrollBarStyles.Width = 17
        VertScrollBarStyles.ButtonSize = 17
        TextColor = clBtnText
        BkColor = clWhite
        OnHeaderColumnClick = ElTree1HeaderColumnClick
        OnDblClick = ElTree1DblClick
      end
    end
  end
  object TypesTable: TADOTable
    Connection = MainForm.MainConnection
    TableName = 'Types'
    Left = 356
    Top = 44
  end
  object DataSource1: TDataSource
    DataSet = TypesTable
    Left = 384
    Top = 44
  end
  object ADOTable1: TADOTable
    Connection = MainForm.MainConnection
    TableName = 'Categories'
    Left = 356
    Top = 76
  end
  object DataSource2: TDataSource
    DataSet = ADOTable1
    Left = 384
    Top = 76
  end
  object ElTreeInplaceEdit1: TElTreeInplaceEdit
    Tree = ElTree1
    Types = [sftText]
    OnValidateResult = ElTreeInplaceEdit1ValidateResult
    Left = 261
    Top = 29
  end
  object PricePopup: TPopupMenu
    OwnerDraw = True
    Left = 630
    Top = 76
  end
  object PopupMenu1: TPopupMenu
    Left = 643
    Top = 270
    object N1: TMenuItem
      Caption = #1074' '#1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083'...'
      OnClick = N1Click
    end
    object MicrosoftExcel1: TMenuItem
      Caption = #1074' Microsoft Excel'
      OnClick = MicrosoftExcel1Click
    end
  end
end
