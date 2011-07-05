object Form35: TForm35
  Left = 696
  Top = 287
  BorderStyle = bsDialog
  Caption = #1059#1095#1077#1090#1085#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
  ClientHeight = 236
  ClientWidth = 529
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 361
    Top = 29
    Width = 163
    Height = 23
    AllowAllUp = True
    Caption = #1080#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    NumGlyphs = 4
    Spacing = 8
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 361
    Top = 64
    Width = 163
    Height = 23
    AllowAllUp = True
    Caption = #1091#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    NumGlyphs = 4
    Spacing = 8
    OnClick = SpeedButton2Click
  end
  object SpeedButton4: TSpeedButton
    Left = 361
    Top = 209
    Width = 163
    Height = 23
    AllowAllUp = True
    Caption = #1074#1099#1093#1086#1076
    NumGlyphs = 4
    Spacing = 8
    OnClick = SpeedButton4Click
  end
  object SpeedButton3: TSpeedButton
    Left = 361
    Top = 4
    Width = 163
    Height = 22
    Caption = #1076#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    OnClick = SpeedButton3Click
  end
  object PageControl1: TPageControl
    Left = -36
    Top = -7
    Width = 392
    Height = 252
    ActivePage = TabSheet1
    MultiLine = True
    TabOrder = 0
    TabPosition = tpLeft
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object ElTree1: TElTree
        Left = 16
        Top = 7
        Width = 345
        Height = 228
        BorderColorWindow = clWindow
        FocusedSelectColor = 16116704
        FocusedSelectTextColor = 6504231
        ForcedScrollBars = ssVertical
        FullRowSelect = False
        HeaderActiveFilterColor = clWhite
        HeaderHeight = 17
        HeaderHotTrack = False
        HeaderSections.Data = {
          F4FFFFFF020000000000000000000000FFFFFFFF0000010100000000C8000000
          0000000010270000000000001017D7060000000001010000FFFFFFFF00000100
          0000000000000000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000130000006C6F67696E20EFEE
          EBFCE7EEE2E0F2E5EBFF00010000000000000000000000000000000000000000
          FFFFFFFF00000101000000007A00000000000000102700000000000020978806
          0100000001010000FFFFFFFF0000010000000000000000000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000007000000EFE0F0EEEBFC0001000000000000000000000000}
        HeaderFilterColor = clWhite
        HeaderFlat = True
        HorzScrollBarStyles.ShowTrackHint = False
        HorzScrollBarStyles.Width = 17
        HorzScrollBarStyles.ButtonSize = 17
        LineHeight = 17
        LinesColor = clBtnShadow
        LinesStyle = psSolid
        MultiSelect = False
        ShowColumns = True
        ShowLeafButton = False
        ShowRoot = True
        SortMode = smAdd
        StoragePath = '\Tree'
        StripedOddColor = clWhite
        StripedEvenColor = clWhite
        StripedItems = True
        TabOrder = 0
        TabStop = True
        UseCustomScrollBars = False
        VertScrollBarStyles.ActiveFlat = True
        VertScrollBarStyles.ShowTrackHint = False
        VertScrollBarStyles.Width = 17
        VertScrollBarStyles.ButtonSize = 17
        TextColor = clBtnText
        BkColor = clWhite
        OnDblClick = ElTree1DblClick
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 395
    Top = 144
  end
  object ADOQuery1: TADOQuery
    Connection = MainForm.MainConnection
    Parameters = <>
    Left = 362
    Top = 144
  end
end
