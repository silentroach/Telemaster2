// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Изменение информации о клиенте
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit ChangeClientInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, Addition, ADODB, ComCtrls;

type
  TForm28 = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label5: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    ClientId: integer;
    Adding: boolean;
    procedure AddTheClient;
  end;

var
  Form28: TForm28;

implementation

{$R *.dfm}

procedure TForm28.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm28.SpeedButton1Click(Sender: TObject);
begin
  if Edit1.Text='' then
    begin
      ShowInfoMessage('А кто же будет заполнять Ф.И.О. клиента?','Данные клиента',true);
      Exit;
    end;
  if Adding then AddTheClient;
// -------------------
  FieldEdit(DataSource1,'Name',Edit1.Text);
  FieldEdit(DataSource1,'Address',Edit2.Text);
  FieldEdit(DataSource1,'PhoneH',Edit3.Text);
  FieldEdit(DataSource1,'PhoneW',Edit4.Text);
  if RadioButton1.Checked then
    begin
      FieldEdit(DataSource1,'TooBad',false);
      FieldEdit(DataSource1,'TooGood',false);
    end;
  if RadioButton2.Checked then
    begin
      FieldEdit(DataSource1,'TooBad',false);
      FieldEdit(DataSource1,'TooGood',true);
    end;
  if RadioButton3.Checked then
    begin
      FieldEdit(DataSource1,'TooBad',true);
      FieldEdit(DataSource1,'TooGood',false);
    end;
  SpeedButton3Click(Self);
end;

procedure TForm28.FormShow(Sender: TObject);
begin
  if Adding then Exit;
  ConnectSQL(ADOQuery1,'Select * from Clients Where Id='+IntToStr(ClientId)+';');
  Edit1.Text:=DataSource1.DataSet.FieldValues['Name'];
  Edit2.Text:=DataSource1.DataSet.FieldValues['Address'];
  Edit3.Text:=DataSource1.DataSet.FieldValues['PhoneH'];
  Edit4.Text:=DataSource1.DataSet.FieldValues['PhoneW'];
  RadioButton1.Checked:=True;
  if DataSource1.DataSet.FieldValues['TooBad'] then RadioButton3.Checked:=True;
  if DataSource1.DataSet.FieldValues['TooGood'] then RadioButton2.Checked:=true;
end;

procedure TForm28.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOQuery1.Active:=False;
end;

procedure TForm28.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TForm28.FormCreate(Sender: TObject);
begin
  Adding:=false;
  ColorApply(Form28);
end;

procedure TForm28.AddTheClient;
var TooBad: boolean;
    TooGood: boolean;
begin                                        // добавление клиента в базу данных
  ConnectSQL(ADOQuery1,'Select * from Clients');
  if RadioButton2.Checked then TooGood:=true else TooGood:=false;
  if RadioButton3.Checked then TooBad:=true else TooBad:=false;
  ADOQuery1.AppendRecord([
              nil,
              Edit1.Text,                    // ФИО клиента
              Edit2.Text,                    // адрес клиента
              Edit3.Text,                    // домашний адрес
              Edit4.Text,                    // рабочий адрес
              TooBad,                        // белый список
              TooGood]);                     // черный список

  SpeedButton3Click(Self);
end;

end.
