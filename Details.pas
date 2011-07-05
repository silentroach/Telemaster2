// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Детали на ремонт устройства
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit Details;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Addition,
  Dialogs, DB, ADODB, Buttons, StdCtrls, Grids, VolDBGrid, ExtCtrls, StrUtils,
  ComCtrls;

type
  TForm13 = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    SpeedButton3: TSpeedButton;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    VolgaDBGrid1: TVolgaDBGrid;
    ScrollBar1: TScrollBar;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Bevel1: TBevel;
    procedure SpeedButton3Click(Sender: TObject);
    procedure Label4MouseEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VolgaDBGrid1TitleClick(Sender: TObject;
      Column: TVolgaColumn);
    procedure VolgaDBGrid1DrawCellAttr(Sender: TObject;
      Column: TVolgaColumn; AFont: TFont; var AColor: TColor;
      State: TGridDrawState);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure VolgaDBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    SortColumn: 0..1;
    SortType: TVolgaSortMark;
    procedure Sorting;
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses AddEditDetails, MainWindow;

{$R *.dfm}

procedure TForm13.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm13.Label4MouseEnter(Sender: TObject);
begin
  Label4.Hint:=SumToString(LeftStr(Label4.Caption,Length(Label4.Caption)-5),MainForm.MoneyValue);
end;

procedure TForm13.Sorting;
begin                                                              // сортировка
  VolgaDBGrid1.Columns[SortColumn].SortMark:=SortType;
// смотрим детали
  ADOQuery1.Active:=False;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('Select * from Details where HardwareId='+IntToStr(MainForm.DataSource3.DataSet.FieldValues['Id'])+
                    ' Order by '+VolgaDBGrid1.Columns[SortColumn].FieldName);
  if SortType=vsmDown then ADOQuery1.SQL.Add('asc')
                      else ADOQuery1.SQL.Add('desc');
  ADOQuery1.Active:=True;
// смотрим итого
  Label2.Caption:=IntToStr(DataSource1.DataSet.RecordCount)+' шт.';
  ADOQuery2.Active:=False;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Add('Select Sum(Price) as SumPrice from Details where HardwareId='+IntToStr(MainForm.DataSource3.DataSet.FieldValues['Id'])+';');
  ADOQuery2.Active:=True;
  if DataSource2.DataSet.FieldValues['SumPrice']<>null then
    Label4.Caption:=FloatToStr(DataSource2.DataSet.FieldValues['SumPrice'])+MainForm.MoneyValue;
  ADOQuery2.Active:=False;
// ScrollBar ApplySize
  ScrollBar1.Min:=1;
  if DataSource1.DataSet.RecordCount>0 then ScrollBar1.Max:=DataSource1.DataSet.RecordCount
                                       else ScrollBar1.Max:=1;
  ScrollBar1.PageSize:=1;
end;

procedure TForm13.FormShow(Sender: TObject);
begin
// инициализация
  SortColumn:=0;
  SortType:=vsmDown;
// сортировка
  Sorting;
end;

procedure TForm13.VolgaDBGrid1TitleClick(Sender: TObject;
  Column: TVolgaColumn);
begin
  if Column.Index<>SortColumn then
      begin
        SortColumn:=Column.Index;
        SortType:=vsmDown;
      end
    else if SortType=vsmDown then SortType:=vsmUp
                             else SortType:=vsmDown;
  Sorting;
end;

procedure TForm13.VolgaDBGrid1DrawCellAttr(Sender: TObject;
  Column: TVolgaColumn; AFont: TFont; var AColor: TColor;
  State: TGridDrawState);
begin
  if AColor=VolgaDBGrid1.HighlightColor then
    ScrollBar1.Position:=DataSource1.DataSet.RecNo;
end;

procedure TForm13.ScrollBar1Scroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  if DataSource1.DataSet.RecordCount>0 then
    DataSource1.DataSet.RecNo:=ScrollBar1.Position;
end;

procedure TForm13.VolgaDBGrid1DblClick(Sender: TObject);
begin
  Button3Click(Self);
end;

procedure TForm13.Button1Click(Sender: TObject);
begin
  if MainForm.Configuration.UserType=3 then
    begin
      ShowInfoMessage('У Вас отсутствуют права на использование данной функции!','Ошибка',true);
      Exit;
    end;

  if ShowQuestionMessage('Вы действительно хотите удалить выбранную деталь?','Внимание')=true then
    DataSource1.DataSet.Delete;
end;

procedure TForm13.Button2Click(Sender: TObject);
begin                             // добавление
  try
    Application.CreateForm(TForm15, Form15);
    Form15.Caption:='Добавление детали';
    Form15.SpeedButton3.Caption:='добавить';
    Form15.ShowModal;
  finally
    Form15.Hide;
    if Form15.ExitResult=True then
      DataSource1.DataSet.AppendRecord([nil,
                                        MainForm.DataSource3.DataSet.FieldValues['Id'],
                                        Form15.Edit1.Text,
                                        StrToFloat(Form15.Edit2.Text)
                                        ]);
    Form15.Free;
    Sorting;
  end;
end;

procedure TForm13.Button3Click(Sender: TObject);
begin                                                               // изменение
  if DataSource1.DataSet.RecordCount>0 then
    try
      Application.CreateForm(TForm15, Form15);
      Form15.Caption:='Изменение детали';
      Form15.SpeedButton3.Caption:='изменить';
      Form15.Edit1.Text:=DataSource1.DataSet.FieldValues['Name'];
      Form15.Edit2.Text:=FloatToStr(DataSource1.DataSet.FieldValues['Price']);
      Form15.ShowModal;
    finally
      Form15.Hide;
      if Form15.ExitResult=true then
        begin
          FieldEdit(DataSource1,'Name',Form15.Edit1.Text);
          FieldEdit(DataSource1,'Price',StrToFloat(Form15.Edit2.Text));
        end;
      Form15.Free;
      Sorting;
    end;
end;

procedure TForm13.FormCreate(Sender: TObject);
begin
  ColorApply(Form13);
end;

end.
