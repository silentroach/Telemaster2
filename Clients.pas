// -----------------------------------------------------------------------------
//
//    “елемастер v2.0
//    —правочник клиентов
//
//                                            by  алашников »горь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit Clients;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, VolDBGrid, StrUtils, ExtCtrls, StdCtrls, DB, ADODB, Addition,
  Menus, ComCtrls, Buttons;

type
  TForm27 = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    tfXPPopUpMenu1: TPopUpMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Edit1: TEdit;
    VolgaDBGrid1: TVolgaDBGrid;
    ScrollBar1: TScrollBar;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    Button34: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N5: TMenuItem;
    SmallNeedsQuery: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure VolgaDBGrid1TitleClick(Sender: TObject;
      Column: TVolgaColumn);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure VolgaDBGrid1DrawCellAttr(Sender: TObject;
      Column: TVolgaColumn; AFont: TFont; var AColor: TColor;
      State: TGridDrawState);
    procedure Edit1Change(Sender: TObject);
    procedure VolgaDBGrid1DblClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    SortColumn: 0..1;
    SortType: TVolgaSortMark;
    FilterMan: (BlackList, WhiteList, All);
    Filter: string;                                                    // фильтр
    procedure Sorting;
    function BaseClientExists(ClientID: integer): boolean;   // присутствие клиента в базе
  public
    { Public declarations }
  end;

var
  Form27: TForm27;

implementation

uses ChangeClientInfo;

{$R *.dfm}

procedure TForm27.FormCreate(Sender: TObject);
begin
  ColorApply(Form27);

  Filter:='';
  FilterMan:=All;
  SortColumn:=0;
  SortType:=vsmDown;
  Sorting;
end;

procedure TForm27.Sorting;
var st: string;
begin
  VolgaDBGrid1.Columns[SortColumn].SortMark:=SortType;
  Edit1.Text:=Filter;
  st:='Select * from Clients Where (Name like "'+Filter+'%") ';
  if FilterMan<>All then
    begin
      if FilterMan=BlackList then st:=st+'and (TooBad=true) ';
      if FilterMan=WhiteList then st:=st+'and (TooGood=true) ';
    end;
  st:=st+' Order by '+VolgaDBGrid1.Columns[SortColumn].FieldName+' ';
  if SortType=vsmDown then st:=st+'asc'
                      else st:=st+'desc';
  ConnectSQL(ADOQuery1,st);
  ScrollBar1.Min:=1;
  if DataSource1.DataSet.RecordCount>0 then ScrollBar1.Max:=DataSource1.DataSet.RecordCount
                                       else ScrollBar1.Max:=1;
  ScrollBar1.PageSize:=1;  
end;

procedure TForm27.VolgaDBGrid1TitleClick(Sender: TObject;
  Column: TVolgaColumn);
begin
  if SortColumn<>Column.Index then
      begin
        SortColumn:=Column.Index;
        SortType:=vsmDown;
      end
    else
      if SortType=vsmDown then SortType:=vsmUp
                          else SortType:=vsmDown;
  Sorting;
end;

procedure TForm27.N3Click(Sender: TObject);
begin
  FieldEdit(DataSource1,'TooBad',true);
  FieldEdit(DataSource1,'TooGood',false);
end;

procedure TForm27.N4Click(Sender: TObject);
begin
  FieldEdit(DataSource1,'TooBad',false);
  FieldEdit(DataSource1,'TooGood',true);
end;

procedure TForm27.N1Click(Sender: TObject);
begin
  FieldEdit(DataSource1,'TooBad',false);
  FieldEdit(DataSource1,'TooGood',false);
  Sorting;
end;

procedure TForm27.ScrollBar1Change(Sender: TObject);
begin
  if DataSource1.DataSet.RecordCount>0 then
    DataSource1.DataSet.RecNo:=ScrollBar1.Position;
end;

procedure TForm27.VolgaDBGrid1DrawCellAttr(Sender: TObject;
  Column: TVolgaColumn; AFont: TFont; var AColor: TColor;
  State: TGridDrawState);
