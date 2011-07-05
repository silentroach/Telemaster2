// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Фирмы-производители
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit Firms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Buttons, DB, ADODB, StdCtrls, Addition,
  ElXPThemedControl, ElTree, Menus, ElTreeStdEditors,
  ComCtrls, ComObj;

type
  TForm10 = class(TForm)
    CategoryTable: TADOTable;
    FirmsQuery: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    FirmsPopup: TPopUpMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    ElTreeInplaceEdit1: TElTreeInplaceEdit;
    SpeedButton7: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton6: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Edit1: TEdit;
    ElTree1: TElTree;
    Label1: TLabel;
    SpeedButton5: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    MicrosoftExcel1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure ElTree1ItemExpand(Sender: TObject; Item: TElTreeItem);
    procedure ElTree1ItemSelectedChange(Sender: TObject;
      Item: TElTreeItem);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure ElTreeInplaceEdit1ValidateResult(Sender: TObject;
      var InputValid: Boolean);
    procedure N9Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure MicrosoftExcel1Click(Sender: TObject);
  private
    procedure FillTree;
    procedure MenuFill;
    procedure MenuClick(Sender: TObject);
    function CheckFirmUse(FirmId: integer): boolean;
    function FirmExists(FirmName: string): boolean;
    function CategoryExists(CategoryName: string): boolean;
  public
  end;

var
  Form10: TForm10;

implementation

uses MainWindow, AddEdit;

{$R *.dfm}

procedure TForm10.FillTree;
var     i: integer;
  NewItem: TElTreeItem;
    Empty: TElTreeItem;
begin
  ElTree1.Items.Clear;

  CategoryTable.Active:=True;
  for i:=1 to DataSource1.DataSet.RecordCount do
    begin
      DataSource1.DataSet.RecNo:=i;
      NewItem:=ElTree1.Items.AddItem(nil);
      NewItem.Text:=DataSource1.DataSet.FieldValues['Name'];
      ConnectSQL(FirmsQuery,'Select Count(Name) as Numb from Firms Where Category='+IntToStr(DataSource1.DataSet.FieldValues['Id'])+';');
      NewItem.ColumnText.Add(IntToStr(DataSource2.DataSet.FieldValues['Numb']));
      DataSource2.DataSet.Active:=False;

      NewItem.ImageIndex:=1;
      NewItem.Tag:=DataSource1.DataSet.FieldValues['Id'];

      Empty:=ElTree1.Items.AddItem(NewItem);
      Empty.Text:='пусто';
      Empty.ImageIndex:=2;
    end;
  CategoryTable.Active:=False;
  
  ElTree1.FullCollapse;
end;

procedure TForm10.FormShow(Sender: TObject);
begin
  FillTree;
  MenuFill;
end;

procedure TForm10.ElTree1ItemExpand(Sender: TObject; Item: TElTreeItem);
var     i: integer;
  NewItem: TElTreeItem;
begin
  if Item.ChildrenCount=0 then Exit;
  ConnectSQL(FirmsQuery, 'Select * from Firms Where Category='+IntToStr(Item.Tag)+' order by Name asc;');
  if DataSource2.DataSet.RecordCount=0 then
    begin
      FirmsQuery.Active:=False;
      Exit;
    end;
  Item.Clear;
  for i:=1 to DataSource2.DataSet.RecordCount do
    begin
      MainForm.SetProgressValue(Round(100 * i / DataSource2.DataSet.RecordCount), '');
      DataSource2.DataSet.RecNo := i;
      NewItem := ElTree1.Items.AddItem(Item);
      NewItem.Text := DataSource2.DataSet.FieldValues['Name'];
      NewItem.Tag := DataSource2.DataSet.FieldValues['Id'];
      NewItem.ImageIndex := 3;
      ConnectSQL(MainForm.SmallNeedsQuery,'Select Firm from MainTable Where Firm='+IntToStr(DataSource2.DataSet.FieldValues['Id'])+';');
      if MainForm.DataSource2.DataSet.RecordCount>0 then
        NewItem.ColumnText.Add(IntToStr(MainForm.DataSource2.DataSet.RecordCount));
      MainForm.SmallNeedsQuery.Active:=False;
    end;
  MainForm.SetProgressValue(0,'');    
  FirmsQuery.Active:=False;
end;

procedure TForm10.ElTree1ItemSelectedChange(Sender: TObject;
  Item: TElTreeItem);
