// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Типы устройств
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit AppType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Buttons, StdCtrls, Grids, VolDBGrid, ExtCtrls, Addition,
  ElXPThemedControl, ElTree, ElTreeStdEditors, Menus, 
  ComCtrls, ComObj;

type
  TForm12 = class(TForm)
    TypesTable: TADOTable;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    DataSource2: TDataSource;
    ElTreeInplaceEdit1: TElTreeInplaceEdit;
    PricePopup: TPopUpMenu;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton7: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ElTree1: TElTree;
    SpeedButton1: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    MicrosoftExcel1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure ElTree1DblClick(Sender: TObject);
    procedure ElTreeInplaceEdit1ValidateResult(Sender: TObject;
      var InputValid: Boolean);
    procedure SpeedButton7Click(Sender: TObject);
    procedure ElTree1HeaderColumnClick(Sender: TObject;
      SectionIndex: Integer);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure MicrosoftExcel1Click(Sender: TObject);
  private
    procedure FillTree;
    procedure FillHeaders;
    procedure ChangeSizes;
    procedure PriceEdit(CategoryId: integer; TypeId: integer);
    procedure PriceFill;
    procedure PricePopupClick(Sender: TObject);
    function TypeExists(TypeName: string): boolean;
    function TypeExistsMainTable(TypeId: integer): boolean;    
  public

  end;

var
  Form12: TForm12;

implementation

uses MainWindow, AddEdit, Firms;

{$R *.dfm}

procedure TForm12.ChangeSizes;
var i: integer;
begin
  for i:=1 to ElTree1.HeaderSections.Count-1 do
    ElTree1.HeaderSections.Item[i].Width:=
      Round((ElTree1.Width-ElTree1.HeaderSections.Item[0].Width-22)/(ElTree1.HeaderSections.Count-1));
end;

procedure TForm12.FillHeaders;
var Header: TElHeaderSection;
         i: integer;
   NewItem: TMenuItem;
begin
  ElTree1.HeaderSections.Clear;
  Header:=ElTree1.HeaderSections.AddSection;
  Header.Text:='Название типа устройства';
  Header.Width:=150;
  DataSource2.DataSet.Active:=True;
  PricePopup.Items.Clear;
  for i:=1 to DataSource2.DataSet.RecordCount do
    begin
      DataSource2.DataSet.RecNo:=i;
      Header:=ElTree1.HeaderSections.AddSection;
      Header.Text:=DataSource2.DataSet.FieldValues['Name'];
      Header.Tag:=DataSource2.DataSet.FieldValues['Id'];

      NewItem:=TMenuItem.Create(PricePopup);
      NewItem.Caption:=Header.Text;
      NewItem.Tag:=Header.Tag;
      NewItem.OnClick:=PricePopupClick;
      PricePopup.Items.Add(NewItem);
    end;
  DataSource2.DataSet.Active:=False;
end;

procedure TForm12.FillTree;
var NewItem: TElTreeItem;
      probe: TLabel;
          i: integer;
begin
  ElTree1.Items.Clear;
  DataSource1.DataSet.Active:=True;
  for i:=1 to DataSource1.DataSet.RecordCount do
    begin
      DataSource1.DataSet.RecNo:=i;
      NewItem:=ElTree1.Items.AddItem(nil);
      Probe:=TLabel.Create(Form12);
      Probe.Caption:=DataSource1.DataSet.FieldValues['Name'];
      if Probe.Width<250 then
        if Probe.Width+40>ElTree1.HeaderSections.Item[0].Width then
          ElTree1.HeaderSections.Item[0].Width:=Probe.Width+40;
      NewItem.Caption:=Probe.Caption;
      NewItem.Tag:=DataSource1.DataSet.FieldValues['Id'];
      Probe.Free;
    end;
  DataSource1.DataSet.Active:=False;
end;

procedure TForm12.FormShow(Sender: TObject);
begin
  FillHeaders;
  FillTree;
  ChangeSizes;
  PriceFill;
end;

procedure TForm12.ElTree1DblClick(Sender: TObject);
begin
  if ElTree1.Selected<>nil then ElTree1.Selected.EditText;
end;

function TForm12.TypeExists(TypeName: string): boolean;
begin                                          // проверка на существование типа
  Result:=false;
  ConnectSQL(MainForm.SmallNeedsQuery,'Select * from Types Where Name="'+TypeName+'";');
  if MainForm.SmallNeedsQuery.RecordCount>0 then Result:=true;
  MainForm.SmallNeedsQuery.Active:=False;
