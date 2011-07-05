unit Security;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ElXPThemedControl, ElTree, ComCtrls, Buttons, Addition;

type
  TForm35 = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ElTree1: TElTree;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ElTree1DblClick(Sender: TObject);
  private
    procedure Sorting;
  public
    { Public declarations }
  end;

var
  Form35: TForm35;

implementation

uses MainWindow, AddUserSecurity;

{$R *.dfm}

procedure TForm35.SpeedButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm35.Sorting;
var i: integer;
    GroupItem: TElTreeItem;
      NewItem: TElTreeItem;
begin
  ElTree1.Items.Clear;

// -------------------------------------------------------------- администраторы
  GroupItem:=ElTree1.Items.AddItem(nil);
  GroupItem.Tag:=-1;
  GroupItem.Text:='јдминистратор';
  ConnectSQL(ADOQuery1,'Select * from Passwords Where UserType=1;');
  for i:=1 to DataSource1.DataSet.RecordCount do
    begin
      DataSource1.DataSet.RecNo:=i;
      NewItem:=ElTree1.Items.AddItem(GroupItem);
      NewItem.Text:=DataSource1.DataSet.FieldValues['Login'];
      NewItem.Tag:=DataSource1.DataSet.FieldValues['Id'];
      if MainForm.Configuration.UserType=1 then
          NewItem.ColumnText.Add(DataSource1.DataSet.FieldValues['Pass'])
        else NewItem.ColumnText.Add('**********');
    end;
// ------------------------------------------------------------------ начальники
  GroupItem:=ElTree1.Items.AddItem(nil);
  GroupItem.Tag:=-1;
  GroupItem.Text:='Ќачальство';
  ConnectSQL(ADOQuery1,'Select * from Passwords Where UserType=3;');
  for i:=1 to DataSource1.DataSet.RecordCount do
    begin
      DataSource1.DataSet.RecNo:=i;
      NewItem:=ElTree1.Items.AddItem(GroupItem);
      NewItem.Text:=DataSource1.DataSet.FieldValues['Login'];
      NewItem.Tag:=DataSource1.DataSet.FieldValues['Id'];
      if MainForm.Configuration.UserType=1 then
          NewItem.ColumnText.Add(DataSource1.DataSet.FieldValues['Pass'])
        else NewItem.ColumnText.Add('**********');
    end;
// ------------------------------------------------------------------ диспетчеры
  GroupItem:=ElTree1.Items.AddItem(nil);
  GroupItem.Tag:=-1;
  GroupItem.Text:='ƒиспетчеры';
  ConnectSQL(ADOQuery1,'Select * from Passwords Where UserType=2;');
  for i:=1 to DataSource1.DataSet.RecordCount do
    begin
      DataSource1.DataSet.RecNo:=i;
      NewItem:=ElTree1.Items.AddItem(GroupItem);
      NewItem.Text:=DataSource1.DataSet.FieldValues['Login'];
      NewItem.Tag:=DataSource1.DataSet.FieldValues['Id'];
      if MainForm.Configuration.UserType=1 then
          NewItem.ColumnText.Add(DataSource1.DataSet.FieldValues['Pass'])
        else NewItem.ColumnText.Add('**********');         
    end;

  ElTree1.FullExpand;
  ADOQuery1.Active:=False;
end;

procedure TForm35.FormCreate(Sender: TObject);
begin
  Sorting;
end;

procedure TForm35.SpeedButton2Click(Sender: TObject);
begin                                                   // удаление пользовател€
  if ElTree1.Selected=nil then Exit;
  if ElTree1.Selected.Tag=-1 then Exit;
  if ShowQuestionMessage('¬ы действительно хотите удалить пользовател€?','”даление пользовател€') then
    begin
      ConnectSQL(ADOQuery1,'Select * from Passwords');
      DataSource1.DataSet.Locate('Id',ElTree1.Selected.Tag,[]);
      if DataSource1.DataSet.FieldValues['Id']=ElTree1.Selected.Tag then
        DataSource1.DataSet.Delete;
      ADOQuery1.Active:=False;
      Sorting;
    end;
end;

procedure TForm35.SpeedButton3Click(Sender: TObject);
begin                                          // добавление нового пользовател€
  try
    Application.CreateForm(TForm38, Form38);
    Form38.Caption:='добавление пользовател€';
    Form38.Button1.Caption:='добавить';
    Form38.Adding:=True;
    Form38.ShowModal;
  finally
    Form38.Hide;
    Form38.Free;
    Sorting;
  end;
end;

procedure TForm35.SpeedButton1Click(Sender: TObject);
begin                                                // изменение свойств записи
  if ElTree1.Selected=nil then Exit;
  if ElTree1.Selected.Tag=-1 then Exit;

  try
    Application.CreateForm(TForm38, Form38);
    Form38.Caption:='изменение данных пользовател€';
    Form38.Button1.Caption:='изменить';
    Form38.UserId:=ElTree1.Selected.Tag;
    Form38.Adding:=False;
    Form38.ShowModal;
  finally
    Form38.Hide;
    Form38.Free;
    Sorting;
  end;
end;

procedure TForm35.ElTree1DblClick(Sender: TObject);
begin
  SpeedButton1Click(Self);
end;

end.
