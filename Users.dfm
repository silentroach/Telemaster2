object Form2: TForm2
  Left = 255
  Top = 251
  BorderStyle = bsDialog
  Caption = #1052#1072#1089#1090#1077#1088#1072
  ClientHeight = 236
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton6: TSpeedButton
    Left = 421
    Top = 4
    Width = 129
    Height = 23
    AllowAllUp = True
    Caption = #1076#1086#1073#1072#1074#1080#1090#1100' '#1084#1072#1089#1090#1077#1088#1072
    NumGlyphs = 4
    Spacing = 8
    OnClick = SpeedButton6Click
  end
  object SpeedButton1: TSpeedButton
    Left = 421
    Top = 29
    Width = 129
    Height = 23
    AllowAllUp = True
    Caption = #1080#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    NumGlyphs = 4
    Spacing = 8
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 421
    Top = 64
    Width = 129
    Height = 23
    AllowAllUp = True
    Caption = #1091#1076#1072#1083#1080#1090#1100' '#1084#1072#1089#1090#1077#1088#1072
    NumGlyphs = 4
    Spacing = 8
    OnClick = SpeedButton2Click
  end
  object SpeedButton4: TSpeedButton
    Left = 421
    Top = 209
    Width = 129
    Height = 23
    AllowAllUp = True
    Caption = #1074#1099#1093#1086#1076
    NumGlyphs = 4
    Spacing = 8
    OnClick = SpeedButton4Click
  end
  object PageControl1: TPageControl
    Left = -36
    Top = -7
    Width = 454
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
        Width = 406
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
          F4FFFFFF020000000000000000000000FFFFFFFF00000101000000002C010000
          0000000010270000000000001017D7060000000001010000FFFFFFFF00000100
          0000000000000000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000F000000D42EC82ECE2E20EC
          E0F1F2E5F0E000010000000000000000000000000000000000000000FFFFFFFF
          0000010100000000550000000000000010270000000001002097880601000000
          01010000FFFFFFFF000001000000000000000000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          08000000D2E5EBE5F4EEED0001000000000000000000000000}
        HeaderFilterColor = clWhite
        HeaderFlat = True
        HorzScrollBarStyles.ShowTrackHint = False
        HorzScrollBarStyles.Width = 17
        HorzScrollBarStyles.ButtonSize = 17
        Images = ImageList1
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
        OnAfterSelectionChange = ElTree1AfterSelectionChange
        OnDblClick = ElTree1DblClick
      end
    end
  end
  object ImageList1: TImageList
    Left = 418
    Top = 100
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00FCFCFC00F7F7F700F7F7F700F8F8F800FCFC
      FC00FEFEFE0000000000000000000000000000000000F9F9F900747474004646
      4600A0A0A000F6F6F6000000000000000000000000000000000000000000E3E3
      E300B2B2B200EFEFEF00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FCFCFC00FDFDFD00CDCDCD008D605300A1564200AA5A45009C5441008753
      440094807A00EBEBEB00FEFEFE000000000000000000B5B5B500B86A4C007B47
      3300361F160017171700BBBBBB00FEFEFE000000000000000000E1E1E1000B0B
      0B0047291D000F0F0F00DADADA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00B1A0
      9A0085524200998D8B00BE715900D18E7900D99B8700DB9E8A00D99A8600D390
      7A00C3776000A0493200F8F7F70000000000FEFEFE0097979700E8AB9400DE87
      6600A15C430058322400321D1500B3B3B300FEFEFE00CFCFCF0015151500B467
      4B008B50390045281D009D9D9D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE009F54
      4000C1776000D0897200DA9A8400E2A99400E5AE9900E6AF9B00E5AE9A00E3AB
      9600DA9C8600C0735D0098908D00FAFAFA00FEFEFE00CACACA00EFCCBF00ECBA
      A800E3997E00C4705100744230000B0B0B005252520007070700C06E4F00D57A
      5800B3664A0074423000E5E5E500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF00E8E8E800998A8700A56B
      5700D28C7300DB977E00DC9A8100DD9D8400DE9D8500DE9D8500DE9E8600DD9D
      8500DA988000CC836900A9533B00995A350000000000FEFEFE00F3F3F300A4A4
      A400EEC1B100E59E8400CC755400A35D4300A15D4300BA6B4D00D2785700CE76
      5500A86046004E4E4E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008F341E0095452E00B45E4300C574
      5600CF816500D2866900D2866A00D3866A00D2866A00D3876A00D3866A00D387
      6A00D2866900C7795E00A8523B00D8C9C2000000000000000000000000000000
      0000ACACAC00ECBBA800E2937500D77B5900D3795700D67B5900CC755500A760
      4500030303000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000973E2600B35A3D00C0694A00C66F
      4F00C8725100C8725200C8725100C7725200C7735200C8725200C8725300C772
      5100C36D4E00B25C410088371D00FEFEFE000000000000000000000000000000
      0000FDFDFD00D7B7AB00E6A38B00DD836100DC7E5B00D97C5A00BF6D4F000909
      0900FCFCFC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000873D2800A74F3200B85F3E00BD63
      4100BE644200BF644200BE644100BD634100BE644100BE644200BD634100B65C
      3C00A84E31008F372000F8F8F700000000000000000000000000000000000000
      0000FEFEFE0092929200E9AD9700DF886700DC7E5B00D97C5A00010101000F0F
      0F002222220092929200FCFCFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE008C331C00A44B2D00B157
      3500B55A3900B1573600AC513200AB523300B1573700B55B3A00B1563600A046
      2A0079433300FEFEFE0000000000000000000000000000000000000000000000
      000000000000A6A6A600EBB7A300E1927400DC7F5C00DC7F5C00D57A5800B367
      4A00663A2A00321D1500D9D9D900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE009A635200A249
      2C00AA503000A0482A008C452E00E1E1E100A54C2E00AF543400A64D2E009D9D
      9900FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000E5E5E500EFC5B500E7A68E00DE856300DD815E00DF8B6B00E191
      7300CC7555006A3C2C00F7F7F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00E5E5E500963F
      2400A0472900764E4000F9F9F9008A3D2600A1482A00A9503000A2492B008933
      1B00EAEAE9000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00CEBCB500EEC0AF00E2957900D2795700262626002424
      2400955B450074747400FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00732F1E00963F
      22009C4426008F391F00DFDFDF008F391F009E462800A74E2C00A2492A008E38
      1F00692E1D000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FBFBFB00CBB6AE00E5A68E0003030300C7C7C700FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE0076241000B983
      7100BB847000B0776500E7E6E6008C361C00A95E4500B2674B00AE654A009648
      3000601F0C000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FAFAFA0064646400C37050005B3426003333
      3300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B1928A00C6A1
      9700EEE3E0008E524200FEFEFE0079271200E3CEC800E7D2CB00E8D7D000C097
      8C00856E66000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D1D1D100EAB29D00DE8563006B3D2C002918
      1100FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F6F2
      F100D7CCC9000000000000000000FEFDFD0073230E007D2B13007A2812005029
      1600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ECECEC00EFC4B400E8AB9400B4674B004729
      1E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCFCFC00D3BFB800EDBDAB00DE8564003A3A
      3A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FC0783E100000000E00180C100000000
      C001000100000000C00000010000000000008003000000000000F00700000000
      0000F007000000000001F001000000000003F801000000008007F80100000000
      8007F801000000008007F80F000000008007FC0F00000000C007FE0700000000
      E60FFE0F00000000FFFFFE0F0000000000000000000000000000000000000000
      000000000000}
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 447
    Top = 144
  end
  object ADOQuery1: TADOQuery
    Connection = MainForm.MainConnection
    Parameters = <>
    Left = 414
    Top = 144
  end
end
