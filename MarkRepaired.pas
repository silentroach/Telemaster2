// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Пометка аппарата как отремонтированного
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit MarkRepaired;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, ADODB, DateUtils, ComCtrls, StrUtils,
  Addition,

  tlValueTypes;

type
  TForm19 = class(TForm)
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Edit2: TEdit;
    Label5: TLabel;
    Label13: TLabel;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    Label1: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    Label4: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label3: TLabel;
    Shape3: TShape;
    Bevel1: TBevel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Label13MouseEnter(Sender: TObject);
    procedure Label13MouseLeave(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

uses MainWindow;

{$R *.dfm}

procedure TForm19.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date:=Date;
// денежная единица
  Label5.Caption:=MainForm.MoneyValue;
// заполнение полей с информацией
  Label9.Caption:=IntToStr(DaysBetween(Date, MainForm.DataSource3.DataSet.FieldValues['GetDate']))+' дн.';
  // -------
  ConnectSQL(ADOQuery1,'Select Count(Id) as DetCount from Details Where HardWareId='+IntToStr(MainForm.DataSource3.DataSet.FieldValues['Id'])+';');
  if DataSource1.DataSet.FieldValues['DetCount']<>null then
      Label10.Caption:=IntToStr(DataSource1.DataSet.FieldValues['DetCount'])+' шт.'
    else Label10.Caption:='0 шт.';
  // -------
  ConnectSQL(ADOQuery1,'Select Sum(Price) as DetPrice from Details Where HardWareId='+IntToStr(MainForm.DataSource3.DataSet.FieldValues['Id'])+';');
  if DataSource1.DataSet.FieldValues['DetPrice']<>null then
      Label11.Caption:=FloatToStr(DataSource1.DataSet.FieldValues['DetPrice'])+' '+Label5.Caption
    else Label11.Caption:='0 '+Label5.Caption;
// -----------------------------------------------------------------------------
  ConnectSQL(ADOQuery1,'Select * from Prices Where CategoryId='+MainForm.GetValue(vtHCategory)+' and TypeId='+MainForm.GetValue(vtHTypeId)+';');
  if DataSource1.DataSet.RecordCount=0 then Edit1.Text:='0'
    else Edit1.Text:=FloatToStr(DataSource1.DataSet.FieldValues['Price']);
// ------------------------
  if MainForm.DataSource3.DataSet.FieldValues['Attention2']=true then
    begin
      Edit1.Text:='0';
      Edit1.Enabled:=False;
    end;
  ADOQuery1.Active:=False;
end;

procedure TForm19.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm19.SpeedButton1Click(Sender: TObject);
var TryInteger: double;
begin
  if (Edit1.Text='') or (TryStrToFloat(Edit1.Text,TryInteger)=false) then
    begin
      ShowInfoMessage('У вас не введена цена за ремонт, либо число введено неверно','Внимание',true);
      Exit;
    end;
  ConnectSQL(ADOQuery2,'Select * from Repaired Where HardWareId='+IntToStr(MainForm.DataSource3.DataSet.FieldValues['Id'])+';');
  DataSource2.DataSet.AppendRecord([
                        nil,                                                    // Id
                        MainForm.DataSource3.DataSet.FieldValues['Id'],            // HardwareId
                        DateToStr(DateTimePicker1.Date),                        // RepairDate
                        StrToFloat(Edit1.Text),                                 // Price
                        Edit2.Text                                              // Diagnose
                                  ]);
  ADOQuery2.Active:=False;
  FieldEdit(MainForm.DataSource3,'Status',2);
  SpeedButton3Click(Self);
end;

procedure TForm19.Label13MouseEnter(Sender: TObject);
begin
  Label13.Font.Style:=Label13.Font.Style+[fsUnderline];
end;

procedure TForm19.Label13MouseLeave(Sender: TObject);
begin
  Label13.Font.Style:=Label13.Font.Style-[fsUnderline];
end;

procedure TForm19.Label13Click(Sender: TObject);
begin
  DateTimePicker1.Date:=Date;
end;

procedure TForm19.DateTimePicker1Change(Sender: TObject);
begin
  Label9.Caption:=IntToStr(DaysBetween(DateTimePicker1.Date,MainForm.DataSource3.DataSet.FieldValues['GetDate']))+' дн.';
end;

procedure TForm19.FormActivate(Sender: TObject);
begin
  DateTimePicker1.SetFocus;
  if Edit1.Enabled then Edit1.SetFocus;
end;

procedure TForm19.FormCreate(Sender: TObject);
begin
  ColorApply(Form19);
end;

end.
