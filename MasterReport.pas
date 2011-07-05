// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Отчет по работе за год организации
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit MasterReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,
  DB, ADODB, Menus, ExtDlgs, Addition, StrUtils, 
  ComCtrls, Series, TeeProcs, Chart, TeEngine, TeePrevi,

  tlValueTypes;

type
  TForm14 = class(TForm)
    SpeedButton2: TSpeedButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ExportPopup: TPopUpMenu;
    bmp1: TMenuItem;
    wmf1: TMenuItem;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    Label13: TLabel;
    Bevel2: TBevel;
    Label2: TLabel;
    Panel1: TPanel;
    RadioButton5: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton3: TRadioButton;
    Shape5: TShape;
    ComboBox1: TComboBox;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    Shape4: TShape;
    ComboBox2: TComboBox;
    Bevel1: TBevel;
    Label1: TLabel;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    Chart1: TChart;
    Series1: THorizBarSeries;
    procedure Label13MouseEnter(Sender: TObject);
    procedure Label13MouseLeave(Sender: TObject);
    procedure Label3MouseEnter(Sender: TObject);
    procedure Label3MouseLeave(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure bmp1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    MasterId: integer;                // номер мастера (0 - по всей организации)
    ReportType: 1..3;                // тип отчета
    YearToReport: integer;          // год деятельности
    procedure ChartDraw;
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

uses MainWindow;

{$R *.dfm}

procedure TForm14.Label13MouseEnter(Sender: TObject);
begin
  Label13.Font.Style:=Label13.Font.Style+[fsUnderline];
end;

procedure TForm14.Label13MouseLeave(Sender: TObject);
begin
  Label13.Font.Style:=Label13.Font.Style-[fsUnderline];
end;

procedure TForm14.Label3MouseEnter(Sender: TObject);
begin
  Label3.Font.Style:=Label3.Font.Style+[fsUnderline];
end;

procedure TForm14.Label3MouseLeave(Sender: TObject);
begin
  Label3.Font.Style:=Label3.Font.Style-[fsUnderline];
end;

procedure TForm14.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm14.FormShow(Sender: TObject);
var i: integer;
begin
  ConnectSQL(ADOQuery1,'Select *, (LastName+" "+Left(FirstName,1)+"."+Left(FatherName,1)+".") as Name from Users Order by (LastName+" "+Left(FirstName,1)+"."+Left(FatherName,1)+".");');
  for i:=1 to DataSource1.DataSet.RecordCount do
    begin
      DataSource1.DataSet.RecNo:=i;
      ComboBox1.Items.Add(DataSource1.DataSet.FieldValues['Name']);
    end;
  if DataSource1.DataSet.RecordCount>0 then ComboBox1.ItemIndex:=0
                                       else ComboBox1.Enabled:=False;
  for i:=StrToInt(MainForm.GetValue(vtMinYear)) to StrToInt(MainForm.GetValue(vtMaxYear)) do
    ComboBox2.Items.Add(IntToStr(i)+' год');
  YearToReport:=StrToInt(MainForm.GetValue(vtMaxYear));
  if ComboBox2.Items.Count>0 then ComboBox2.ItemIndex:=ComboBox2.Items.Count-1;
  ComboBox2Change(Self);
end;

procedure TForm14.Label13Click(Sender: TObject);
begin
  if Label13.Font.Style=[fsUnderline] then Label13.Font.Style:=Label13.Font.Style-[fsUnderline];
  ExportPopup.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TForm14.RadioButton1Click(Sender: TObject);
begin
  if RadioButton1.Checked then
      begin
        ComboBox1.Enabled:=False;
        MasterId:=0;
      end
    else
      begin
        ComboBox1.Enabled:=True;
        DataSource1.DataSet.Locate('Name',ComboBox1.Items.Strings[ComboBox1.ItemIndex],[]);
        MasterId:=DataSource1.DataSet.FieldValues['Id'];
      end;
  ChartDraw;
end;

procedure TForm14.ChartDraw;
var   i: integer;
    sum: integer;
begin                                       // главная часть - рисование графика
  Chart1.Series[0].Clear;
  Sum := 0;
  case ReportType of
    1: begin
         for i:=12 downto 1 do
           begin
             MainForm.SetProgressValue(Round(100/12*(13-i)),'');
             ADOQuery2.Active:=False;
             ADOQuery2.SQL.Clear;
             ADOQuery2.SQL.Add('SELECT Count(MainTable.Status) as RecCount FROM MainTable INNER JOIN Sended ON MainTable.Id = Sended.HardwareId Where');
             if MasterId<>0 then ADOQuery2.SQL.Add('(MainTable.MasterId='+IntToStr(MasterId)+') and ');
             ADOQuery2.SQL.Add('(Month(SendDate)='+IntToStr(i)+') and (Year(SendDate)='+IntToStr(YearToReport)+');');
             ADOQuery2.Active:=True;
             if DataSource2.DataSet.RecordCount=0 then Sum:=0
                                                  else Sum:=DataSource2.DataSet.FieldValues['RecCount'];
             Chart1.Series[0].Add(Sum,MonthName(i),MonthColor(i))
           end;
         ADOQuery2.Active:=False;
         MainForm.SetProgressValue(0,'');
       end;
    2: begin
         for i:=12 downto 1 do
           begin
             MainForm.SetProgressValue(Round(100/12*(13-i)),'');
             ADOQuery2.Active:=False;
             ADOQuery2.SQL.Clear;
             ADOQuery2.SQL.Add('SELECT Sum(Details.Price) AS PriceSumm FROM ((MainTable INNER JOIN Details ON MainTable.Id = Details.HardwareId) INNER JOIN Repaired ON MainTable.Id = Repaired.HardwareId) INNER JOIN Sended ON MainTable.Id = Sended.HardwareId');
             ADOQuery2.SQL.Add('Where (MainTable.Status>2) and (MainTable.Status<5) and');
             if MasterId<>0 then ADOQuery2.SQL.Add('(MainTable.MasterId='+IntToStr(MasterId)+') and ');
             ADOQuery2.SQL.Add('(Month(SendDate)='+IntToStr(i)+') and (Year(SendDate)='+IntToStr(YearToReport)+');');
             ADOQuery2.Active:=True;
             if DataSource2.DataSet.RecordCount=0 then Sum:=0
                                                  else
               if DataSource2.DataSet.FieldValues['PriceSumm']<>null then Sum:=DataSource2.DataSet.FieldValues['PriceSumm'];
             Chart1.Series[0].Add(Sum,MonthName(i),MonthColor(i))
           end;
         ADOQuery2.Active:=False;
         MainForm.SetProgressValue(0,'');
       end;
    3: begin
         for i:=12 downto 1 do
           begin
             MainForm.SetProgressValue(Round(100/12*(13-i)),'');
             ADOQuery2.Active:=False;
             ADOQuery2.SQL.Clear;
             ADOQuery2.SQL.Add('SELECT Sum(Repaired.Price) AS PriceSumm FROM (MainTable INNER JOIN Repaired ON MainTable.Id = Repaired.HardwareId) INNER JOIN Sended ON MainTable.Id = Sended.HardwareId');
             ADOQuery2.SQL.Add('Where (MainTable.Status>2) and (MainTable.Status<5) and');
             if MasterId<>0 then ADOQuery2.SQL.Add('(MainTable.MasterId='+IntToStr(MasterId)+') and ');
             ADOQuery2.SQL.Add('(Month(SendDate)='+IntToStr(i)+') and (Year(SendDate)='+IntToStr(YearToReport)+');');
             ADOQuery2.Active:=True;
             if DataSource2.DataSet.RecordCount=0 then Sum:=0
                                                  else
               if DataSource2.DataSet.FieldValues['PriceSumm']<>null then Sum:=DataSource2.DataSet.FieldValues['PriceSumm'];
             Chart1.Series[0].Add(Sum,MonthName(i),MonthColor(i))
           end;
         ADOQuery2.Active:=False;
         MainForm.SetProgressValue(0,'');
       end;
  end;
end;

procedure TForm14.FormCreate(Sender: TObject);
begin
  ColorApply(Form14);

  MasterId:=0;
  ReportType:=1;
end;

procedure TForm14.RadioButton3Click(Sender: TObject);
begin
  ReportType:=(Sender as TRadioButton).Tag;
  ChartDraw;
end;

procedure TForm14.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  ADOQuery1.Active:=False;
end;

procedure TForm14.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.enabled=false then Exit;
  DataSource1.DataSet.Locate('Name',ComboBox1.Items.Strings[ComboBox1.ItemIndex],[]);
  MasterId:=DataSource1.DataSet.FieldValues['Id'];
  ChartDraw;
end;

procedure TForm14.bmp1Click(Sender: TObject);
var TypeOf: byte;
    Dialog: TSavePictureDialog;
begin
  Dialog:=TSavePictureDialog.Create(Form14);
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

procedure TForm14.ComboBox2Change(Sender: TObject);
begin
  YearToReport:=StrToInt(LeftStr(ComboBox2.Items.Strings[ComboBox2.ItemIndex],4));
  ChartDraw;
end;

procedure TForm14.Label3Click(Sender: TObject);
begin
  ChartPreview(Application,Chart1);
end;

end.