begin
  if ElTree1.Selected.Parent<>nil then
      begin
        N4.Enabled:=False;
        N5.Enabled:=True;
        N7.Enabled:=True;
        N4.Caption:='Удалить категорию';
        N5.Caption:='Удалить фирму ['+ElTree1.Selected.Text+']';
        N10.Caption:='Переименовать категорию';
        N10.Enabled:=False;
        N9.Caption:='Переименовать фирму ['+ElTree1.Selected.Text+']';
        N9.Enabled:=True;
      end
    else
      begin
        N4.Enabled:=True;
        N5.Enabled:=False;
        N7.Enabled:=False;
        N4.Caption:='Удалить категорию ['+ElTree1.Selected.Text+']';
        N5.Caption:='Удалить фирму';
        N10.Caption:='Переименовать категорию ['+ElTree1.Selected.Text+']';
        N10.Enabled:=True;
        N9.Caption:='Переименовать фирму';
        N9.Enabled:=False;
      end;
end;

procedure TForm10.MenuFill;
var NewItem: TMenuItem;
          i: integer;
begin
  N7.Clear;

  CategoryTable.Active:=True;
  for i:=1 to DataSource1.DataSet.RecordCount do
    begin
      DataSource1.DataSet.RecNo:=i;
      NewItem:=TMenuItem.Create(N7);
      NewItem.Caption:='['+DataSource1.DataSet.FieldValues['Name']+']';
      NewItem.Tag:=DataSource1.DataSet.FieldValues['Id'];
      NewItem.OnClick:=MenuClick;
      N7.Add(NewItem);
    end;
  CategoryTable.Active:=False;
end;

procedure TForm10.MenuClick(Sender: TObject);
begin
  ConnectSQL(FirmsQuery,'Select * from Firms where Id='+IntToStr(ElTree1.Selected.Tag)+';');
  FieldEdit(DataSource2,'Category',(Sender as TMenuItem).Tag);
  DataSource2.DataSet.Active:=False;
  FillTree;
end;

procedure TForm10.N1Click(Sender: TObject);
begin                                              // добавление новой категории
  try
    Application.CreateForm(TForm11,Form11);
    Form11.ShowForm('Добавление новой категории','Название','Добавить');
  finally
    if (Form11.ExitResult=true) and (CategoryExists(Form11.Edit1.Text)=false) then
      begin
        CategoryTable.Active:=True;
        DataSource1.DataSet.AppendRecord([nil,Form11.Edit1.Text]);
        CategoryTable.Active:=False;
        FillTree;
        MenuFill;
      end;
    Form11.Hide;
    Form11.Free;
  end;
end;

procedure TForm10.N2Click(Sender: TObject);
var CategoryNum: integer;
begin                                                  // добавление новой фирмы
  if ElTree1.Selected=nil then Exit;
  try
    Application.CreateForm(TForm11,Form11);
    Form11.ShowForm('Добавление новой фирмы','Название','Добавить');
  finally
    if (Form11.ExitResult=true) and (FirmExists(Form11.Edit1.Text)=False) then
      begin
        if ElTree1.Selected.Parent=nil then CategoryNum:=ElTree1.Selected.Tag
                                       else CategoryNum:=ElTree1.Selected.Parent.Tag;
        ConnectSQL(FirmsQuery,'Select * from Firms Where Category='+IntToStr(CategoryNum)+';');
        DataSource2.DataSet.AppendRecord([nil,CategoryNum, Form11.Edit1.Text]);
        DataSource2.DataSet.Active:=False;
        FillTree;        
      end;
    Form11.Hide;
    Form11.Free;
  end;
end;

function TForm10.CheckFirmUse(FirmId: integer): boolean;
begin                                            // проверка использования фирмы
  ConnectSQL(MainForm.SmallNeedsQuery,'Select Id from MainTable Where Firm='+IntToStr(FirmId)+';');
  if MainForm.SmallNeedsQuery.RecordCount>0 then Result:=true else Result:=false;
  MainForm.SmallNeedsQuery.Active:=False;
end;

procedure TForm10.Edit1Change(Sender: TObject);
var i, Category, Firm: integer;
                 Item: TElTreeItem;
begin
  if Edit1.Text='' then Exit;
  Category:=-1; Firm:=-1;
  Item:=nil;
  ConnectSQL(FirmsQuery,'Select * from Firms Where Name like "'+Edit1.Text+'%";');
  if DataSource2.DataSet.RecordCount<>0 then
    begin
      Category:=DataSource2.DataSet.FieldValues['Category'];
      Firm:=DataSource2.DataSet.FieldValues['Id'];
    end;
  FirmsQuery.Active:=False;
  if (Category=-1) or (Firm=-1) then Exit;
  for i:=0 to ElTree1.Items.Count-1 do
    if ElTree1.Items.Item[i].Parent=nil then
      if ElTree1.Items.Item[i].Tag=Category then
        begin
          Item:=ElTree1.Items.Item[i];
          if not(Item.Expanded) then
            begin
              ElTree1.FullCollapse;
              Item.Expand(true);
            end;
          Break;
        end;
  if Item=nil then Exit;
  for i:=0 to Item.ChildrenCount-1 do
    if Item.Children[i].Tag=Firm then
      begin
        Item.Children[i].Focused:=True;
        Item.Children[i].MakeVisible;
        break;
      end;
