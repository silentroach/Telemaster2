object Form23: TForm23
  Left = 457
  Top = 423
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Form23'
  ClientHeight = 148
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object VolgaDBGrid1: TVolgaDBGrid
    Left = 0
    Top = 0
    Width = 441
    Height = 148
    Align = alClient
    AllowDelete = False
    AllowInsert = False
    DataSource = DataSource1
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnMouseUp = VolgaDBGrid1MouseUp
    Columns = <
      item
        FieldName = 'Name'
        Title.Caption = #1060'.'#1048'.'#1054'. '#1082#1083#1080#1077#1085#1090#1072
        Visible = True
        Width = 159
      end
      item
        FieldName = 'Address'
        Title.Caption = #1040#1076#1088#1077#1089
        Visible = True
        Width = 260
      end>
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 16
    Top = 104
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 44
    Top = 104
  end
end
