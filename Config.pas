// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Настройки программы
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit Config;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DB, ADODB, Grids, VolDBGrid, ShlObj,
  Buttons, IniFiles, ElXPThemedControl, ElTree, ElTreeStdEditors, StrUtils,
  DateUtils, Addition,

  tlValueTypes;

type
  TForm8 = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet2: TTabSheet;
    OpenDialog1: TOpenDialog;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ElTree1: TElTree;
    Label19: TLabel;
    CheckBox6: TCheckBox;
    CheckBox2: TCheckBox;
    Label13: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label6: TLabel;
    Edit2: TEdit;
    Shape3: TShape;
    Label4: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    CheckBox4: TCheckBox;
    Label10: TLabel;
    RadioButton3: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    Label8: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    Shape4: TShape;
    Label20: TLabel;
    Label23: TLabel;
    CheckBox5: TCheckBox;
    Label22: TLabel;
    TrackBar1: TTrackBar;
    Bevel1: TBevel;
    Label24: TLabel;
    Shape5: TShape;
    Label25: TLabel;
    Label17: TLabel;
    RadioButton5: TRadioButton;
    RadioButton4: TRadioButton;
    Label16: TLabel;
    ComboBox1: TComboBox;
    Label15: TLabel;
    Shape6: TShape;
    Label26: TLabel;
    Label27: TLabel;
    Shape7: TShape;
    TabSheet6: TTabSheet;
    Shape8: TShape;
    Label28: TLabel;
    Edit3: TEdit;
    Label29: TLabel;
    Edit4: TEdit;
    Label30: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    Edit7: TEdit;
    Label33: TLabel;
    Shape9: TShape;
    Label34: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Label35: TLabel;
    Label36: TLabel;
    CheckBox7: TCheckBox;
    Label37: TLabel;
    Label38: TLabel;
    Edit10: TEdit;
    PageControl2: TPageControl;
    TabSheet7: TTabSheet;
    SpeedButton3: TSpeedButton;
    Panel2: TPanel;
    SpeedButton10: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label39: TLabel;
    RadioButton6: TRadioButton;
    CheckBox3: TCheckBox;
    Label14: TLabel;
    GroupBox1: TGroupBox;
    Label40: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure Label23Click(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure Label19Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ElTree1DblClick(Sender: TObject);
    procedure ElTree1ItemFocused(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label3MouseEnter(Sender: TObject);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label18MouseEnter(Sender: TObject);
    procedure Label18MouseLeave(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Label37Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Label39Click(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Label37MouseLeave(Sender: TObject);
    procedure Label37MouseEnter(Sender: TObject);
  private
    procedure UnUnderLine;
    procedure CalcBackupDate;

    procedure DescribeIt(Sender: TObject);
    procedure UnDescribeIt;
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  EditorControl : TWinControl;
  FocusedItem: TElTreeItem;
  Item: TElTreeItem;

implementation

uses MainWindow;

{$R *.dfm}

procedure TForm8.SpeedButton2Click(Sender: TObject);
begin
  if EditorControl<>nil then
    begin
      EditorControl.Free;
      EditorControl:=nil;
    end;
  Close;
end;

procedure TForm8.Label13Click(Sender: TObject);
begin
  CheckBox2.Checked:=not(CheckBox2.Checked);
end;

procedure TForm8.Label7Click(Sender: TObject);
begin
  CheckBox1.Checked:=not(CheckBox1.Checked);
end;

procedure TForm8.Label8Click(Sender: TObject);
begin
  RadioButton1.Checked:=True;
end;

procedure TForm8.Label9Click(Sender: TObject);
begin
  RadioButton2.Checked:=True;
end;

procedure TForm8.Label10Click(Sender: TObject);
begin
  RadioButton3.Checked:=True;
end;

procedure TForm8.Label21Click(Sender: TObject);
begin
  CheckBox4.Checked:=not(CheckBox4.Checked);
end;

procedure TForm8.Label23Click(Sender: TObject);
begin
  CheckBox5.Checked:=not(CheckBox5.Checked);
end;

procedure TForm8.Label16Click(Sender: TObject);
begin
  RadioButton4.Checked:=True;
end;

procedure TForm8.Label17Click(Sender: TObject);
begin
  RadioButton5.Checked:=True;
end;

procedure TForm8.Label19Click(Sender: TObject);
begin
  CheckBox6.Checked:=not(CheckBox6.Checked);
end;

procedure TForm8.TrackBar1Change(Sender: TObject);
begin
  if TrackBar1.Position=0 then Label22.Caption:='удалять все'
    else
      if TrackBar1.Position=TrackBar1.Max then Label22.Caption:='хранить все удаленные'
                                          else Label22.Caption:=IntToStr(TrackBar1.Position)+' записи(ей)';
end;

procedure TForm8.SpeedButton1Click(Sender: TObject);
var CompressType: integer;
               i: integer;
begin            // сохранение настроек
  if EditorControl<>nil then
    begin
      EditorControl.Free;
      EditorControl:=nil;
    end;
// initialization
  CompressType:=0;
// главные настройки
  with MainForm.Config do
    begin
      WriteString('Main','BasePath',Edit1.Text);
      WriteString('Main','MoneyValue',Edit10.Text);
      WriteBool('Main','CompressBase',CheckBox2.Checked);
      WriteBool('Main','MinimizeToTray',CheckBox6.Checked);
      WriteBool('Main','AutoFilterApply',CheckBox7.Checked);
      WriteBool('Main','LongColor',CheckBox3.Checked);
// резервирование
      WriteString('BackUp','BackupDir',Edit2.Text);
      WriteBool('BackUp','Auto',CheckBox1.Checked);
      if RadioButton1.Checked then CompressType:=1;
      if RadioButton2.Checked then CompressType:=2;
      if RadioButton3.Checked then CompressType:=3;
      if RadioButton6.Checked then CompressType:=4;
      WriteInteger('BackUp','AutomateType',CompressType);
      if (CheckBox1.Checked) and not(RadioButton6.Checked) then WriteDate('BackUp','NextDate',StrToDate(Label12.Caption));
      WriteBool('BackUp','InSilent',CheckBox4.Checked);
// корзина
      WriteInteger('Trash','HowMuch',TrackBar1.Position);
      WriteBool('Trash','AutoEmpty',CheckBox5.Checked);
// модем
      WriteInteger('DialUp','ComPort',ComboBox1.ItemIndex+1);
      WriteBool('DialUp','Type',RadioButton4.Checked);
// цвета
      for i:=0 to ElTree1.Items.Count-1 do
        begin
          case ElTree1.Items[i].Tag of
            1: WriteInteger('Colors','BackGround',StrToInt(LeftStr(ElTree1.Items[i].ColumnText.Text,Length(ElTree1.Items[i].ColumnText.Text)-2)));
            2: WriteInteger('Colors','SelectedBack',StrToInt(LeftStr(ElTree1.Items[i].ColumnText.Text,Length(ElTree1.Items[i].ColumnText.Text)-2)));
            3: WriteInteger('Colors','SelectedFont',StrToInt(LeftStr(ElTree1.Items[i].ColumnText.Text,Length(ElTree1.Items[i].ColumnText.Text)-2)));
            4: WriteInteger('Colors','EditBox',StrToInt(LeftStr(ElTree1.Items[i].ColumnText.Text,Length(ElTree1.Items[i].ColumnText.Text)-2)));
            5: WriteInteger('Colors','Attention1',StrToInt(LeftStr(ElTree1.Items[i].ColumnText.Text,Length(ElTree1.Items[i].ColumnText.Text)-2)));
            6: WriteInteger('Colors','Attention2',StrToInt(LeftStr(ElTree1.Items[i].ColumnText.Text,Length(ElTree1.Items[i].ColumnText.Text)-2)));
            7: WriteInteger('Colors','Attention3',StrToInt(LeftStr(ElTree1.Items[i].ColumnText.Text,Length(ElTree1.Items[i].ColumnText.Text)-2)));
            8: WriteInteger('Colors','Attention4',StrToInt(LeftStr(ElTree1.Items[i].ColumnText.Text,Length(ElTree1.Items[i].ColumnText.Text)-2)));
          end;
        end;
// данные об организации
      WriteString('Organization','Name',Edit3.Text);
      WriteString('Organization','Address',Edit4.Text);
      WriteString('Organization','Phone',Edit5.Text);
      WriteString('Organization','Fax',Edit6.Text);
      WriteString('Organization','EMail',Edit7.Text);
      WriteString('Organization','Director',Edit8.Text);
      WriteString('Organization','Accounter',Edit9.Text);
    end;

  SpeedButton2Click(Self);
end;

procedure TForm8.FormShow(Sender: TObject);
var ParentItem: TElTreeItem;
       NewItem: TElTreeItem;
begin
  with MainForm.Config do
    begin
      Edit1.Text:=ReadString('Main','BasePath',ChangeFileExt(paramstr(0),'.dat'));
      Edit10.Text:=ReadString('Main','MoneyValue','руб.');
      CheckBox2.Checked:=ReadBool('Main','CompressBase',true);
      CheckBox6.Checked:=ReadBool('Main','MinimizeToTray',true);
      CheckBox7.Checked:=ReadBool('Main','AutoFilterApply',true);
      CheckBox3.Checked:=ReadBool('Main','LongColor',false);
     
// резервирование
      Edit2.Text:=ReadString('BackUp','BackupDir','');
      CheckBox1.Checked:=ReadBool('BackUp','Auto',false);
      case ReadInteger('BackUp','AutomateType',1) of
        1: RadioButton1.Checked:=True;
        2: RadioButton2.Checked:=True;
        3: RadioButton3.Checked:=True;
        4: RadioButton6.Checked:=True;
      end;
      CheckBox4.Checked:=ReadBool('BackUp','InSilent',true);
// корзина
      TrackBar1.Position:=ReadInteger('Trash','HowMuch',15);
      CheckBox5.Checked:=ReadBool('Trash','AutoEmpty',false);
// модем
      ComboBox1.ItemIndex:=ReadInteger('DialUp','ComPort',4)-1;
      RadioButton4.Checked:=ReadBool('DialUp','Type',false);
// данные об организации
      Edit3.Text := ReadString('Organization','Name','');
      Edit4.Text := ReadString('Organization','Address','');
      Edit5.Text := ReadString('Organization','Phone','');
      Edit6.Text := ReadString('Organization','Fax','');
      Edit7.Text := ReadString('Organization','EMail','');
      Edit8.Text := MainForm.GetValue(vtOrgDirector);
      Edit9.Text := MainForm.GetValue(vtOrgBuh);
    end;
// цвета
  ParentItem:=ElTree1.Items.AddItem(nil);
  ParentItem.Text:='Основные цвета';
  NewItem:=ElTree1.Items.AddItem(ParentItem);
  NewItem.Text:='Фон в таблице';
  NewItem.ColumnText.Add(IntToStr(MainForm.Config.ReadInteger('Colors','BackGround',0)));
  NewItem.Tag:=1;

  NewItem:=ElTree1.Items.AddItem(ParentItem);
  NewItem.Text:='Фон выделенной строки';
  NewItem.ColumnText.Add(IntToStr(MainForm.Config.ReadInteger('Colors','SelectedBack',0)));
  NewItem.Tag:=2;

  NewItem:=ElTree1.Items.AddItem(ParentItem);
  NewItem.Text:='Шрифт выделенной строки';
  NewItem.ColumnText.Add(IntToStr(MainForm.Config.ReadInteger('Colors','SelectedFont',0)));
  NewItem.Tag:=3;

  NewItem:=ElTree1.Items.AddItem(ParentItem);
  NewItem.Text:='Строка ввода';
  NewItem.ColumnText.Add(IntToStr(MainForm.Config.ReadInteger('Colors','EditBox',0)));
  NewItem.Tag:=4;

  ParentItem:=ElTree1.Items.AddItem(nil);
  ParentItem.Text:='Предупреждения';
  NewItem:=ElTree1.Items.AddItem(ParentItem);
  NewItem.Text:='Нераспределенный аппарат';
  NewItem.ColumnText.Add(IntToStr(MainForm.Config.ReadInteger('Colors','Attention1',0)));
  NewItem.Tag:=5;

  NewItem:=ElTree1.Items.AddItem(ParentItem);
  NewItem.Text:='Срочный ремонт';
  NewItem.ColumnText.Add(IntToStr(MainForm.Config.ReadInteger('Colors','Attention2',0)));
  NewItem.Tag:=6;

  NewItem:=ElTree1.Items.AddItem(ParentItem);
  NewItem.Text:='Очень долго не забирают из ремонта';
  NewItem.ColumnText.Add(IntToStr(MainForm.Config.ReadInteger('Colors','Attention3',0)));
  NewItem.Tag:=7;

  NewItem:=ElTree1.Items.AddItem(ParentItem);
  NewItem.Text:='Аппарат возвращен по гарантии';
  NewItem.ColumnText.Add(IntToStr(MainForm.Config.ReadInteger('Colors','Attention4',0)));
  NewItem.Tag:=8;

  ElTree1.FullExpand;

  PageControl1.TabIndex:=0;
  SpeedButton6.Font.Style:=[fsUnderline];

  CheckBox1Click(Self);
end;

procedure TForm8.ElTree1DblClick(Sender: TObject);
var R: TRect;
begin
  if EditorControl<>nil then
    begin
      FocusedItem.ColumnText.Text:=(IntToStr(TColorBox(EditorControl).Selected));
      EditorControl.Free;
      EditorControl:=nil;
    end;
  if (ElTree1.Selected<>nil) then if (ElTree1.Selected.Parent<>nil) then
    begin
      FocusedItem:=ElTree1.Selected;
      EditorControl:=TColorBox.Create(Self);
      R:=ElTree1.GetItemRect(ElTree1.IndexInView(ElTree1.Selected));
      R.Left:=300;
      R.Right:=R.Left+206;
      R.Top:=R.Top-3;
      EditorControl.BoundsRect:=R;
      EditorControl.Parent:=ElTree1;
      TColorBox(EditorControl).Selected:=StrToInt(LeftStr(ElTree1.Selected.ColumnText.Text,Length(ElTree1.Selected.ColumnText.Text)-2));
      TColorBox(EditorControl).Style:=[cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames];
    end;
end;

procedure TForm8.ElTree1ItemFocused(Sender: TObject);
begin
  if EditorControl<>nil then
    begin
      FocusedItem.ColumnText.Text:=(IntToStr(TColorBox(EditorControl).Selected));
      EditorControl.Free;
      EditorControl:=nil;
    end;
end;

procedure TForm8.Label3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Edit1.Text:=OpenDialog1.FileName;
end;

procedure TForm8.Label3MouseEnter(Sender: TObject);
begin
  Label3.Font.Style:=Label3.Font.Style+[fsUnderline];
end;

procedure TForm8.Label3MouseLeave(Sender: TObject);
begin
  Label3.Font.Style:=Label3.Font.Style-[fsUnderline];
end;

procedure TForm8.Label18MouseEnter(Sender: TObject);
begin
  Label18.Font.Style:=Label18.Font.Style+[fsUnderline];
end;

procedure TForm8.Label18MouseLeave(Sender: TObject);
begin
  Label18.Font.Style:=Label18.Font.Style-[fsUnderline];
end;

procedure TForm8.Label18Click(Sender: TObject);
begin              {
  if (JvBrowser1.Execute) and (JvBrowser1.Directory<>'') then
    Edit2.Text:=JvBrowser1.Directory;     }
end;

procedure TForm8.SpeedButton6Click(Sender: TObject);
begin                            // переход на определенную вкладку в настройках
  UnUnderline;
  (Sender as TSpeedButton).Font.Style:=[fsUnderline];
  PageControl1.TabIndex:=(Sender as TSpeedButton).Tag;
end;

procedure TForm8.Label37Click(Sender: TObject);
begin
  CheckBox7.Checked:=not(CheckBox7.Checked);
end;

procedure TForm8.UnUnderLine;
begin
  SpeedButton3.Font.Style:=[];
  SpeedButton6.Font.Style:=[];
  SpeedButton7.Font.Style:=[];
  SpeedButton8.Font.Style:=[];
  SpeedButton9.Font.Style:=[];
  SpeedButton10.Font.Style:=[];
end;

procedure TForm8.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
      begin
        Label8.Enabled:=True;
        Label9.Enabled:=True;
        Label10.Enabled:=True;
        RadioButton1.Enabled:=True;
        RadioButton2.Enabled:=True;
        RadioButton3.Enabled:=True;
        Label21.Enabled:=True;
        CheckBox4.Enabled:=True;
        Label11.Enabled:=True;
        Label12.Enabled:=True;
        Label39.Enabled:=True;
        RadioButton6.Enabled:=True;
        CalcBackupDate;
      end
    else
      begin
        Label8.Enabled:=False;
        Label9.Enabled:=False;
        Label10.Enabled:=False;
        RadioButton1.Enabled:=False;
        RadioButton2.Enabled:=False;
        RadioButton3.Enabled:=False;
        Label21.Enabled:=False;
        CheckBox4.Enabled:=False;
        Label11.Enabled:=False;
        Label12.Enabled:=False;
        Label39.Enabled:=False;
        RadioButton6.Enabled:=False;
      end;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
  ColorApply(Form8);
end;

procedure TForm8.CalcBackupDate;
begin
  if RadioButton1.Checked then Label12.Caption:=DateToStr(IncDay(Date,1));
  if RadioButton2.Checked then Label12.Caption:=DateToStr(IncWeek(Date,1));
  if RadioButton3.Checked then Label12.Caption:=DateToStr(IncMonth(Date,1));
  if RadioButton6.Checked then Label12.Caption:='на выходе из программы';
end;

procedure TForm8.RadioButton3Click(Sender: TObject);
begin
  CalcBackupDate;
end;

procedure TForm8.Label39Click(Sender: TObject);
begin
  RadioButton6.Checked:=True;
end;

procedure TForm8.Label14Click(Sender: TObject);
begin
  CheckBox3.Checked:=not(CheckBox3.Checked);
end;

procedure TForm8.Label37MouseLeave(Sender: TObject);
begin
  UnDescribeIt;
end;

procedure TForm8.DescribeIt(Sender: TObject);
begin
  if Sender=Label37 then Label40.Caption:='При запуске программы ставит глобальный фильтр на базу данных по текущему месяцу и году. Полезно отмечать при большом объеме базы данных.';
  if Sender=Label38 then Label40.Caption:='Всюду при упоминании денежной единицы будет стоять прописанная здесь Вами денежная единица.';
  if Sender=Label13 then Label40.Caption:='Сжимает базу данных на выходе из программы. Несущественно замедляет выход из программы. Рекомендуется отмечать при больших объемах работы с программой за один запуск.';
  if Sender=Label19 then Label40.Caption:='При сворачивании программы, сворачивает ее в system tray (в значок рядом с часами). Опция на любителя.';
  if Sender=Label14 then Label40.Caption:='Выделяет другим цветом отремонтированные устройства, которые долго не забирает заказчик. Сильно замедляет работу программы в разделе "отремонтированные".';
  if Sender=Label5 then Label40.Caption:='Рабочее местоположение базы данных. По умолчанию - база в папке, куда установлена программу. Можно использовать сетевое расположение базы данных для работы на нескольких компьютерах.';
  Label40.Enabled:=True;
end;

procedure TForm8.UnDescribeIt;
begin
  Label40.Caption:='для получения краткого описания настройки, подведите курсор мышки к рассматриваемому пункту...';
  Label40.Enabled:=False;
end;

procedure TForm8.Label37MouseEnter(Sender: TObject);
begin
  DescribeIt(Sender);
end;

end.
