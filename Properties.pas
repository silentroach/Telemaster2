// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Свойства аппарата
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit Properties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, ComCtrls, StdCtrls, ADODB, Addition, DateUtils,

  tlValueTypes;

type
  TForm21 = class(TForm)
    DataSource1: TDataSource;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Edit1: TEdit;
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    ComboBox3: TComboBox;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    MainQuery: TADOQuery;
    DataSource2: TDataSource;
    Edit8: TEdit;
    DataSource3: TDataSource;
    Memo1: TMemo;
    Label14: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Label15: TLabel;
    Label18: TLabel;
    TabSheet3: TTabSheet;
    CheckBox1: TCheckBox;
    Edit11: TEdit;
    Edit12: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DateTimePicker3: TDateTimePicker;
    Edit13: TEdit;
    TabSheet4: TTabSheet;
    Edit7: TEdit;
    Label9: TLabel;
    Edit5: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Label10: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Memo2: TMemo;
    Edit17: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    Edit18: TEdit;
    Label28: TLabel;
    Edit19: TEdit;
    Label29: TLabel;
    procedure SpeedButton3Click(Sender: TObject);
    procedure Label13MouseEnter(Sender: TObject);
    procedure Label13MouseLeave(Sender: TObject);
    procedure Label16MouseEnter(Sender: TObject);
    procedure Label16MouseLeave(Sender: TObject);
    procedure Label17MouseEnter(Sender: TObject);
    procedure Label17MouseLeave(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure FillCombos;
  public
    { Public declarations }
  end;

var
  Form21: TForm21;

implementation

uses MainWindow;

{$R *.dfm}

procedure TForm21.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm21.FillCombos;
var i: integer;
  Sum: Currency;
begin
  ComboBox3.Items.Add('не определен');
// ------------ мастера
  ConnectSQL(MainQuery,'Select *, (LastName+" "+Left(FirstName,1)+"."+Left(FatherName,1)+".") as Name from Users order by (LastName+" "+FirstName+" "+FatherName);');
  for i:=1 to DataSource2.DataSet.RecordCount do
    begin
      DataSource2.DataSet.RecNo:=i;
      ComboBox3.Items.Add(DataSource2.DataSet.FieldValues['Name']);
    end;
  // ищем нужного в comb'е
  if DataSource1.DataSet.FieldValues['MasterId']=0 then ComboBox3.ItemIndex:=0
                                                   else
    begin
      DataSource2.DataSet.Locate('Id',DataSource1.DataSet.FieldValues['MasterId'],[]);
      FindListValue(DataSource2.DataSet.FieldValues['Name'],ComboBox3);
    end;
  MainForm.SetProgressValue(25,'');
// ------------- типы устройств
  ConnectSQL(MainQuery,'Select * from Types Order by Name asc;');
  for i:=1 to DataSource2.DataSet.RecordCount do
    begin
      DataSource2.DataSet.RecNo:=i;
      ComboBox1.Items.Add(DataSource2.DataSet.FieldValues['Name']);
    end;
  FindListValue(MainForm.GetValue(vtHType),ComboBox1);
  MainForm.SetProgressValue(50,'');
// ------------- фирмы
  ConnectSQL(MainQuery,'Select * from Firms Order by Name asc;');
  for i:=1 to DataSource2.DataSet.RecordCount do
    begin
      DataSource2.DataSet.RecNo:=i;
      ComboBox2.Items.Add(DataSource2.DataSet.FieldValues['Name']);
    end;
  FindListValue(MainForm.GetValue(vtHFirm),ComboBox2);
  MainForm.SetProgressValue(75,'');
// -------------- заполнение остального
  if DataSource1.DataSet.FieldValues['DocNum']=null then Edit19.Text:='не задан'
    else
      Edit19.Text:=IntToStr(DataSource1.DataSet.FieldValues['DocNum']);
  DateTimePicker1.Date:=StrToDate(MainForm.GetValue(vtGetDate));
  Edit2.Text:=MainForm.GetValue(vtHModel);
  Edit3.Text:=MainForm.GetValue(vtHNumber);
  if DataSource1.DataSet.FieldValues['Diagnose']<>null then
        Edit8.Text:=DataSource1.DataSet.FieldValues['Diagnose'];
// инфо о клиенте
  Edit4.Text:=MainForm.GetValue(vtCName);
  Edit5.Text:=MainForm.GetValue(vtCAddress);
  Edit6.Text:=MainForm.GetValue(vtCPhoneH);
  Edit7.Text:=MainForm.GetValue(vtCPhoneW);
  Edit17.Text:=MainForm.GetValue(vtHComplection);
  case StrToInt(MainForm.GetValue(vtCStatus)) of
    0: Edit18.Text:='обычный клиент';
    1: Edit18.Text:='в черном списке';
    2: Edit18.Text:='в белом списке';
  end;
  if MainForm.DataSource3.DataSet.FieldValues['MemoField']<>null then
    Memo2.Text:=MainForm.DataSource3.DataSet.FieldValues['MemoField'];

  MainForm.SetProgressValue(100,'');
// детали
  ConnectSQL(MainForm.SmallNeedsQuery,'Select * from Details Where HardwareId='+IntToStr(DataSource1.DataSet.FieldValues['Id'])+';');
  Sum:=0;
  for i:=1 to DataSource3.DataSet.RecordCount do
    begin
      DataSource3.DataSet.RecNo:=i;
      Memo1.Lines.Add(IntToStr(i)+'. '+DataSource3.DataSet.FieldValues['Name']+' ('+FloatToStr(DataSource3.DataSet.FieldValues['Price'])+MainForm.MoneyValue+')');
      Sum:=Sum+DataSource3.DataSet.FieldValues['Price'];
    end;
  Edit9.Text:=IntToStr(DataSource3.DataSet.RecordCount)+' шт.';
  Edit10.Text:=FloatToStr(Sum)+MainForm.MoneyValue;

  CheckBox1.Checked:=MainForm.DataSource3.DataSet.FieldValues['Attention1'];
// -------------
  if MainForm.DataSource3.DataSet.FieldValues['Status']<>1 then
      begin
        ConnectSQL(MainQuery,'Select * from Repaired Where HardwareId='+MainForm.GetValue(vtId)+';');
        if DataSource2.DataSet.FieldValues['Diagnose']<>null then
          Edit11.Text:=DataSource2.DataSet.FieldValues['Diagnose'];
        if DataSource2.DataSet.FieldValues['Price']<>null then
            Edit12.Text:=FloatToStr(DataSource2.DataSet.FieldValues['Price'])
          else Edit12.Text:='0';
        MainQuery.Active:=False;
      end
    else
      begin
        Edit11.Enabled:=False;
        Label19.Enabled:=False;
        Edit12.Enabled:=False;
        Label20.Enabled:=False;
      end;
// -------------
  if MainForm.DataSource3.DataSet.FieldValues['Status']>2 then
      begin
        DateTimePicker3.Date:=StrToDate(MainForm.GetValue(vtSendDate));
        if MainForm.GetValue(vtGuarantyOn)='0 мес.' then Edit14.Text:='отсутствует или закончилась'
                                                 else Edit14.Text:='присутствует';
        Edit15.Text:=MainForm.GetValue(vtGuarantyOn);
        Edit13.Text:=MainForm.GetValue(vtGuarantyUntil);
        if StrToDate(Edit13.Text)<Date then Edit16.Text:='кончилась' else
          Edit16.Text:=IntToStr(DaysBetween(Date,StrToDate(Edit13.Text)))+' дней';
      end
    else
      begin
        DateTimePicker3.Enabled:=False;
        Label21.Enabled:=False;
        Edit14.Enabled:=False;           Label22.Enabled:=False;
        Edit15.Enabled:=False;           Label23.Enabled:=False;
        Edit13.Enabled:=False;           Label24.Enabled:=False;
        Edit16.Enabled:=False;           Label25.Enabled:=False;
      end;
// -------------
  MainForm.SetProgressValue(0,'');
end;

procedure TForm21.Label13MouseEnter(Sender: TObject);
begin
  Label13.Font.Style:=Label13.Font.Style+[fsUnderline];
end;

procedure TForm21.Label13MouseLeave(Sender: TObject);
begin
  Label13.Font.Style:=Label13.Font.Style-[fsUnderline];
end;

procedure TForm21.Label16MouseEnter(Sender: TObject);
begin
  Label16.Font.Style:=Label16.Font.Style+[fsUnderline];
end;

procedure TForm21.Label16MouseLeave(Sender: TObject);
begin
  Label16.Font.Style:=Label16.Font.Style-[fsUnderline];
end;

procedure TForm21.Label17MouseEnter(Sender: TObject);
begin
  Label17.Font.Style:=Label17.Font.Style+[fsUnderline];
end;

procedure TForm21.Label17MouseLeave(Sender: TObject);
begin
  Label17.Font.Style:=Label17.Font.Style-[fsUnderline];
end;

procedure TForm21.Label13Click(Sender: TObject);
begin
  MainForm.N10Click(Self);
end;

procedure TForm21.Label16Click(Sender: TObject);
begin
  MainForm.N69Click(Self);
end;

procedure TForm21.Label17Click(Sender: TObject);
begin
  MainForm.N68Click(Self);
end;

procedure TForm21.FormCreate(Sender: TObject);
begin
  ColorApply(Form21);

  FillCombos;
  case MainForm.Configuration.VisionStatus of
    1: Edit1.Text:='находится в ремонте';
    2: Edit1.Text:='отремонтирован';
    3: Edit1.Text:='выдан и находится на гарантии';
    4: Edit1.Text:='находится в архиве';
    5: Edit1.Text:='удален и находится в корзине';
  end;
  Form21.Caption:=Form21.Caption+' (заказ №'+MainForm.GetValue(vtId)+')';
end;

procedure TForm21.SpeedButton1Click(Sender: TObject);
var Previous: integer;
begin
  if MainForm.Configuration.UserType=3 then
    begin
      ShowInfoMessage('У Вас отсутствуют права на использование данной функции!','Ошибка',true);
      Exit;
    end;

// ------------------ мастер
  ConnectSQL(MainQuery,'Select *, (LastName+" "+Left(FirstName,1)+"."+Left(FatherName,1)+".") as Name from Users order by (LastName+" "+FirstName+" "+FatherName);');
  DataSource2.DataSet.Locate('Name',ComboBox3.Items.Strings[ComboBox3.ItemIndex],[]);
  if ComboBox3.ItemIndex=0 then FieldEdit(DataSource1,'MasterId',0)
                           else FieldEdit(DataSource1,'MasterId',DataSource2.DataSet.FieldValues['Id']);
// ------------------ дата принятия
  FieldEdit(DataSource1,'GetDate',DateToStr(DateTimePicker1.Date));
// ------------------ тип устройства
  ConnectSQL(MainQuery,'Select * from Types Where Name="'+ComboBox1.Items.Strings[ComboBox1.ItemIndex]+'";');
  FieldEdit(DataSource1,'Type',DataSource2.DataSet.FieldValues['Id']);
// ------------------ фирма-производитель
  ConnectSQL(MainQuery,'Select * from Firms Where Name="'+ComboBox2.Items.strings[ComboBox2.ItemIndex]+'";');
  FieldEdit(DataSource1,'Firm',DataSource2.DataSet.FieldValues['Id']);
// ------------------ модель & зав.номер & срочный ремонт
  FieldEdit(DataSource1,'Model',Edit2.Text);
  FieldEdit(DataSource1,'Number',Edit3.Text);
  FieldEdit(DataSource1,'Attention1',CheckBox1.Checked);
// примечание
  FieldEdit(DataSource1,'MemoField',Memo2.Text);
// ------------------ предварительный диагноз
  FieldEdit(DataSource1,'Diagnose',Edit8.Text);
// ------------------ найденная неисправность
  if Edit11.Enabled=true then
    begin
      ConnectSQL(MainQuery,'Select * from Repaired Where HardwareId='+MainForm.GetValue(vtId)+';');
      FieldEdit(DataSource2,'Diagnose',Edit11.Text);
      FieldEdit(DataSource2,'Price',StrToFloat(Edit12.Text));
    end;
// ------------------ дата выдачи
  if DateTimePicker3.Enabled=true then
    begin
      ConnectSQL(MainQuery,'Select * from Sended Where HardwareId='+MainForm.GetValue(vtId)+';');
      FieldEdit(DataSource2,'SendDate',DateToStr(DateTimePicker3.Date));
    end;
// ------------------
  MainQuery.Active:=False;
  Close;

  Previous:=StrToInt(MainForm.GetValue(vtId));
  MainForm.Sorting;
  MainForm.DataSource3.DataSet.Locate('Id',Previous,[]);
end;

end.
