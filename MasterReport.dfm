object Form14: TForm14
  Left = 222
  Top = 174
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1088#1072#1073#1086#1090#1077' '#1084#1072#1089#1090#1077#1088#1072' '#1079#1072' '#1075#1086#1076
  ClientHeight = 388
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton2: TSpeedButton
    Left = 574
    Top = 364
    Width = 115
    Height = 22
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Layout = blGlyphBottom
    OnClick = SpeedButton2Click
  end
  object PageControl1: TPageControl
    Left = -37
    Top = -11
    Width = 238
    Height = 371
    ActivePage = TabSheet1
    MultiLine = True
    TabOrder = 0
    TabPosition = tpLeft
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Label3: TLabel
        Left = 37
        Top = 338
        Width = 113
        Height = 13
        Cursor = crHandPoint
        Caption = #1053#1072#1087#1077#1095#1072#1090#1072#1090#1100' '#1075#1088#1072#1092#1080#1082'...'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 6705726
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        OnClick = Label3Click
        OnMouseEnter = Label3MouseEnter
        OnMouseLeave = Label3MouseLeave
      end
      object Label13: TLabel
        Left = 37
        Top = 322
        Width = 136
        Height = 13
        Cursor = crHandPoint
        Caption = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1075#1088#1072#1092#1080#1082'...'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 6705726
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        OnClick = Label13Click
        OnMouseEnter = Label13MouseEnter
        OnMouseLeave = Label13MouseLeave
      end
      object Bevel2: TBevel
        Left = 21
        Top = 312
        Width = 183
        Height = 9
        Shape = bsTopLine
      end
      object Label2: TLabel
        Left = 24
        Top = 296
        Width = 59
        Height = 13
        Caption = #1044#1077#1081#1089#1090#1074#1080#1103':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 4737096
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape5: TShape
        Left = 21
        Top = 161
        Width = 183
        Height = 1
        Pen.Color = 13619151
      end
      object Shape4: TShape
        Left = 21
        Top = 81
        Width = 183
        Height = 1
        Pen.Color = 13619151
      end
      object Bevel1: TBevel
        Left = 21
        Top = 33
        Width = 183
        Height = 8
        Shape = bsTopLine
      end
      object Label1: TLabel
        Left = 24
        Top = 16
        Width = 71
        Height = 13
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 4737096
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel1: TPanel
        Left = 24
        Top = 165
        Width = 171
        Height = 63
        BevelOuter = bvNone
        TabOrder = 4
        object RadioButton5: TRadioButton
          Tag = 3
          Left = 8
          Top = 36
          Width = 155
          Height = 17
          Caption = #1055#1088#1080#1073#1099#1083#1100
          TabOrder = 2
          OnClick = RadioButton3Click
        end
        object RadioButton4: TRadioButton
          Tag = 2
          Left = 8
          Top = 20
          Width = 155
          Height = 17
          Caption = #1047#1072#1090#1088#1072#1090#1099' '#1085#1072' '#1076#1077#1090#1072#1083#1080
          TabOrder = 1
          OnClick = RadioButton3Click
        end
        object RadioButton3: TRadioButton
          Tag = 1
          Left = 8
          Top = 4
          Width = 155
          Height = 17
          Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1085#1099#1077' '#1079#1072#1082#1072#1079#1099
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButton3Click
        end
      end
      object ComboBox1: TComboBox
        Left = 48
        Top = 128
        Width = 145
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        TabOrder = 3
        OnChange = ComboBox1Change
      end
      object RadioButton2: TRadioButton
        Left = 32
        Top = 104
        Width = 155
        Height = 17
        Caption = #1054#1090#1076#1077#1083#1100#1085#1086' '#1087#1086' '#1084#1072#1089#1090#1077#1088#1091
        TabOrder = 2
        OnClick = RadioButton1Click
      end
      object RadioButton1: TRadioButton
        Left = 32
        Top = 88
        Width = 155
        Height = 17
        Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1074' '#1094#1077#1083#1086#1084
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = RadioButton1Click
      end
      object ComboBox2: TComboBox
        Left = 48
        Top = 48
        Width = 89
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = ComboBox2Change
      end
    end
  end
  object PageControl2: TPageControl
    Left = 201
    Top = -9
    Width = 539
    Height = 369
    ActivePage = TabSheet2
    MultiLine = True
    TabOrder = 1
    TabPosition = tpRight
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      object Chart1: TChart
        Left = 3
        Top = 11
        Width = 479
        Height = 347
        AllowPanning = pmNone
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        BottomWall.Color = 14079702
        Gradient.Direction = gdLeftRight
        Gradient.EndColor = 13619151
        Gradient.StartColor = 16316664
        Gradient.Visible = True
        LeftWall.Color = 14342874
        Title.Color = clSilver
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        LeftAxis.Axis.Color = -1
        LeftAxis.Grid.Color = 6908265
        LeftAxis.LabelsFont.Charset = RUSSIAN_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Tahoma'
        LeftAxis.LabelsFont.Style = []
        LeftAxis.LabelsMultiLine = True
        LeftAxis.MinorGrid.Color = -1
        LeftAxis.Ticks.Color = 10911326
        LeftAxis.Title.Font.Charset = RUSSIAN_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -11
        LeftAxis.Title.Font.Name = 'Tahoma'
        LeftAxis.Title.Font.Style = []
        Legend.Font.Charset = RUSSIAN_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -11
        Legend.Font.Name = 'Tahoma'
        Legend.Font.Style = []
        Legend.Visible = False
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Series1: THorizBarSeries
          ColorEachPoint = True
          Marks.ArrowLength = 20
          Marks.BackColor = 16315121
          Marks.Font.Charset = RUSSIAN_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -11
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          SeriesColor = clRed
          ShowInLegend = False
          BarPen.Color = 14602176
          BarStyle = bsRectGradient
          XValues.DateTime = False
          XValues.Name = 'Bar'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loAscending
        end
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = MainForm.MainConnection
    Parameters = <>
    Left = 148
    Top = 100
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 176
    Top = 100
  end
  object ExportPopup: TPopupMenu
    OwnerDraw = True
    Left = 161
    Top = 309
    object bmp1: TMenuItem
      Tag = 1
      Caption = #1042' '#1088#1072#1089#1090#1088#1086#1074#1099#1081' '#1092#1072#1081#1083' .bmp'
      OnClick = bmp1Click
    end
    object wmf1: TMenuItem
      Tag = 2
      Caption = #1042' '#1074#1077#1082#1090#1086#1088#1085#1099#1081' '#1092#1072#1081#1083' .wmf'
      OnClick = bmp1Click
    end
  end
  object ADOQuery2: TADOQuery
    Connection = MainForm.MainConnection
    Parameters = <>
    Left = 588
    Top = 25
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 620
    Top = 25
  end
end
