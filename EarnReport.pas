// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Отчет по зарплате
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit EarnReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, TeeProcs, Chart, ExtCtrls, StdCtrls, Buttons,
  DB, ADODB, Addition, StrUtils, DateUtils, Menus, ExtDlgs,
  ComCtrls, TeePrevi,

  tlValueTypes;

type
  TForm30 = class(TForm)
    SpeedButton2: TSpeedButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ExportPopup: TPopUpMenu;
    bmp1: TMenuItem;
    wmf1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    Label13: TLabel;
    Bevel2: TBevel;
    Label2: TLabel;
    RadioButton12: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    ComboBox2: TComboBox;
    Bevel1: TBevel;
    Label1: TLabel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    Chart1: TChart;
    Series1: THorizBarSeries;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Label13MouseEnter(Sender: TObject);
    procedure Label13MouseLeave(Sender: TObject);
    procedure Label3MouseEnter(Sender: TObject);
    procedure Label3MouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure bmp1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    procedure ChartDraw;
    procedure CheckCurrentMonth;
  public
    { Public declarations }
  end;

var
  Form30: TForm30;

implementation

uses MainWindow;

{$R *.dfm}

procedure TForm30.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm30.Label13MouseEnter(Sender: TObject);
begin
  Label13.Font.Style:=Label13.Font.Style+[fsUnderline];
end;

procedure TForm30.Label13MouseLeave(Sender: TObject);
begin
  Label13.Font.Style:=Label13.Font.Style-[fsUnderline];
end;

procedure TForm30.Label3MouseEnter(Sender: TObject);
begin
  Label3.Font.Style:=Label3.Font.Style+[fsUnderline];
end;

procedure TForm30.Label3MouseLeave(Sender: TObject);
begin
  Label3.Font.Style:=Label3.Font.Style-[fsUnderline];
end;

procedure TForm30.ChartDraw;
var     i: integer;
      sum: real;
     Year: integer;
    Month: integer;
begin
  Month:=0;
// -------- год
  Year:=StrToInt(LeftStr(ComboBox2.Items.Strings[ComboBox2.ItemIndex],4));
// -------- месяц
  for i:=Form30.ComponentCount-1 downto 0 do
    if Form30.Components[i] is TRadioButton then
      if (Form30.Components[i] as TRadioButton).Checked=true then
        begin
          Month:=(Form30.Components[i] as TRadioButton).Tag;
          Break;
        end;
// ---------------------
  Chart1.Series[0].Clear;
  ADOQuery1.Active:=True;
  for i:=1 to DataSource1.DataSet.RecordCount do
    begin
      Randomize;
      Sum:=0;
      MainForm.SetProgressValue(Round(100/DataSource1.DataSet.RecordCount*i),'');
      DataSource1.DataSet.RecNo:=i;
      case DataSource1.DataSet.FieldValues['CashType'] of
        1: begin
             sum:=DataSource1.DataSet.FieldValues['CashValue'];
           end;
        2: begin                               
             ConnectSQL(MainForm.SmallNeedsQuery,'SELECT Sum(Repaired.Price) as SumPrice FROM (MainTable INNER JOIN Repaired ON MainTable.Id = Repaired.HardwareId) INNER JOIN Sended ON (Repaired.Id = Sended.HardwareId) Where MainTable.MasterId='+IntToStr(DataSource1.DataSet.FieldValues['Id'])+' and (MainTable.Status>2) and (MainTable.Status<5) and (Month(Sended.SendDate)='+IntToStr(Month)+') and (Year(Sended.SendDate)='+IntToStr(Year)+');');
             if MainForm.SmallNeedsQuery.FieldValues['SumPrice']<>null then
               Sum:=MainForm.SmallNeedsQuery.FieldValues['SumPrice'] else Sum:=0;
             MainForm.SmallNeedsQuery.Active:=False;
             Sum:=Sum/100*DataSource1.DataSet.FieldValues['CashValue'];
           end;
        3: begin
             ConnectSQL(MainForm.SmallNeedsQuery,'SELECT Sum(Repaired.Price) as SumPrice FROM (MainTable INNER JOIN Repaired ON MainTable.Id = Repaired.HardwareId) INNER JOIN Sended ON (Repaired.Id = Sended.HardwareId) Where (MainTable.Status>2) and (MainTable.Status<5) and (Month(Sended.SendDate)='+IntToStr(Month)+') and (Year(Sended.SendDate)='+IntToStr(Year)+');');
             if MainForm.SmallNeedsQuery.FieldValues['SumPrice']<>null then
               Sum:=MainForm.SmallNeedsQuery.FieldValues['SumPrice'] else Sum:=0;
             MainForm.SmallNeedsQuery.Active:=False;
             Sum:=Sum/100*DataSource1.DataSet.FieldValues['CashValue'];
           end;
      end;
      Chart1.Series[0].Add(Sum,DataSource1.DataSet.FieldValues['LastName']+' '+
                               LeftStr(DataSource1.DataSet.FieldValues['FirstName'],1)+'.'+
                               LeftStr(DataSource1.DataSet.FieldValues['FatherName'],1)+'.',Random(65536));
    end;
  ADOQuery1.Active:=False;
  MainForm.SetProgressValue(0,' ');
end;

procedure TForm30.FormShow(Sender: TObject);
var i: integer;
begin
  for i:=StrToInt(MainForm.GetValue(vtMinYear)) to StrToInt(MainForm.GetValue(vtMaxYear)) do
    ComboBox2.Items.Add(IntToStr(i)+' год');
  if ComboBox2.Items.Count>0 then ComboBox2.ItemIndex:=ComboBox2.Items.Count-1;
// -------
  CheckCurrentMonth;
// -------
  ComboBox2Change(Self);
end;

procedure TForm30.ComboBox2Change(Sender: TObject);
begin
  ChartDraw;
end;

procedure TForm30.RadioButton1Click(Sender: TObject);
begin
  ChartDraw;
end;

procedure TForm30.FormCreate(Sender: TObject);
begin
  ColorApply(Form30);

  ADOQuery1.Active:=False;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('Select * from Users Order by LastName+FirstName+FatherName asc;');
end;

procedure TForm30.CheckCurrentMonth;
var i: integer;
begin
  for i:=Form30.ComponentCount-1 downto 0 do
    if Form30.Components[i] is TRadioButton then
      if (Form30.Components[i] as TRadioButton).Tag=MonthOf(Date) then
        begin
          (Form30.Components[i] as TRadioButton).Checked:=True;
          Break;
        end;
end;

procedure TForm30.Label13Click(Sender: TObject);
begin
  if Label13.Font.Style=[fsUnderline] then Label13.Font.Style:=Label13.Font.Style-[fsUnderline];
  ExportPopup.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TForm30.bmp1Click(Sender: TObject);
var TypeOf: byte;
    Dialog: TSavePictureDialog;
begin
  Dialog:=TSavePictureDialog.Create(Self);
  TypeOf:=(Sender as TMenuItem).Tag;
  if TypeOf=1 then
      begin
        Dialog.Filter:='Картинка .bmp|*.bmp';
        Dialog.DefaultExt:='.bmp';
      end
    else
      begin
        Dialog.Filter:='Векторная картинка .wmf|*.wmf';
        Dialog.DefaultExt:='.wmf';
      end;
  if Dialog.Execute then
    case TypeOf of
      1: Chart1.SaveToBitmapFile(Dialog.FileName);
      2: Chart1.SaveToMetafile(Dialog.FileName);
    end;
  Dialog.Free;
end;

procedure TForm30.Label3Click(Sender: TObject);
begin
  ChartPreview(Application,Chart1);
end;

end.