end;

procedure TForm12.ElTreeInplaceEdit1ValidateResult(Sender: TObject;
  var InputValid: Boolean);
begin
  InputValid:=true;
  if ElTreeInplaceEdit1.Editor.Text=ElTree1.Selected.Text then Exit;
  if TypeExists(ElTreeInplaceEdit1.Editor.Text) then
    ElTreeInplaceEdit1.Editor.Text:='такой тип уже существует';
  if ElTreeInplaceEdit1.Editor.Text='' then ElTreeInplaceEdit1.Editor.Text:='нужно ввести что-нибудь';
  if (ElTreeInplaceEdit1.Editor.Text='такой тип уже существует') or
     (ElTreeInplaceEdit1.Editor.Text='нужно ввести что-нибудь') then InputValid:=false;
  if InputValid=false then Exit;
  DataSource1.DataSet.Active:=True;
  DataSource1.DataSet.Locate('Name',ElTree1.Selected.Caption,[]);
  FieldEdit(DataSource1,'Name',ElTreeInplaceEdit1.Editor.Text);
  DataSource1.DataSet.Active:=False;
end;

procedure TForm12.SpeedButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TForm12.ElTree1HeaderColumnClick(Sender: TObject;
  SectionIndex: Integer);
begin
  if ElTree1.Selected=nil then Exit;
  if SectionIndex=0 then Exit;
  PriceEdit(ElTree1.HeaderSections.Item[SectionIndex].Tag,ElTree1.Selected.Tag);
end;

procedure TForm12.PriceEdit(CategoryId, TypeId: integer);
var CatName: string;
begin
  DataSource2.DataSet.Active:=True;
  DataSource2.DataSet.Locate('Id',CategoryId,[]);
  if DataSource2.DataSet.RecordCount=0 then Exit
                                       else CatName:=DataSource2.DataSet.FieldValues['Name'];
  DataSource2.DataSet.Active:=False;
  ConnectSQL(MainForm.SmallNeedsQuery,'Select * from Prices Where CategoryId='+IntToStr(CategoryId)+
                                   ' and TypeId='+IntToStr(TypeId)+';');
  try
    Application.CreateForm(TForm11,Form11);
    Form11.Edit1.Text:='0';
    if MainForm.DataSource2.DataSet.RecordCount>0 then Form11.Edit1.Text:=FloatToStr(MainForm.DataSource2.DataSet.FieldValues['Price']);
    Form11.ShowForm('Ремонт ['+ElTree1.Selected.Caption+'] категории ['+CatName+']','Цена ремонта','ОК');
  finally
    Form11.Hide;
    if Form11.ExitResult then
      begin
        if not((Form11.Edit1.Text='0') or (Form11.Edit1.Text='')) then
            begin
              if MainForm.DataSource2.DataSet.RecordCount>0 then FieldEdit(MainForm.DataSource2,'Price',StrToFloat(Form11.Edit1.Text))
                else MainForm.DataSource2.DataSet.AppendRecord([nil,TypeId,CategoryId,StrToFloat(Form11.Edit1.Text)]);
            end
          else
            DeleteSQL(MainForm.SmallNeedsQuery,'Delete * from Prices Where CategoryId='+IntToStr(CategoryId)+' and TypeId='+IntToStr(TypeId)+';');
        MainForm.SmallNeedsQuery.Active:=False;
        PriceFill;
      end;
    Form11.Free;
  end;
  if MainForm.SmallNeedsQuery.Active then MainForm.SmallNeedsQuery.Active:=False;
end;

procedure TForm12.PriceFill;
var i: integer;
    n: integer;
begin
  for i:=0 to ElTree1.Items.Count-1 do
    begin
      ElTree1.Items.Item[i].ColumnText.Clear;
      for n:=1 to ElTree1.HeaderSections.Count-1 do
        begin
          ConnectSQL(MainForm.SmallNeedsQuery,'Select * from Prices Where TypeId='+IntToStr(ElTree1.Items.Item[i].Tag)+
                     ' and CategoryId='+IntToStr(ElTree1.HeaderSections.Item[n].Tag)+';');
          if MainForm.DataSource2.DataSet.RecordCount=0 then ElTree1.Items.Item[i].ColumnText.Add(' ')
                                                     else ElTree1.Items.Item[i].ColumnText.Add(FloatToStr(MainForm.DataSource2.DataSet.FieldValues['Price']) + MainForm.MoneyValue);
          MainForm.SmallNeedsQuery.Active:=False;
        end;
    end;
