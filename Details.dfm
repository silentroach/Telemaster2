object Form13: TForm13
  Left = 206
  Top = 96
  BorderStyle = bsDialog
  Caption = #1044#1077#1090#1072#1083#1080' '#1085#1072' '#1088#1077#1084#1086#1085#1090' '#1072#1087#1087#1072#1088#1072#1090#1072
  ClientHeight = 310
  ClientWidth = 496
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
  object SpeedButton3: TSpeedButton
    Left = 360
    Top = 283
    Width = 129
    Height = 23
    AllowAllUp = True
    Caption = #1074#1099#1093#1086#1076
    NumGlyphs = 4
    Spacing = 8
    Transparent = False
    OnClick = SpeedButton3Click
  end
  object PageControl1: TPageControl
    Left = 0
    Top = -6
    Width = 532
    Height = 285
    ActivePage = TabSheet1
    MultiLine = True
    TabOrder = 0
    TabPosition = tpRight
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Label5: TLabel
        Left = 355
        Top = 178
        Width = 129
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1048#1090#1086#1075#1086':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 4737096
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 355
        Top = 205
        Width = 129
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1077#1090#1072#1083#1077#1081
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 4745276
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel
        Left = 355
        Top = 221
        Width = 129
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0 '#1096#1090'.'
      end
      object Label3: TLabel
        Left = 355
        Top = 243
        Width = 129
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1057#1091#1084#1084#1072#1088#1085#1072#1103' '#1094#1077#1085#1072' '#1076#1077#1090#1072#1083#1077#1081
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 4745276
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 355
        Top = 259
        Width = 129
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0 '#1088#1091#1073'.'
        OnMouseEnter = Label4MouseEnter
      end
      object Bevel1: TBevel
        Left = 357
        Top = 195
        Width = 127
        Height = 14
        Shape = bsTopLine
      end
      object VolgaDBGrid1: TVolgaDBGrid
        Left = 4
        Top = 10
        Width = 342
        Height = 261
        AllowDelete = False
        AllowInsert = False
        DataSource = DataSource1
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
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
            Title.Caption = #1085#1072#1079#1074#1072#1085#1080#1077' '#1076#1077#1090#1072#1083#1080
            Visible = True
            Width = 232
          end
          item
            CanClick = True
            FieldName = 'Price'
            Title.Caption = #1094#1077#1085#1072
            Visible = True
            Width = 88
          end>
      end
      object ScrollBar1: TScrollBar
        Left = 329
        Top = 12
        Width = 15
        Height = 258
        Kind = sbVertical
        LargeChange = 10
        PageSize = 0
        TabOrder = 4
        OnScroll = ScrollBar1Scroll
      end
      object Button1: TButton
        Left = 355
        Top = 64
        Width = 129
        Height = 23
        Caption = #1091#1076#1072#1083#1080#1090#1100' '#1076#1077#1090#1072#1083#1100
        TabOrder = 3
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 355
        Top = 10
        Width = 129
        Height = 23
        Caption = #1076#1086#1073#1072#1074#1080#1090#1100' '#1076#1077#1090#1072#1083#1100'...'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 355
        Top = 34
        Width = 129
        Height = 23
        Caption = #1080#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1077'...'
        TabOrder = 2
        OnClick = Button3Click
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = MainForm.MainConnection
    Parameters = <>
    Left = 265
    Top = 204
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 293
    Top = 204
  end
  object ADOQuery2: TADOQuery
    Connection = MainForm.MainConnection
    Parameters = <>
    Left = 265
    Top = 236
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 293
    Top = 236
  end
end