end;

procedure TForm10.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text<>'' then Edit1.Text:='';
end;

procedure TForm10.ElTreeInplaceEdit1ValidateResult(Sender: TObject;
  var InputValid: Boolean);
begin                                                      // изменение значения
  InputValid:=true;
  if ElTreeInplaceEdit1.Editor.Text=ElTree1.Selected.Text then
    Exit;
  if ((ElTree1.Selected.Parent<>nil) and (FirmExists(ElTreeInplaceEdit1.Editor.Text))) or
     ((ElTree1.Selected.Parent=nil)  and (CategoryExists(ElTreeInplaceEdit1.Editor.Text))) then
    begin
      ElTreeInplaceEdit1.Editor.Text:='такая запись уже существует';
      InputValid:=false;
    end;
  if ElTreeInplaceEdit1.Editor.Text='' then
    begin
      ElTreeInplaceEdit1.Editor.Text:='введите что-нибудь или нажмите ESC';
      InputValid:=false;
    end;
  if (ElTreeInplaceEdit1.Editor.Text='введите что-нибудь или нажмите ESC') or
     (ElTreeInplaceEdit1.Editor.Text='такая запись уже существует') then InputValid:=false;
  if InputValid=false then Exit;
  ConnectSQL(FirmsQuery,'Select * from Firms Where Id='+IntToStr(ElTree1.Selected.Tag)+';');
  if DataSource2.DataSet.RecordCount<>0 then
    FieldEdit(DataSource2,'Name',ElTreeInplaceEdit1.Editor.Text);
  FirmsQuery.Active:=False;
end;

function TForm10.FirmExists(FirmName: string): boolean;
begin                                         // проверка на существование фирмы
  ConnectSQL(MainForm.SmallNeedsQuery,'Select * from Firms Where Name="'+FirmName+'";');
  if MainForm.SmallNeedsQuery.RecordCount>0 then Result:=true
                                         else Result:=false;
  MainForm.SmallNeedsQuery.Active:=False;
end;

procedure TForm10.N9Click(Sender: TObject);
begin
  if MainForm.Configuration.UserType=3 then
    begin
      ShowInfoMessage('У Вас отсутствуют права на использование данной функции!','Ошибка',true);
      Exit;
    end;

  if ElTree1.Selected=nil then Exit;
  if ElTree1.Selected.Text='пусто' then Exit;
  if ElTree1.Selected.Parent=nil then Exit; 
  ElTree1.Selected.EditText;
end;

procedure TForm10.SpeedButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TForm10.N4Click(Sender: TObject);
var   Item: TElTreeItem;                                   // удаление категории
   success: boolean;
         i: integer;
