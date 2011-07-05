object Form16: TForm16
  Left = 307
  Top = 304
  BorderStyle = bsDialog
  Caption = #1047#1072#1082#1083#1072#1076#1082#1080' '#1090#1077#1083#1077#1092#1086#1085#1085#1086#1081' '#1082#1085#1080#1078#1082#1080
  ClientHeight = 230
  ClientWidth = 361
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
    Left = -43
    Top = -14
    Width = 259
    Height = 261
    ActivePage = TabSheet1
    MultiLine = True
    TabOrder = 0
    TabPosition = tpLeft
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object VolgaDBGrid1: TVolgaDBGrid
        Left = 23
        Top = 15
        Width = 205
        Height = 221
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
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawCellAttr = VolgaDBGrid1DrawCellAttr
        OnTitleClick = VolgaDBGrid1TitleClick
        Columns = <
          item
            Alignment = taCenter
            CanClick = True
            FieldName = 'Name'
            Title.Caption = #1085#1072#1079#1074#1072#1085#1080#1077' '#1079#1072#1082#1083#1072#1076#1082#1080
            Visible = True
            Width = 184
          end>
      end
      object ScrollBar1: TScrollBar
        Left = 211
        Top = 17
        Width = 15
        Height = 217
        Kind = sbVertical
        PageSize = 0
        TabOrder = 1
        OnScroll = ScrollBar1Scroll
      end
    end
  end
  object PageControl2: TPageControl
    Left = 216
    Top = -34
    Width = 289
    Height = 290
    ActivePage = TabSheet2
    MultiLine = True
    TabOrder = 1
    TabPosition = tpRight
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      object Button1: TButton
        Left = 4
        Top = 37
        Width = 129
        Height = 23
        Caption = #1076#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1083#1072#1076#1082#1091'...'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 4
        Top = 60
        Width = 129
        Height = 23
        Caption = #1080#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1077'...'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 4
        Top = 100
        Width = 129
        Height = 23
        Caption = #1091#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1083#1072#1076#1082#1091
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 4
        Top = 233
        Width = 129
        Height = 23
        Caption = #1074#1099#1093#1086#1076
        TabOrder = 3
        OnClick = Button4Click
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = MainForm.MainConnection
    Parameters = <>
    Left = 225
    Top = 100
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 253
    Top = 100
  end
end
