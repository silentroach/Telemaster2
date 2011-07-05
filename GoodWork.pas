// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Статистика
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit GoodWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, DB, ADODB, Addition;

type
  TForm29 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    SpeedButton4: TSpeedButton;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    Shape1: TShape;
    Label1: TLabel;
    Shape2: TShape;
    Label2: TLabel;
    Label28: TLabel;
    Image1: TImage;
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form29: TForm29;

implementation

uses MainWindow;

{$R *.dfm}

procedure TForm29.SpeedButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm29.FormActivate(Sender: TObject);
var i: integer;
  sum: integer;
begin
  Application.ProcessMessages;
  ConnectSQL(ADOQuery1,'Select Count(Id) as ItemCount from MainTable;');
  Label16.Caption:=IntToStr(DataSource1.DataSet.FieldValues['ItemCount']);
// ---------------
  Application.ProcessMessages;
  ConnectSQL(ADOQuery1,'Select Count(Id) as ItemCount from MainTable Where Status=1;');
  Label17.Caption:=IntToStr(DataSource1.DataSet.FieldValues['ItemCount']);
// ---------------
  Application.ProcessMessages;
  ConnectSQL(ADOQuery1,'Select Count(Id) as ItemCount from MainTable Where Status=2;');
  Label18.Caption:=IntToStr(DataSource1.DataSet.FieldValues['ItemCount']);
// ---------------
  Application.ProcessMessages;
  ConnectSQL(ADOQuery1,'Select Count(Id) as ItemCount from MainTable Where Status=3;');
  Label19.Caption:=IntToStr(DataSource1.DataSet.FieldValues['ItemCount']);
// ---------------
  Application.ProcessMessages;
  ConnectSQL(ADOQuery1,'Select Count(Id) as ItemCount from MainTable Where Status=4;');
  Label20.Caption:=IntToStr(DataSource1.DataSet.FieldValues['ItemCount']);
// ---------------
  Application.ProcessMessages;
  ConnectSQL(ADOQuery1,'Select Count(Id) as ItemCount from MainTable Where Status=5;');
  Label21.Caption:=IntToStr(DataSource1.DataSet.FieldValues['ItemCount']);
// ---------------
  Application.ProcessMessages;
  ConnectSQL(ADOQuery1,'Select Count(Id) as ItemCount from Users;');
  Label28.Caption:=IntToStr(DataSource1.DataSet.FieldValues['ItemCount']);
// ---------------
  Application.ProcessMessages;
  ConnectSQL(ADOQuery1,'Select Count(Id) as ItemCount from Types;');
  Label22.Caption:=IntToStr(DataSource1.DataSet.FieldValues['ItemCount']);
// ---------------
  Application.ProcessMessages;
  Sum:=0;
  ConnectSQL(ADOQuery1,'Select Id from Types;');
  for i:=1 to DataSource1.DataSet.RecordCount do
    begin
      DataSource1.DataSet.RecNo:=i;
      ConnectSQL(ADOQuery2,'Select Count(Type) as ItemCount from MainTable Where Type='+IntToStr(DataSource1.DataSet.FieldValues['Id'])+';');
      if DataSource2.DataSet.FieldValues['ItemCount']>0 then inc(sum);
    end;
  Label23.Caption:=IntToStr(sum);
// ---------------
  Label24.Caption:=IntToStr(StrToInt(Label22.Caption)-sum);
// ---------------
  Application.ProcessMessages;
  ConnectSQL(ADOQuery1,'Select Count(Id) as ItemCount from Firms;');
  Label25.Caption:=IntToStr(DataSource1.DataSet.FieldValues['ItemCount']);
// ---------------
  Application.ProcessMessages;
  Sum:=0;
  ConnectSQL(ADOQuery1,'Select Id from Firms;');
  for i:=1 to DataSource1.DataSet.RecordCount do
    begin
      DataSource1.DataSet.RecNo:=i;
      ConnectSQL(ADOQuery2,'Select Count(Firm) as ItemCount from MainTable Where Firm='+IntToStr(DataSource1.DataSet.FieldValues['Id'])+';');
      if DataSource2.DataSet.FieldValues['ItemCount']>0 then inc(sum);
    end;
  Label26.Caption:=IntToStr(sum);
// ---------------
  Label27.Caption:=IntToStr(StrToInt(Label25.Caption)-sum);
// ---------------
  if ADOQuery1.Active then ADOQuery1.Active:=False;
  if ADOQuery2.Active then ADOQuery2.Active:=False;
end;

end.