begin
  if MainForm.Configuration.UserType=3 then
    begin
      ShowInfoMessage('У Вас отсутствуют права на использование данной функции!','Ошибка',true);
      Exit;
    end;

  if ElTree1.Selected=nil then Exit;
  if ElTree1.Selected.Parent=nil then
      begin
        Item:=ElTree1.Selected;
        ElTree1.Selected.MakeVisible;
        ConnectSQL(FirmsQuery,'Select * from Firms Where Category='+IntToStr(Item.Tag)+';');
      // ---------------------------- проверка на использование фирм в главной таблице
        success:=true;
        for i:=1 to DataSource2.DataSet.RecordCount do
          begin
            MainForm.SetProgressValue(Round(100*i/DataSource2.DataSet.RecordCount),' ');
            DataSource2.DataSet.RecNo:=i;
            ConnectSQL(MainForm.SmallNeedsQuery,'Select * from MainTable Where Firm='+IntToStr(DataSource2.DataSet.FieldValues['Id'])+';');
            if MainForm.SmallNeedsQuery.RecordCount>0 then
              begin
                success:=false;
                MainForm.SmallNeedsQuery.Active:=False;
                Break;
              end;
            MainForm.SmallNeedsQuery.Active:=False;
          end;
        MainForm.SetProgressValue(0,' ');
        DataSource2.DataSet.Active:=False;
        if success=false then
          begin
            ShowInfoMessage('Извините, но одна или несколько фирм категории уже используются в основном справочнике!','Внимание',true);
            Exit;
          end;
        if ShowQuestionMessage('Вы действительно хотите удалить всю категорию с прилагающимися к ней фирмами?','Внимание')=false then Exit;
      // --------------------------------------------------- собственно, само удаление
        DeleteSQL(FirmsQuery,'Delete * from Firms Where Category='+IntToStr(Item.Tag)+';');
        DeleteSQL(FirmsQuery,'Delete * from Prices Where CategoryId='+IntToStr(Item.Tag)+';');
        DeleteSQL(FirmsQuery,'Delete * from Categories Where Id='+IntToStr(Item.Tag)+';');
        Item.Delete;
      end
    else
      begin
        if ElTree1.Selected=nil then Exit;
        if ElTree1.Selected.Parent=nil then Exit;
        ElTree1.Selected.MakeVisible;
        if CheckFirmUse(ElTree1.Selected.Tag) then
          begin
            ShowInfoMessage('Извините, но сейчас фирму удалить невозможно в связи с ее использованием в главной таблице.'#13'Попробуйте просто переименовать фирму.','Внимание',true);
            Exit;
          end;
        if ShowQuestionMessage('Вы действительно хотите удалить фирму из справочника?','Внимание')=false then Exit;
        DeleteSQL(FirmsQuery,'Delete * from Firms Where Id='+IntToStr(ElTree1.Selected.Tag)+';');
        ElTree1.Selected.Delete;
      end;
end;

procedure TForm10.SpeedButton1Click(Sender: TObject);
begin
  if MainForm.Configuration.UserType=3 then
    begin
      ShowInfoMessage('У Вас отсутствуют права на использование данной функции!','Ошибка',true);
      Exit;
    end;

  if ElTree1.Selected=nil then Exit;
  if ElTree1.Selected.Parent<>nil then
      begin
        ElTree1.Selected.Parent.Focused:=True;
        ElTree1.Selected.MakeVisible;
        ElTree1.Selected.EditText;
      end
    else ElTree1.Selected.EditText;
end;

function TForm10.CategoryExists(CategoryName: string): boolean;
begin                                     // проверка на существование категории
  Result:=false;
  CategoryTable.Active:=True;
  DataSource1.DataSet.Locate('Name',CategoryName,[]);
  if DataSource1.DataSet.RecordCount>0 then
    if DataSource1.DataSet.FieldValues['Name']=CategoryName then Result:=true;
  CategoryTable.Active:=False;
end;

procedure TForm10.FormCreate(Sender: TObject);
begin
  ColorApply(Form10);
end;

procedure TForm10.SpeedButton5Click(Sender: TObject);
begin                                                           // вызов менюшки
  PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TForm10.N11Click(Sender: TObject);
var SaveDialog: TSaveDialog;
             i: integer;
             T: TextFile;
begin                                         // экспорт дерева в текстовый файл
  SaveDialog:=TSaveDialog.Create(Application);
  SaveDialog.Title:='Экспорт списка фирм в текстовый файл';
  SaveDialog.Filter:='Текстовые файлы|*.txt';
  if (SaveDialog.Execute) and (SaveDialog.FileName<>'') then
    begin
      Form10.Enabled:=False;
      ElTree1.FullExpand;
      Form10.Update;
      Application.ProcessMessages;

      AssignFile(T,SaveDialog.FileName);
      ReWrite(T);
      WriteLn(T,'Фирмы-производители оборудования');
      WriteLn(T);
      for i:=0 to ElTree1.Items.Count-1 do
        begin
          MainForm.SetProgressValue(Round(100*(i+1)/(Eltree1.Items.Count)),' ');
          if ElTree1.Items.Item[i].Parent<>nil then Write(T,'    ')
                                               else WriteLn(T);
          WriteLn(T,ElTree1.Items.Item[i].Caption);
          Application.ProcessMessages;
        end;
      MainForm.SetProgressValue(0,' ');
      WriteLn(T);
      WriteLn(T,'Список генерирован программой Телемастер');
      Flush(T);
      CloseFile(T);
      Form10.Enabled:=True;
    end;
  SaveDialog.Free;
end;

procedure TForm10.MicrosoftExcel1Click(Sender: TObject);
var i: integer;
begin
  Form10.Enabled:=False;
  ElTree1.FullExpand;
  Form10.Update;
  Application.ProcessMessages;
  XL:=CreateOLEObject('Excel.Application');              // Создание OLE объекта
  XL.WorkBooks.Add;

  XL.Range['A1:A1'].Value:='Список фирм-производителей оборудования';

  for i:=0 to ElTree1.Items.Count-1 do
    begin
      MainForm.SetProgressValue(Round(100*(i+1)/(Eltree1.Items.Count)),' ');
      if ElTree1.Items.Item[i].Parent<>nil then XL.Range['B'+IntToStr(i+3)+':B'+IntToStr(i+3)].Select
                                           else XL.Range['A'+IntToStr(i+3)+':A'+IntToStr(i+3)].Select;
      XL.Selection.Value:=ElTree1.Items.Item[i].Caption;
      Application.ProcessMessages;
    end;
  MainForm.SetProgressValue(0,' ');

  XL.Range['A'+IntToStr(ElTree1.Items.Count+5)+':A'+IntToStr(ElTree1.Items.Count+5)].Value:='Список сгенерирован программой Телемастер';

  XL.Visible:=true;
  Form10.Enabled:=True;
end;

end.
