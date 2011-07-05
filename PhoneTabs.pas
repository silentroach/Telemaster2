// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Закладки в телефонной книжке
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit PhoneTabs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Buttons, StdCtrls, Grids, VolDBGrid, ExtCtrls, Addition,
  ComCtrls;

type
  TForm16 = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    VolgaDBGrid1: TVolgaDBGrid;
    ScrollBar1: TScrollBar;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure VolgaDBGrid1TitleClick(Sender: TObject;
      Column: TVolgaColumn);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure VolgaDBGrid1DrawCellAttr(Sender: TObject;
      Column: TVolgaColumn; AFont: TFont; var AColor: TColor;
      State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    SortType: TVolgaSortMark;
    procedure Sorting;
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

uses AddEdit, MainWindow;

{$R *.dfm}

procedure TForm16.Sorting;
begin
  VolgaDBGrid1.Columns[0].SortMark:=SortType;
  ADOQuery1.Active:=False;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('Select * from PhoneTabs Order by '+VolgaDBGrid1.Columns[0].FieldName+' ');
  if SortType=vsmDown then ADOQuery1.SQL.Add('asc;')
                      else ADOQuery1.SQL.Add('desc;');
  ADOQuery1.Active:=True;
  ScrollBar1.Min:=1;
  if DataSource1.DataSet.RecordCount>0 then ScrollBar1.Max:=DataSource1.DataSet.RecordCount
                                       else ScrollBar1.Max:=1;
  ScrollBar1.PageSize:=1;
end;

procedure TForm16.FormCreate(Sender: TObject);
begin
  ColorApply(Form16);

  SortType:=vsmDown;
  Sorting;
end;

procedure TForm16.VolgaDBGrid1TitleClick(Sender: TObject;
  Column: TVolgaColumn);
begin
  if SortType=vsmDown then SortType:=vsmUp
                      else SortType:=vsmDown;
  Sorting;
end;

procedure TForm16.ScrollBar1Scroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  DataSource1.DataSet.RecNo:=ScrollPos;
end;

procedure TForm16.VolgaDBGrid1DrawCellAttr(Sender: TObject;
  Column: TVolgaColumn; AFont: TFont; var AColor: TColor;
  State: TGridDrawState);
begin
  if AColor=VolgaDBGrid1.HighlightColor then
    ScrollBar1.Position:=DataSource1.DataSet.RecNo;
end;

procedure TForm16.Button1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TForm11, Form11);
    Form11.ShowForm('Добавление новой закладки','Название закладки','добавить');
  finally
    Form11.Hide;
    if Form11.ExitResult=true then
      begin
        DataSource1.DataSet.AppendRecord([nil,Form11.Edit1.Text]);
        Sorting;
      end;
    Form11.Free;
  end;
end;

procedure TForm16.Button2Click(Sender: TObject);
begin
  if DataSource1.DataSet.RecordCount>0 then
    try
      Application.CreateForm(TForm11, Form11);
      Form11.Edit1.Text:=DataSource1.DataSet.FieldValues['Name'];
      Form11.ShowForm('Изменение названия закладки','Название закладки','изменить');
    finally
      Form11.Hide;
      if Form11.ExitResult=true then
        begin
          FieldEdit(DataSource1,'Name',Form11.Edit1.Text);
          Sorting;
        end;
      Form11.Free;
    end;
end;

procedure TForm16.Button3Click(Sender: TObject);
var success: boolean;
begin
  if DataSource1.DataSet.RecordCount>0 then
    begin
      ConnectSQL(MainForm.SmallNeedsQuery,'Select * from Phones Where TabId='+IntToStr(DataSource1.DataSet.FieldValues['Id'])+';');
      if MainForm.SmallNeedsQuery.RecordCount=0 then success:=true else success:=false;
      if success=false then
        begin
          ShowInfoMessage('В данной закладке уже записаны пользователи.'#13'Сначала удалите их.','Удаление закладки',true);
          Exit;
        end;
      if ShowQuestionMessage('Вы действительно хотите удалить закладку?','Внимание')=true then
        DataSource1.DataSet.Delete;
    end;
  if MainForm.SmallNeedsQuery.Active then MainForm.SmallNeedsQuery.Active:=False;
end;

procedure TForm16.Button4Click(Sender: TObject);
begin
  Close;
end;

end.
