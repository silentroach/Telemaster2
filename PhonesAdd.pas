// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Добавление абонента в телефонную книжку
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit PhonesAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ADODB, DB, ComCtrls, Addition;

type
  TForm17 = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Edit7: TEdit;
    Edit6: TEdit;
    Edit5: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Edit2: TEdit;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}

procedure TForm17.SpeedButton2Click(Sender: TObject);
begin
  ADOQuery1.Active:=false;
  Close;
end;

procedure TForm17.FormShow(Sender: TObject);
var i: integer;
begin
  ADOQuery1.Active:=False;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('Select * from PhoneTabs Order by Name;');
  ADOQuery1.Active:=True;
  for i:=1 to DataSource2.DataSet.RecordCount do
    begin
      DataSource2.DataSet.RecNo:=i;
      ComboBox1.Items.Add(DataSource2.DataSet.FieldValues['Name']);
    end;
  if DataSource2.DataSet.RecordCount>0 then
    ComboBox1.ItemIndex:=0;
end;

procedure TForm17.SpeedButton1Click(Sender: TObject);
var success: boolean;
begin
  success:=true;
  if Edit1.Text='' then
    begin
      Label1.Font.Color:=clRed;
      Success:=false;
    end;
  if Edit3.Text='' then
    begin
      Label3.Font.Color:=clRed;
      Success:=false;
    end;
  if Success=false then
    begin
      ShowInfoMessage('Вы не заполнили обязательные поля!','Внимание',true);
      Exit;
    end;
  DataSource2.DataSet.Locate('Name',ComboBox1.Items.Strings[ComboBox1.ItemIndex],[]);
  ADOTable1.Active:=True;
  DataSource1.DataSet.AppendRecord([
                      nil,                                            // счетчик
                      DataSource2.DataSet.FieldValues['Id'],         // закладка
                      Edit1.Text,                                   // абонент
                      Edit2.Text,                                  // адрес
                      Edit3.Text,                                 // телефон 1
                      Edit4.Text,                                // телефон 2
                      Edit5.Text,                               // e-mail
                      Edit6.Text,                              // site
                      Edit7.Text                              // memo
                                  ]);
  ADOTable1.Active:=False;
  SpeedButton2Click(Self);
end;

procedure TForm17.FormActivate(Sender: TObject);
begin
  ComboBox1.SetFocus;
end;

procedure TForm17.FormCreate(Sender: TObject);
begin
  ColorApply(Form17);
end;

end.
