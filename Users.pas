unit Users;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ADODB, ImgList, ElXPThemedControl, ElTree, Buttons, DB, ComCtrls, Addition;

type
  TForm2 = class(TForm)
    SpeedButton6: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ImageList1: TImageList;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ElTree1: TElTree;
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ElTree1AfterSelectionChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ElTree1DblClick(Sender: TObject);
  private

  public
    procedure FillUserTree;                   // заполнение дерева пользователей
  end;

var
  Form2: TForm2;

implementation

uses UserAdd, MainWindow;

{$R *.dfm}

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin                                  //  заполнение дерева в администрировании
  ColorApply(Form2);

  ADOQuery1.Active:=False;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('Select *, (LastName+" "+FirstName+" "+FatherName) as Name from Users order by (LastName+" "+FirstName+" "+FatherName);');
  ADOQuery1.Active:=True;
  FillUserTree;
end;

procedure TForm2.SpeedButton6Click(Sender: TObject);
begin
  try
    Application.CreateForm(TAddMasterForm, AddMasterForm);
    AddMasterForm.TypeAddition:=true;
    AddMasterForm.ShowModal;
  finally
    AddMasterForm.Hide;
    AddMasterForm.Free;
    
    FillUserTree;
  end;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  if ElTree1.Selected<>nil then
    try
      Application.CreateForm(TAddMasterForm, AddMasterForm);
      With AddMasterForm do
        begin
          Caption:='Изменение информации о мастере';
          SpeedButton6.Caption:='изменить данные';
          TypeAddition:=false;
          eSurname.Text:=Form2.DataSource1.DataSet.FieldValues['LastName'];
          eName.Text:=Form2.DataSource1.DataSet.FieldValues['FirstName'];
          eFather.Text:=Form2.DataSource1.DataSet.FieldValues['FatherName'];
          eAddress.Text:=Form2.DataSource1.DataSet.FieldValues['Address'];
          ePhone.Text:=Form2.DataSource1.DataSet.FieldValues['Phone'];
          case Form2.DataSource1.DataSet.FieldValues['CashType'] of
            1: rbPPrice.Checked:=True;
            2: rbPPercent.Checked:=True;
            3: rbPOrganization.Checked:=True;
          end;
          if rbPPrice.Checked then ePayment.Text:=FloatToStr(Form2.DataSource1.DataSet.FieldValues['CashValue'])
                                  else tbPercent.Position:=Form2.DataSource1.DataSet.FieldValues['CashValue'];
          ShowModal;
        end;
    finally
      AddMasterForm.Hide;
      AddMasterForm.Free;

      FillUserTree;
    end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOQuery1.Active:=False;
end;

procedure TForm2.FillUserTree;
var NewUser: TElTreeItem;
          i: integer;
begin
  ElTree1.Items.Clear;

  ADOQuery1.Requery([]);
  For i:=1 to DataSource1.DataSet.RecordCount do
    begin
      DataSource1.DataSet.RecNo:=i;
      MainForm.SetProgressValue(Round(i*100/DataSource1.DataSet.RecordCount),'');
      NewUser:=ElTree1.Items.AddItem(nil);
      NewUser.Text:=DataSource1.DataSet.FieldValues['Name'];
      NewUser.ColumnText.Add(DataSource1.DataSet.FieldValues['Phone']);
      NewUser.ColumnText.Add(DataSource1.DataSet.FieldValues['Address']);
      NewUser.ImageIndex:=1;
      NewUser.Tag:=1;
    end;

  if ElTree1.Items.Count<10 then ElTree1.FullExpand;
  MainForm.SetProgressValue(0,'');
end;

procedure TForm2.ElTree1AfterSelectionChange(Sender: TObject);
var Str: string;
begin
  if ElTree1.Selected<>nil then
    begin
      str:=ElTree1.Selected.Text;
      DataSource1.DataSet.Locate('Name',str,[]);
    end;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
var success: boolean;
begin
  if ElTree1.Selected=nil then
    begin
      ShowInfoMessage('Сначала следует выбрать мастера, которого вы хотите удалить!','Внимание',true);
      Exit;
    end;
  success:=true;
  with MainForm.SmallNeedsQuery do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('Select MasterId from MainTable Where MasterId='+IntToStr(Form2.DataSource1.DataSet.FieldValues['Id'])+';');
      Active:=True;
      if RecordCount>0 then success:=false;
      Active:=False;
    end;
  if success=false then
    begin
      ShowInfoMessage('Извините, но существует аппарат, который ремонтирует(овал) текущий мастер! Может стоит просто изменить данные о мастере, включая его ФИО?','Попробуйте его просто переименовать',true);
      Exit;
    end;
  if ElTree1.Selected<>nil then
    if ShowQuestionMessage('Вы действительно хотите удалить мастера?','Внимание')=true then
      begin
        DataSource1.DataSet.Delete;
        FillUserTree;
      end;
end;

procedure TForm2.ElTree1DblClick(Sender: TObject);
begin
  SpeedButton1.Click;
end;

end.