begin
  if AColor=VolgaDBGrid1.HighlightColor then
      ScrollBar1.Position:=DataSource1.DataSet.RecNo;
end;

procedure TForm27.Edit1Change(Sender: TObject);
begin
  if Length(Edit1.Text)<Length(Filter) then Edit1.Text:=Filter;
  if LeftStr(Edit1.Text,Length(Filter))<>filter then Edit1.Text;
  DataSource1.DataSet.Locate('Name',Edit1.Text,[loCaseInsensitive, loPartialKey]);
  Edit1.SelStart:=Length(Edit1.Text);
end;

procedure TForm27.VolgaDBGrid1DblClick(Sender: TObject);
begin
  N6Click(Self);
end;

procedure TForm27.N6Click(Sender: TObject);
begin                                     // редактирование информации о клиенте
  try
    Application.CreateForm(TForm28, Form28);
    Form28.ClientId:=DataSource1.DataSet.FieldValues['Id'];
    Form28.ShowModal;
  finally
    Form28.Hide;
    Form28.Free;
  end;
end;

procedure TForm27.Button4Click(Sender: TObject);
var NewChar: string;
begin
  NewChar:=(Sender as TButton).Caption;
  if Length(Filter)=0 then Filter:=AnsiUpperCase(NewChar)
                      else Filter:=Filter+AnsiLowerCase(NewChar);
  Sorting;
end;

procedure TForm27.Button31Click(Sender: TObject);
begin
  if Length(filter)>0 then Filter:=LeftStr(Filter,Length(filter)-1);
  Sorting;
end;

procedure TForm27.Button33Click(Sender: TObject);
begin
  if DataSource1.DataSet.RecordCount>0 then
    if Length(DataSource1.DataSet.FieldValues['Name'])>Length(Edit1.Text) then
      begin
        Filter:=Filter+MidStr(DataSource1.DataSet.FieldValues['Name'],Length(Edit1.Text)+1,1);
        Sorting;
      end;
end;

procedure TForm27.Button34Click(Sender: TObject);
begin
  Close;
end;

procedure TForm27.SpeedButton1Click(Sender: TObject);
begin
  Filter:='';
  FilterMan:=WhiteList;
  Sorting;
end;

procedure TForm27.SpeedButton2Click(Sender: TObject);
begin
  Filter:='';
  FilterMan:=All;
  Sorting;
end;

procedure TForm27.SpeedButton3Click(Sender: TObject);
begin
  Filter:='';
  FilterMan:=BlackList;
  Sorting;
end;

function TForm27.BaseClientExists(ClientID: integer): boolean;
begin                      // проверка на существование в базе устройств клиента
  ConnectSQL(SmallNeedsQuery,'Select * from MainTable Where ClientId='+IntToStr(ClientID)+';');
  if SmallNeedsQuery.RecordCount>0 then Result:=true else Result:=false;
  SmallNeedsQuery.Active:=False;
end;

procedure TForm27.N8Click(Sender: TObject);
begin                                         // удаление клиента из справочника
  if BaseClientExists(ADOQuery1.FieldValues['Id']) then
    begin
      ShowInfoMessage(' лиент уже используетс€ в базе данных и удалить его нет возможности','”даление клиента',true);
      Exit;
    end;
  if ShowQuestionMessage('¬ы действительно хотите удалить клиента из справочника?','”даление клиента') then
    begin
      ADOQuery1.Delete;
      Sorting;
    end;
end;

procedure TForm27.N7Click(Sender: TObject);
begin                                                      // добавление клиента
  try
    Application.CreateForm(TForm28, Form28);
    Form28.SpeedButton1.Caption:='добавить';
    Form28.Caption:='ƒобавление клиента в базу данных';
    Form28.Adding:=true;
    Form28.ShowModal;
    Sorting;
  finally
    Form28.Hide;
    Form28.Free;
  end;
end;

end.
