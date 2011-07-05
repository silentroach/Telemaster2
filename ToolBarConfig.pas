// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Конфигурация ToolBar'а программы
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit ToolBarConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ElXPThemedControl, ElTree, StdCtrls, ComCtrls, Buttons, DB,
  ADODB, ElStrUtils, Addition;

type
  TForm32 = class(TForm)
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label1: TLabel;
    SpeedButton6: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ElTree1: TElTree;
    ElTree2: TElTree;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure SwapItems(FirstItem, SecondItem: TElTreeItem);
  public
    { Public declarations }
  end;

var
  Form32: TForm32;

implementation

uses MainWindow;

{$R *.dfm}

procedure TForm32.FormShow(Sender: TObject);
var      i: integer;
   NewItem: TElTreeItem;
  Previous: integer;
begin
  ADOQuery1.Active:=False;
  ADOQuery1.SQL.Text:='Select * from ToolBar Where Visible=false;';
  ADOQuery1.Active:=True;

  NewItem:=ElTree1.Items.AddItem(nil);
  NewItem.Text:='разделитель';

  for i:=1 to DataSource1.DataSet.RecordCount do
    begin
      DataSource1.DataSet.RecNo:=i;

      NewItem:=ElTree1.Items.AddItem(nil);
      NewItem.Text:=DataSource1.DataSet.FieldValues['Name'];
      NewItem.ImageIndex:=DataSource1.DataSet.FieldValues['Image'];
      NewItem.Tag:=DataSource1.DataSet.FieldValues['Id'];
    end;

  ConnectSQL(ADOQuery1,'Select * from VisibleToolBar;');
  Previous:=-1;

  for i:=1 to DataSource1.DataSet.RecordCount do
    begin
      DataSource1.DataSet.RecNo:=i;

      if (Previous<>-1) and (Previous+1<>DataSource1.DataSet.FieldValues['Position']) then
          begin
            NewItem:=ElTree2.Items.AddItem(nil);
            NewItem.Text:='разделитель';
            inc(Previous);
          end;
      NewItem:=ElTree2.Items.AddItem(nil);
      NewItem.Text:=DataSource1.DataSet.FieldValues['Name'];
      NewItem.ImageIndex:=DataSource1.DataSet.FieldValues['Image'];
      NewItem.Tag:=DataSource1.DataSet.FieldValues['Id'];
      Previous:=DataSource1.DataSet.FieldValues['Position']
    end;
end;

procedure TForm32.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm32.SpeedButton6Click(Sender: TObject);
var NewItem: TElTreeItem;
begin
  if ElTree1.Selected=nil then Exit;

  if (ElTree1.Selected.Text='разделитель') and (ElTree2.Items.Count=0) then Exit;
  if ElTree2.Items.Count>0 then
    if ElTree1.Selected.Text=ElTree2.Items.Item[ElTree2.Items.Count-1].Text then Exit;

  NewItem:=ElTree2.Items.AddItem(nil);
  NewItem.Text:=ElTree1.Selected.Text;
  NewItem.ImageIndex:=ElTree1.Selected.ImageIndex;
  NewItem.Tag:=ElTree1.Selected.Tag;
  if ElTree1.Selected.Text<>'разделитель' then ElTree1.Selected.Delete;
end;

procedure TForm32.SpeedButton5Click(Sender: TObject);
var NewItem: TElTreeItem;
begin
  if ElTree2.Selected=nil then Exit;

  if ElTree2.Selected.Text<>'разделитель' then
    begin
      NewItem:=ElTree1.Items.AddItem(nil);
      NewItem.Text:=ElTree2.Selected.Text;
      NewItem.ImageIndex:=ElTree2.Selected.ImageIndex;
      NewItem.Tag:=ElTree2.Selected.Tag;
    end;
  ElTree2.Selected.Delete;
end;

procedure TForm32.SpeedButton2Click(Sender: TObject);
begin
  if ElTree2.Selected=nil then Exit;
  if ElTree2.Items.Count<2 then Exit;
  if ElTree2.Selected.Index=0 then Exit;
// ----------
  SwapItems(ElTree2.Selected,ElTree2.Items.Item[ElTree2.Selected.Index-1]);
  ElTree2.Items.Item[ElTree2.Selected.Index-1].Selected:=True;
  ElTree2.Items.Item[ElTree2.Selected.Index-1].Focused:=True;
end;

procedure TForm32.SpeedButton4Click(Sender: TObject);
begin
  if ElTree2.Selected=nil then Exit;
  if ElTree2.Items.Count<2 then Exit;
  if ElTree2.Selected.Index=ElTree2.Items.Count-1 then Exit;
// ----------
  SwapItems(ElTree2.Selected,ElTree2.Items.Item[ElTree2.Selected.Index+1]);
  ElTree2.Items.Item[ElTree2.Selected.Index+1].Selected:=True;
  ElTree2.Items.Item[ElTree2.Selected.Index+1].Focused:=True;
end;

procedure TForm32.SwapItems(FirstItem, SecondItem: TElTreeItem);
var ImageIndex: integer;
          Text: TElFString;
           Tag: integer;
begin
  ImageIndex:=FirstItem.ImageIndex;
  Text:=FirstItem.Text;
  Tag:=FirstItem.Tag;

  FirstItem.ImageIndex:=SecondItem.ImageIndex;
  FirstItem.Text:=SecondItem.Text;
  FirstItem.Tag:=SecondItem.Tag;

  SecondItem.ImageIndex:=ImageIndex;
  SecondItem.Text:=Text;
  SecondItem.Tag:=Tag;
end;

procedure TForm32.SpeedButton1Click(Sender: TObject);
var i: integer;
begin
  DeleteSQL(ADOQuery1,'Update ToolBar Set ToolBar.Visible=false;');

  for i:=0 to ElTree2.Items.Count-1 do
    if ElTree2.Items.Item[i].Text<>'разделитель' then
      begin
        ConnectSQL(ADOQuery1,'Select * from ToolBar Where Id='+IntToStr(ElTree2.Items.Item[i].Tag)+';');
        FieldEdit(DataSource1,'Visible',true);
        FieldEdit(DataSource1,'Position',i+1);
        ADOQuery1.Active:=False;
      end;
  Close;
  MainForm.ToolBarConstruct;
end;

procedure TForm32.FormCreate(Sender: TObject);
begin
  ColorApply(Form32);
end;

end.
