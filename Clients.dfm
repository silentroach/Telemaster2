object Form27: TForm27
  Left = 288
  Top = 235
  BorderStyle = bsDialog
  Caption = #1050#1083#1080#1077#1085#1090#1099
  ClientHeight = 324
  ClientWidth = 529
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = -30
    Top = -5
    Width = 447
    Height = 352
    ActivePage = TabSheet1
    MultiLine = True
    TabOrder = 0
    TabPosition = tpLeft
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Edit1: TEdit
        Left = 10
        Top = 300
        Width = 160
        Height = 21
        TabOrder = 0
        OnChange = Edit1Change
      end
      object VolgaDBGrid1: TVolgaDBGrid
        Left = 10
        Top = 5
        Width = 405
        Height = 291
        AllowDelete = False
        AllowInsert = False
        DataSource = DataSource1
        HighlightColor = 14799556
        HighlightTextColor = clBlack
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawCellAttr = VolgaDBGrid1DrawCellAttr
        OnDblClick = VolgaDBGrid1DblClick
        OnTitleClick = VolgaDBGrid1TitleClick
        Columns = <
          item
            CanClick = True
            FieldName = 'Name'
            Title.Caption = #1060'.'#1048'.'#1054'. '#1082#1083#1080#1077#1085#1090#1072
            Visible = True
            Width = 157
          end
          item
            CanClick = True
            FieldName = 'Address'
            Title.Caption = #1040#1076#1088#1077#1089
            Visible = True
            Width = 226
          end>
      end
      object ScrollBar1: TScrollBar
        Left = 399
        Top = 7
        Width = 15
        Height = 287
        Kind = sbVertical
        PageSize = 0
        TabOrder = 2
        OnChange = ScrollBar1Change
      end
    end
  end
  object PageControl2: TPageControl
    Left = 416
    Top = -6
    Width = 153
    Height = 349
    ActivePage = TabSheet2
    MultiLine = True
    TabOrder = 1
    TabPosition = tpRight
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      object SpeedButton1: TSpeedButton
        Left = 3
        Top = 6
        Width = 32
        Height = 25
        GroupIndex = 1
        Glyph.Data = {
          96070000424DF60A000000000000F60600002800000010000000100000000100
          20000000000000040000120B0000120B0000D8000000D8000000000000000000
          330000006600000099000000CC000000FF000033000000333300003366000033
          99000033CC000033FF00006600000066330000666600006699000066CC000066
          FF00009900000099330000996600009999000099CC000099FF0000CC000000CC
          330000CC660000CC990000CCCC0000CCFF0000FF000000FF330000FF660000FF
          990000FFCC0000FFFF00330000003300330033006600330099003300CC003300
          FF00333300003333330033336600333399003333CC003333FF00336600003366
          330033666600336699003366CC003366FF003399000033993300339966003399
          99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
          FF0033FF000033FF330033FF660033FF990033FFCC0033FFFF00660000006600
          330066006600660099006600CC006600FF006633000066333300663366006633
          99006633CC006633FF00666600006666330066666600666699006666CC006666
          FF00669900006699330066996600669999006699CC006699FF0066CC000066CC
          330066CC660066CC990066CCCC0066CCFF0066FF000066FF330066FF660066FF
          990066FFCC0066FFFF00990000009900330099006600990099009900CC009900
          FF00993300009933330099336600993399009933CC009933FF00996600009966
          330099666600996699009966CC009966FF009999000099993300999966009999
          99009999CC009999FF0099CC000099CC330099CC660099CC990099CCCC0099CC
          FF0099FF000099FF330099FF660099FF990099FFCC0099FFFF00CC000000CC00
          3300CC006600CC009900CC00CC00CC00FF00CC330000CC333300CC336600CC33
          9900CC33CC00CC33FF00CC660000CC663300CC666600CC669900CC66CC00CC66
          FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
          3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF3300CCFF6600CCFF
          9900CCFFCC00CCFFFF00FF000000FF003300FF006600FF009900FF00CC00FF00
          FF00FF330000FF333300FF336600FF339900FF33CC00FF33FF00FF660000FF66
          3300FF666600FF669900FF66CC00FF66FF00FF990000FF993300FF996600FF99
          9900FF99CC00FF99FF00FFCC0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCC
          FF00FFFF0000FFFF3300FFFF6600FFFF9900FFFFCC00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00F2F2F20FCBCAC93FA3A2A16F7F7B77BF807D78BF827E
          79BF84807ABF85817CBFBCB8B37FBDB9B47FC8C6C44FE5E5E41FFFFFFF00FFFF
          FF00FFFFFF00FFFFFF00CBCAC93F7B756CFF948C82FFA2998EFFA99F93FFAFA4
          98FFB6AA9DFFBCAFA2FFC3B5A7FFC9BAACFFCFC0B1FFC0BCB77FFFFFFF00FFFF
          FF00FFFFFF00FFFFFF00D8D8D72F7B756CFF9B9389FFA2998EFFA99F93FFAFA4
          98FFB6AA9DFFBCAFA2FFC3B5A7FFC9BAACFFCFC0B1FFABA8A57FFFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF0095918BBF9B9389FFA2998EFFA99F93FFAFA4
          98FFB6AA9DFFBCAFA2FFC3B5A7FFC9BAACFFBAAD9FFFCBCAC93FFFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00CBC9C74F8D867CFFA2998EFFA1978CFF8E85
          7BFF938A7FFFA1968AFFC3B5A7FFC9BAACFF948E88BFFFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2D1CF3F7A756FDF46433EFF5755
          51FF595754FF504E4AFF655E57FFB3ACA5AFF2F2F20FFFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AFADAA8FC3C0BCFFD6D4
          D0FFE0DEDBFFE9E7E5FF9C9B99EFF2F2F20FFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094918CFFCDCAC6FFD6D4
          D0FFE0DEDBFFE9E7E5FFE5E4E3FFCBCAC93FFFFFFF00FFFFFF00E3E3E32FBDBD
          BD6FA4A3A1BFAAA7A4BF9D968EFF968F88EFB8B7B65FC4C0BBFFCDCAC6FFD6D4
          D0FFE0DEDBFFE9E7E5FFF2F1F0FFBDBCBB7FFFFFFF00FFFFFF00A7A6A5EFDEDA
          D6FFE8E0D7FFDFD4C8FFD6C9BAFFB4A89AFFA5A4A37FC4C0BBFFCDCAC6FFD6D4
          D0FFE0DEDBFFE9E7E5FFF2F1F0FFA2A1A09FFFFFFF00FFFFFF00A8A7A7FFF3EF
          EBFFEAE4DCFFE2D8CDFFD9CDBFFFB6AA9DFF9797958F4D4A45FF5F5C58FF8C89
          85FF918E8AFF666460FF615F5BFF7E7D7A9FFFFFFF00FFFFFF00B3B3B3BFF6F3
          F0FFEDE8E1FFE5DCD2FFDCD1C3FFB8ADA1FFD9D9D93F474440EF44413CFF423F
          3AFF423F3AFF423F3AFF3F3C38FFBEBDBC4FFFFFFF00FFFFFF00A0A0A0BFF9F7
          F5FFF0EBE6FFE8E0D7FFDFD4C8FFC1B6AAFFC6C6C65FB3B2B15F44413CFF4946
          41FF47443FFF4C4944FF615F5BCFFFFFFF00FFFFFF00FFFFFF00B3B3B37FFCFB
          FAFFF3EFEBFFEAE4DCFFE2D8CDFFD9CDBFFFB3B3B37FFFFFFF00A8A7A56F514F
          4BDF575450DF918F8D8FF2F2F20FFFFFFF00FFFFFF00FFFFFF00BDBDBD6FF5F5
          F5FFF6F3F0FFEDE8E1FFC5BEB7FFB0A9A0FFB3B3B37FFFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D9D9D93FA0A0
          A0FFA7A6A5EFA8A8A89FD9D9D93FD9D9D93FF6F6F60FFFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        Margin = 4
        Transparent = False
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 37
        Top = 6
        Width = 32
        Height = 25
        GroupIndex = 1
        Down = True
        Glyph.Data = {
          96070000424DF60A000000000000F60600002800000010000000100000000100
          20000000000000040000120B0000120B0000D8000000D8000000000000000000
          330000006600000099000000CC000000FF000033000000333300003366000033
          99000033CC000033FF00006600000066330000666600006699000066CC000066
          FF00009900000099330000996600009999000099CC000099FF0000CC000000CC
          330000CC660000CC990000CCCC0000CCFF0000FF000000FF330000FF660000FF
          990000FFCC0000FFFF00330000003300330033006600330099003300CC003300
          FF00333300003333330033336600333399003333CC003333FF00336600003366
          330033666600336699003366CC003366FF003399000033993300339966003399
          99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
          FF0033FF000033FF330033FF660033FF990033FFCC0033FFFF00660000006600
          330066006600660099006600CC006600FF006633000066333300663366006633
          99006633CC006633FF00666600006666330066666600666699006666CC006666
          FF00669900006699330066996600669999006699CC006699FF0066CC000066CC
          330066CC660066CC990066CCCC0066CCFF0066FF000066FF330066FF660066FF
          990066FFCC0066FFFF00990000009900330099006600990099009900CC009900
          FF00993300009933330099336600993399009933CC009933FF00996600009966
          330099666600996699009966CC009966FF009999000099993300999966009999
          99009999CC009999FF0099CC000099CC330099CC660099CC990099CCCC0099CC
          FF0099FF000099FF330099FF660099FF990099FFCC0099FFFF00CC000000CC00
          3300CC006600CC009900CC00CC00CC00FF00CC330000CC333300CC336600CC33
          9900CC33CC00CC33FF00CC660000CC663300CC666600CC669900CC66CC00CC66
          FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
          3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF3300CCFF6600CCFF
          9900CCFFCC00CCFFFF00FF000000FF003300FF006600FF009900FF00CC00FF00
          FF00FF330000FF333300FF336600FF339900FF33CC00FF33FF00FF660000FF66
          3300FF666600FF669900FF66CC00FF66FF00FF990000FF993300FF996600FF99
          9900FF99CC00FF99FF00FFCC0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCC
          FF00FFFF0000FFFF3300FFFF6600FFFF9900FFFFCC00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00DCDCDC2FD1D1D13FC5C5C54FA2A2A27FA2A2
          A27FA2A2A27FA2A2A27FA2A2A27FA2A2A27FF4F4F40FFFFFFF00FFFFFF00FFFF
          FF00F4F4F40FD1D1D13FC5C5C54F505050EF575553FF545250FF5C5A56FF7470
          69FF79746DFF7F7972FF847E76FF67635FFF454545FF5C5C5CDFF4F4F40F7373
          73BF686868CF4F4E4DFF5D5B57FF53514FFF7C7770FF827B74FF736F68FFA59C
          8FFFB0A698FFBBAFA0FFC6B8A9FF8B837BFF676460FF5C5C5CDFDCDCDC2F4545
          45FF716C66FF5A5855FFA79D90FF847D75FF6A6661FF988F85FF615F5BFFA79E
          91FFB2A799FFBDB1A2FFC7BAAAFF716C67FF52504FFFA2A2A27FFFFFFF007F7F
          7FAF575553FF4F4E4DFFA79D90FFAEA295FF5A5855FF898279FF5C5A56FFA99F
          92FFB4A99BFFBEB2A3FFC9BCACFF565552FF5C5C5CDFFFFFFF00FFFFFF00E8E8
          E81F454545FF454545FFA0978BFFB5A99BFFABA093FF454545FF504F4DFFA39B
          8EFFB5AA9CFFB8AD9EFF7F7972FF505050EFD1D1D13FFFFFFF00FFFFFF00FFFF
          FF00F4F4F40F505050EF575553FF7D7770FF64615DFF505050EF505050EF6461
          5DFF7B756EFF454545FF686868CFE8E8E81FFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF008B8B8B9F565452FF7E7871FF5A5755FF9696968F454545FF817B
          73FFC0B2A3FFA99E92FF656360EFDCDCDC2FFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF005C5C5CDFA59B8FFFCBBCACFFA79C90FF454545FF5C5A57FFB9AC
          9EFFCEBEAEFFD0C0B0FF8E867DFF8B8B8B9FFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00505050EF7E7870FFB5A99BFF988F84FF454545FF6D6863FFB4A8
          9AFFC3B5A6FFC5B6A7FF8B837BFF8B8B8B9FFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00C5C5C54F454545FF454545FF454545FFC5C5C54F454545FF7570
          6AFFB0A497FF878178FF4B4A49FFDCDCDC2FFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00686868CF4545
          45FF454545FF454545FFA2A2A27FFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        Margin = 4
        Transparent = False
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 71
        Top = 6
        Width = 32
        Height = 25
        GroupIndex = 1
        Glyph.Data = {
          96070000424DF60A000000000000F60600002800000010000000100000000100
          20000000000000040000120B0000120B0000D8000000D8000000000000000000
          330000006600000099000000CC000000FF000033000000333300003366000033
          99000033CC000033FF00006600000066330000666600006699000066CC000066
          FF00009900000099330000996600009999000099CC000099FF0000CC000000CC
          330000CC660000CC990000CCCC0000CCFF0000FF000000FF330000FF660000FF
          990000FFCC0000FFFF00330000003300330033006600330099003300CC003300
          FF00333300003333330033336600333399003333CC003333FF00336600003366
          330033666600336699003366CC003366FF003399000033993300339966003399
          99003399CC003399FF0033CC000033CC330033CC660033CC990033CCCC0033CC
          FF0033FF000033FF330033FF660033FF990033FFCC0033FFFF00660000006600
          330066006600660099006600CC006600FF006633000066333300663366006633
          99006633CC006633FF00666600006666330066666600666699006666CC006666
          FF00669900006699330066996600669999006699CC006699FF0066CC000066CC
          330066CC660066CC990066CCCC0066CCFF0066FF000066FF330066FF660066FF
          990066FFCC0066FFFF00990000009900330099006600990099009900CC009900
          FF00993300009933330099336600993399009933CC009933FF00996600009966
          330099666600996699009966CC009966FF009999000099993300999966009999
          99009999CC009999FF0099CC000099CC330099CC660099CC990099CCCC0099CC
          FF0099FF000099FF330099FF660099FF990099FFCC0099FFFF00CC000000CC00
          3300CC006600CC009900CC00CC00CC00FF00CC330000CC333300CC336600CC33
          9900CC33CC00CC33FF00CC660000CC663300CC666600CC669900CC66CC00CC66
          FF00CC990000CC993300CC996600CC999900CC99CC00CC99FF00CCCC0000CCCC
          3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF3300CCFF6600CCFF
          9900CCFFCC00CCFFFF00FF000000FF003300FF006600FF009900FF00CC00FF00
          FF00FF330000FF333300FF336600FF339900FF33CC00FF33FF00FF660000FF66
          3300FF666600FF669900FF66CC00FF66FF00FF990000FF993300FF996600FF99
          9900FF99CC00FF99FF00FFCC0000FFCC3300FFCC6600FFCC9900FFCCCC00FFCC
          FF00FFFF0000FFFF3300FFFF6600FFFF9900FFFFCC00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00F2F2F20FCBCAC93FA3A2A16F7F7B77BF807D78BF827E
          79BF84807ABF85817CBFBCB8B37FBDB9B47FC8C6C44FE5E5E41FFFFFFF00FFFF
          FF00FFFFFF00FFFFFF00CBCAC93F7B756CFF948C82FFA2998EFFA99F93FFAFA4
          98FFB6AA9DFFBCAFA2FFC3B5A7FFC9BAACFFCFC0B1FFC0BCB77FFFFFFF00FFFF
          FF00FFFFFF00FFFFFF00D8D8D72F7B756CFF9B9389FFA2998EFFA99F93FFAFA4
          98FFB6AA9DFFBCAFA2FFC3B5A7FFC9BAACFFCFC0B1FFABA8A57FFFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF0095918BBF9B9389FFA2998EFFA99F93FFAFA4
          98FFB6AA9DFFBCAFA2FFC3B5A7FFC9BAACFFBAAD9FFFCBCAC93FFFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00CBC9C74F8D867CFFA2998EFFA1978CFF8E85
          7BFF938A7FFFA1968AFFC3B5A7FFC9BAACFF948E88BFFFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2D1CF3F7A756FDF46433EFF5755
          51FF595754FF504E4AFF655E57FFB3ACA5AFF2F2F20FFFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AFADAA8FC3C0BCFFD6D4
          D0FFE0DEDBFFE9E7E5FF9C9B99EFF2F2F20FFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094918CFFCDCAC6FFD6D4
          D0FFE0DEDBFFE9E7E5FFE5E4E3FFCBCAC93FFFFFFF00FFFFFF00E3E3E32FBDBD
          BD6F8D8D8DBF8D8D8DBF676767FF707070EFB8B7B65FC4C0BBFFCDCAC6FFD6D4
          D0FFE0DEDBFFE9E7E5FFF2F1F0FFBDBCBB7FFFFFFF00FFFFFF00707070EF5654
          53FF58534DFF6B635AFF8A7D6EFF77736EFFA5A4A37FC4C0BBFFCDCAC6FFD6D4
          D0FFE0DEDBFFE9E7E5FFF2F1F0FFA2A1A09FFFFFFF00FFFFFF00676767FF2B27
          23FF453F37FF63594EFF807466FF75716CFF9797958F4D4A45FF5F5C58FF8C89
          85FF918E8AFF666460FF615F5BFF7E7D7A9FFFFFFF00FFFFFF008D8D8DBF302E
          2BFF3B362FFF595046FF776C5EFF726E6AFFD9D9D93F474440EF44413CFF423F
          3AFF423F3AFF423F3AFF3F3C38FFBEBDBC4FFFFFFF00FFFFFF008D8D8DBF3837
          36FF312C27FF4F473EFF6D6256FF716D69FFC6C6C65FB3B2B15F44413CFF4946
          41FF47443FFF4C4944FF615F5BCFFFFFFF00FFFFFF00FFFFFF00B3B3B37F3838
          37FF27231FFF453F37FF63594EFF746E66FFB3B3B37FFFFFFF00A8A7A56F514F
          4BDF575450DF918F8D8FF2F2F20FFFFFFF00FFFFFF00FFFFFF00BDBDBD6F4040
          40FF2A2826FF514E4BFF646260FF676767FFB3B3B37FFFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D9D9D93F6767
          67FF707070EFA0A0A09FD9D9D93FD9D9D93FF6F6F60FFFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        Margin = 4
        Transparent = False
        OnClick = SpeedButton3Click
      end
      object Button4: TButton
        Left = 3
        Top = 35
        Width = 32
        Height = 24
        Caption = #1040
        TabOrder = 0
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 37
        Top = 35
        Width = 32
        Height = 24
        Caption = #1041
        TabOrder = 1
        OnClick = Button4Click
      end
      object Button6: TButton
        Left = 71
        Top = 35
        Width = 32
        Height = 24
        Caption = #1042
        TabOrder = 2
        OnClick = Button4Click
      end
      object Button7: TButton
        Left = 3
        Top = 61
        Width = 32
        Height = 24
        Caption = #1043
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button8: TButton
        Left = 37
        Top = 61
        Width = 32
        Height = 24
        Caption = #1044
        TabOrder = 4
        OnClick = Button4Click
      end
      object Button9: TButton
        Left = 71
        Top = 61
        Width = 32
        Height = 24
        Caption = #1045
        TabOrder = 5
        OnClick = Button4Click
      end
      object Button10: TButton
        Left = 3
        Top = 87
        Width = 32
        Height = 24
        Caption = #1046
        TabOrder = 6
        OnClick = Button4Click
      end
      object Button11: TButton
        Left = 37
        Top = 87
        Width = 32
        Height = 24
        Caption = #1047
        TabOrder = 7
        OnClick = Button4Click
      end
      object Button12: TButton
        Left = 71
        Top = 87
        Width = 32
        Height = 24
        Caption = #1048
        TabOrder = 8
        OnClick = Button4Click
      end
      object Button13: TButton
        Left = 3
        Top = 113
        Width = 32
        Height = 24
        Caption = #1050
        TabOrder = 9
        OnClick = Button4Click
      end
      object Button14: TButton
        Left = 37
        Top = 113
        Width = 32
        Height = 24
        Caption = #1051
        TabOrder = 10
        OnClick = Button4Click
      end
      object Button15: TButton
        Left = 71
        Top = 113
        Width = 32
        Height = 24
        Caption = #1052
        TabOrder = 11
        OnClick = Button4Click
      end
      object Button16: TButton
        Left = 3
        Top = 139
        Width = 32
        Height = 24
        Caption = #1053
        TabOrder = 12
        OnClick = Button4Click
      end
      object Button17: TButton
        Left = 37
        Top = 139
        Width = 32
        Height = 24
        Caption = #1054
        TabOrder = 13
        OnClick = Button4Click
      end
      object Button18: TButton
        Left = 71
        Top = 139
        Width = 32
        Height = 24
        Caption = #1055
        TabOrder = 14
        OnClick = Button4Click
      end
      object Button19: TButton
        Left = 3
        Top = 165
        Width = 32
        Height = 24
        Caption = #1056
        TabOrder = 15
        OnClick = Button4Click
      end
      object Button20: TButton
        Left = 37
        Top = 165
        Width = 32
        Height = 24
        Caption = #1057
        TabOrder = 16
        OnClick = Button4Click
      end
      object Button21: TButton
        Left = 71
        Top = 165
        Width = 32
        Height = 24
        Caption = #1058
        TabOrder = 17
        OnClick = Button4Click
      end
      object Button22: TButton
        Left = 3
        Top = 191
        Width = 32
        Height = 24
        Caption = #1059
        TabOrder = 18
        OnClick = Button4Click
      end
      object Button23: TButton
        Left = 37
        Top = 191
        Width = 32
        Height = 24
        Caption = #1060
        TabOrder = 19
        OnClick = Button4Click
      end
      object Button24: TButton
        Left = 71
        Top = 191
        Width = 32
        Height = 24
        Caption = #1061
        TabOrder = 20
        OnClick = Button4Click
      end
      object Button25: TButton
        Left = 3
        Top = 217
        Width = 32
        Height = 24
        Caption = #1062
        TabOrder = 21
        OnClick = Button4Click
      end
      object Button26: TButton
        Left = 37
        Top = 217
        Width = 32
        Height = 24
        Caption = #1063
        TabOrder = 22
        OnClick = Button4Click
      end
      object Button27: TButton
        Left = 71
        Top = 217
        Width = 32
        Height = 24
        Caption = #1064
        TabOrder = 23
        OnClick = Button4Click
      end
      object Button28: TButton
        Left = 3
        Top = 243
        Width = 32
        Height = 24
        Caption = #1065
        TabOrder = 24
        OnClick = Button4Click
      end
      object Button29: TButton
        Left = 37
        Top = 243
        Width = 32
        Height = 24
        Caption = #1069
        TabOrder = 25
        OnClick = Button4Click
      end
      object Button30: TButton
        Left = 71
        Top = 243
        Width = 32
        Height = 24
        Caption = #1070
        TabOrder = 26
        OnClick = Button4Click
      end
      object Button31: TButton
        Left = 3
        Top = 269
        Width = 32
        Height = 24
        Caption = '<'
        TabOrder = 27
        OnClick = Button31Click
      end
      object Button32: TButton
        Left = 37
        Top = 269
        Width = 32
        Height = 24
        Caption = #1071
        TabOrder = 28
        OnClick = Button4Click
      end
      object Button33: TButton
        Left = 71
        Top = 269
        Width = 32
        Height = 24
        Caption = '>'
        TabOrder = 29
        OnClick = Button33Click
      end
      object Button34: TButton
        Left = 3
        Top = 297
        Width = 100
        Height = 25
        Caption = #1074#1099#1093#1086#1076
        TabOrder = 30
        OnClick = Button34Click
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 14
    Top = 52
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 43
    Top = 52
  end
  object tfXPPopUpMenu1: TPopupMenu
    Images = Form1.ImageList1
    OwnerDraw = True
    Left = 14
    Top = 84
    object N7: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1083#1080#1077#1085#1090#1072'...'
      OnClick = N7Click
    end
    object N8: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1083#1080#1077#1085#1090#1072
      OnClick = N8Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1082#1083#1080#1077#1085#1090#1072'...'
      ImageIndex = 33
      OnClick = N6Click
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1084#1077#1090#1082#1072#1084#1080' '#1082#1083#1080#1077#1085#1090#1072
      object N1: TMenuItem
        Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1087#1086#1084#1077#1090#1082#1080
        ImageIndex = 33
        OnClick = N1Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object N3: TMenuItem
        Caption = #1047#1072#1085#1077#1089#1090#1080' '#1074' "'#1095#1077#1088#1085#1099#1081' '#1089#1087#1080#1089#1086#1082'"'
        ImageIndex = 12
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1047#1072#1085#1077#1089#1090#1080' '#1074' "'#1073#1077#1083#1099#1081' '#1089#1087#1080#1089#1086#1082'"'
        ImageIndex = 11
        OnClick = N4Click
      end
    end
  end
  object SmallNeedsQuery: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 14
    Top = 119
  end
end
