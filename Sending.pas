// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Выдача отремонтированного аппарата клиенту
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit Sending;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DateUtils, DB, ADODB, Addition,
  jpeg;

type
  TForm20 = class(TForm)
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Shape4: TShape;
    Label18: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    Shape3: TShape;
    Shape1: TShape;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label11: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    GuarantyDate: TDate;
    procedure GetConnected(SQLString: string);
  public
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

uses MainWindow;

{$R *.dfm}

procedure TForm20.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm20.Edit1Exit(Sender: TObject);
var TryInteger: integer;
begin
  if (TryStrToInt(Edit1.Text,TryInteger)=false) or (Edit1.Text='') then
    Edit1.Text:='0';
end;

procedure TForm20.Edit1Change(Sender: TObject);
var TryInteger: integer;
begin
  if not((TryStrToInt(Edit1.Text,TryInteger)=false) or (Edit1.Text='')) then
    if StrToInt(Edit1.Text)=0 then
        begin
          Label6.Caption:='без гарантии';
          GuarantyDate:=DateTimePicker1.Date;
        end
      else
        begin
          GuarantyDate:=IncMonth(DateTimePicker1.Date,StrToInt(Edit1.Text));
          Label6.Caption:='гарантия до '+DateToStr(GuarantyDate);
        end;
end;

procedure TForm20.FormShow(Sender: TObject);
var DetPrice: real;
    RepairPrice: real;
begin
  Edit1.Text:=IntToStr(MainForm.Config.ReadInteger('Main','LastGuaranted',0));
// --------------
  DateTimePicker1.Date:=Date;
  Edit1Change(Self);
// обновление информации к месту
  Label13.Caption:=DateToStr(MainForm.DataSource3.DataSet.FieldValues['GetDate']);
  Label14.Caption:=MainForm.DataSource3.DataSet.FieldValues['ClientName'];
  Label19.Caption:=MainForm.DataSource3.DataSet.FieldValues['Complection'];
  GetConnected('Select Count(HardwareId) as DetailCount from Details Where HardwareId='+IntToStr(MainForm.DataSource3.DataSet.FieldValues['Id'])+';');
  if DataSource1.DataSet.FieldValues['DetailCount']<>null then
      Label15.Caption:=IntToStr(DataSource1.DataSet.FieldValues['DetailCount'])+' шт.'
    else Label15.Caption:='0 шт.';
  GetConnected('Select Sum(Price) as DetailPrice from Details Where HardwareId='+IntToStr(MainForm.DataSource3.DataSet.FieldValues['Id'])+';');
  if DataSource1.DataSet.FieldValues['DetailPrice']<>null then
      DetPrice:=DataSource1.DataSet.FieldValues['DetailPrice'] else DetPrice:=0;
  Label16.Caption:=FloatToStr(DetPrice)+MainForm.MoneyValue;
  GetConnected('Select * from Repaired Where HardwareId='+IntToStr(MainForm.DataSource3.DataSet.FieldValues['Id'])+';');
  if DataSource1.DataSet.FieldValues['Price']<>null then
      RepairPrice:=DataSource1.DataSet.FieldValues['Price'] else RepairPrice:=0;
  Label18.Caption:=FloatToStr(RepairPrice)+MainForm.MoneyValue;
  Label20.Caption:=FloatToStr(DetPrice+RepairPrice)+MainForm.MoneyValue;
  ADOQuery1.Active:=False;
end;

procedure TForm20.GetConnected(SQLString: string);
begin
  ADOQuery1.Active:=False;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(SQLString);
  ADOQuery1.Active:=True;
end;

procedure TForm20.SpeedButton1Click(Sender: TObject);
begin
  MainForm.Config.WriteInteger('Main','LastGuaranted',StrToInt(Edit1.Text));
//------------------
  GetConnected('Select * from Sended');
  DataSource1.DataSet.AppendRecord([
                          nil,                                                  // Id
                          MainForm.DataSource3.DataSet.FieldValues['Id'],          // HardwareId
                          DateToStr(DateTimePicker1.Date),                      // SendDate
                          DateToStr(GuarantyDate)                               // GuarantyDate
                                  ]);
  ADOQuery1.Active:=False;
  if GuarantyDate<>DateTimePicker1.Date then FieldEdit(MainForm.DataSource3,'Status',3)
                                        else FieldEdit(MainForm.DataSource3,'Status',4);
  if MainForm.DataSource3.DataSet.FieldValues['Attention2']=true then FieldEdit(MainForm.DataSource3,'Attention2',false);
  SpeedButton3Click(Self);
end;

procedure TForm20.FormCreate(Sender: TObject);
begin
  ColorApply(Form20);
end;

end.