end;

procedure TForm12.SpeedButton5Click(Sender: TObject);
begin
  if ElTree1.Selected<>nil then ElTree1.Selected.EditText;
end;

procedure TForm12.SpeedButton4Click(Sender: TObject);
begin
// ------------------------------------------------------- всевозможные проверки
  if ElTree1.Selected=nil then Exit;
  if TypeExistsMainTable(ElTree1.Selected.Tag) then
    begin
      ShowInfoMessage('Выбранный тип устройств уже используется в базе данных!'#13'Может, стоит просто переименовать тип?','Внимание',true);
      Exit;
    end;
  if ShowQuestionMessage('Вы действительно хотите удалить данный тип устройств?','Удаление')=false then Exit;
// --------------------------------------------------- собственно, само удаление
  DeleteSQL(MainForm.SmallNeedsQuery,'Delete * from Prices Where TypeId='+IntToStr(ElTree1.Selected.Tag)+';');
  DeleteSQL(MainForm.SmallNeedsQuery,'Delete * from Types Where Id='+IntToStr(ElTree1.Selected.Tag)+';');
// -----------------------------------------------------------------------------
  FillTree;
  ChangeSizes;
  PriceFill;
end;

function TForm12.TypeExistsMainTable(TypeId: integer): boolean;
begin                                   // проверка на использование типа в базе
  Result:=false;
  ConnectSQL(MainForm.SmallNeedsQuery,'Select Count(Type) as C from MainTable Where Type='+IntToStr(TypeId)+';');
  if MainForm.DataSource2.DataSet.FieldValues['C']>0 then Result:=true;
  MainForm.SmallNeedsQuery.Active:=False;
end;

procedure TForm12.SpeedButton3Click(Sender: TObject);
begin                                        // добавление нового типа устройств
  try
    Application.CreateForm(TForm11,Form11);
    Form11.ShowForm('Добавление нового типа устройств','Название','Добавить');
  finally
    Form11.Hide;
    if (Form11.ExitResult) and (TypeExists(Form11.Edit1.Text)=false) then
      begin
        DataSource1.DataSet.Active:=True;
        DataSource1.DataSet.AppendRecord([nil,Form11.Edit1.Text]);
        DataSource1.DataSet.Active:=False;
        FillTree;
        ChangeSizes;
        PriceFill;
      end;
    Form11.Free;
  end;
end;

procedure TForm12.SpeedButton2Click(Sender: TObject);
begin
  if ElTree1.Selected=nil then Exit;
  PricePopup.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TForm12.PricePopupClick(Sender: TObject);
begin
  PriceEdit((Sender as TMenuItem).Tag,ElTree1.Selected.Tag);
end;

procedure TForm12.FormCreate(Sender: TObject);
begin
  ColorApply(Form12);
end;

procedure TForm12.SpeedButton1Click(Sender: TObject);
begin
  PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TForm12.N1Click(Sender: TObject);
var SaveDialog: TSaveDialog;
             i: integer;
             T: TextFile;
begin                                         // экспорт дерева в текстовый файл
  SaveDialog:=TSaveDialog.Create(Application);
  SaveDialog.Title:='Экспорт списка типов устройств в текстовый файл';
  SaveDialog.Filter:='Текстовые файлы|*.txt';
  if (SaveDialog.Execute) and (SaveDialog.FileName<>'') then
    begin
      Form12.Enabled:=False;
      Form12.Update;
      Application.ProcessMessages;

      AssignFile(T,SaveDialog.FileName);
      ReWrite(T);
      WriteLn(T,'Список типов устройств');
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
      Form12.Enabled:=True;
    end;
  SaveDialog.Free;
end;

procedure TForm12.MicrosoftExcel1Click(Sender: TObject);
var i: integer;
begin
  Form12.Enabled:=False;
  Form12.Update;
  Application.ProcessMessages;
  XL:=CreateOLEObject('Excel.Application');              // Создание OLE объекта
  XL.WorkBooks.Add;

  XL.Range['A1:A1'].Value:='Список типов устройств';

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
  Form12.Enabled:=True;
end;

end.
