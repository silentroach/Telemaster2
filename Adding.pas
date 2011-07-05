// -----------------------------------------------------------------------------
//
//    “елемастер v2.0
//    ƒобавление заказа
//
//                                            by  алашников »горь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit Adding;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, StrUtils,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB, ADODB, glWizardHeader, DBTables,
  jpeg, Addition, Menus,

  amDataBase,
  tlDataBase;

type
  TForm5 = class(TForm)
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    glWizardHeader1: TglWizardHeader;
    Label12: TLabel;
    Label11: TLabel;
    cbMasterList: TComboBox;
    Label13: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Label18: TLabel;
    Label10: TLabel;
    Label19: TLabel;
    SpeedButton2: TSpeedButton;
    Label24: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Label25: TLabel;
    ADOTable1: TADOTable;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    Label26: TLabel;
    Label27: TLabel;
    ADOQuery4: TADOQuery;
    DataSource6: TDataSource;
    ADOQuery5: TADOQuery;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Edit3: TEdit;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label21: TLabel;
    Label22: TLabel;
    SmallNeedsQuery: TADOQuery;
    DateTimePicker1: TDateTimePicker;
    Label20: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    Edit7: TEdit;
    Label14: TLabel;
    Button2: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Memo1: TMemo;
    Label23: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label13MouseEnter(Sender: TObject);
    procedure Label13MouseLeave(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure Label16MouseEnter(Sender: TObject);
    procedure Label16MouseLeave(Sender: TObject);
    procedure Label17MouseEnter(Sender: TObject);
    procedure Label17MouseLeave(Sender: TObject);
    procedure Label20Click(Sender: TObject);
    procedure Label20MouseEnter(Sender: TObject);
    procedure Label20MouseLeave(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure cbMasterListChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure TabSheet4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label18Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    procedure HeaderComment;
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
    procedure FillCombos;
    procedure CheckMoney;
    function DocNumExists(Number: integer): boolean;   
  public
    ClientNum: integer;
    EditAllowed: boolean;
    procedure FillClient;
  end;

var
  Form5: TForm5;

implementation

uses Firms, Types, AppType, MainWindow, FindedList;

{$R *.dfm}

procedure TForm5.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  ColorApply(Form5);

  DateTimePicker1.Date:=Date;
  Application.CreateForm(TForm23, Form23);
  Application.OnMessage:=AppMessage;
end;

procedure TForm5.SpeedButton4Click(Sender: TObject);
var Success: boolean;
   MasterId: integer;
begin
  if Form23.Visible then Form23.Hide;
  if PageControl1.TabIndex<3 then PageControl1.TabIndex:=PageControl1.TabIndex+1
                             else
    begin
// проверка на заполненность об€зательных полей
      Success:=true;
      if Edit1.Text='' then
        begin
          Label4.Font.Color:=clRed;
          Success:=false;
        end;
      if Success=false then
        begin
          ShowInfoMessage('¬ы не заполнили об€зательные пол€!','¬нимание',true);
          Exit;
        end;
      if Edit7.Text<>'' then
        if DocNumExists(StrToInt(Edit7.Text)) then
          begin
            ShowInfoMessage('“акой номер квитанции уже существует!','ƒобавление устройства',true);
            Exit;
          end;
// само добавление
      MasterId:=0;
      if Integer(cbMasterList.Items.Objects[cbMasterList.ItemIndex]) <> -MaxLongInt then
          MasterId := Integer(cbMasterList.Items.Objects[cbMasterList.ItemIndex]);
          
      DataSource2.DataSet.Locate('Name',ComboBox2.Items.Strings[ComboBox2.ItemIndex],[]);
      DataSource3.DataSet.Locate('Name',ComboBox1.Items.Strings[ComboBox1.ItemIndex],[]);
      if ClientNum=0 then                      // если клиента нет, то добавл€ем
        begin
          ConnectSQL(ADOQuery5,'Select * from Clients;');
          DataSource5.DataSet.AppendRecord([
                                        nil,
                                        Edit3.Text,
                                        Edit4.Text,
                                        Edit5.Text,
                                        Edit6.Text,
                                        false,
                                        false
                                        ]);
          DataSource5.DataSet.Refresh;
          ConnectSQL(ADOQuery5,'Select * from Clients Where Name="'+Edit3.Text+'";');
          DataSource5.DataSet.Locate('Address',Edit4.Text,[]);
          ClientNum:=DataSource5.DataSet.FieldValues['Id'];
        end;
      ADOTable1.Active:=True;                  // добавление устройства в ремонт
      DataSource4.DataSet.AppendRecord([nil,                                    // Id
                                        MasterId,                               // MasterId
                                        ClientNum,                              // ClientId
                                        1,                                      // Status
                                        DateToStr(DateTimePicker1.Date),        // GetDate
                                        DataSource3.DataSet.FieldValues['Id'],  // Type
                                        DataSource2.DataSet.FieldValues['Id'],  // Firm
                                        Edit1.Text,                             // Model
                                        Edit2.Text,                             // Number
                                        Edit8.Text,                             // Complection
                                        Edit9.Text,                             // Diagnose
                                        CheckBox1.Checked,                      // Attention1
                                        false,                                  // Attention2
                                        false,                                  // Erased
                                        StrToInt(Edit7.Text),                   // DocNum
                                        Memo1.Lines                             // MemoField
                                       ]);
      ADOTable1.Active:=False;
      SpeedButton1Click(Self);
      MainForm.Sorting;
    end;
  if PageControl1.TabIndex=3 then SpeedButton4.Caption:='готово'
                             else SpeedButton4.Caption:='далее';
  HeaderComment;
end;

procedure TForm5.Label13Click(Sender: TObject);
begin
  MainForm.N10Click(Self);
  FillCombos;
end;

procedure TForm5.Label13MouseEnter(Sender: TObject);
begin
  Label13.Font.Style:=Label13.Font.Style+[fsUnderline];
end;

procedure TForm5.Label13MouseLeave(Sender: TObject);
begin
  Label13.Font.Style:=Label13.Font.Style-[fsUnderline];
end;

procedure TForm5.Label16Click(Sender: TObject);
begin
  try
    Application.CreateForm(TForm12, Form12);
    Form12.ShowModal;
  finally
    Form12.Hide;
    Form12.Free;
    FillCombos;
  end;
end;

procedure TForm5.Label17Click(Sender: TObject);
begin                                           // фирмы-производители устройств
  try
    Application.CreateForm(TForm10, Form10);
    Form10.ShowModal;
  finally
    Form10.Hide;
    Form10.Free;
    FillCombos;
  end;
end;

procedure TForm5.Label16MouseEnter(Sender: TObject);
begin
  Label16.Font.Style:=Label16.Font.Style+[fsUnderline];
end;

procedure TForm5.Label16MouseLeave(Sender: TObject);
begin
  Label16.Font.Style:=Label16.Font.Style-[fsUnderline];
end;

procedure TForm5.Label17MouseEnter(Sender: TObject);
begin
  Label17.Font.Style:=Label17.Font.Style+[fsUnderline];
end;

procedure TForm5.Label17MouseLeave(Sender: TObject);
begin
  Label17.Font.Style:=Label17.Font.Style-[fsUnderline];
end;

procedure TForm5.Label20Click(Sender: TObject);
begin
  DateTimePicker1.Date:=Date;
end;

procedure TForm5.Label20MouseEnter(Sender: TObject);
begin
  Label20.Font.Style:=Label20.Font.Style+[fsUnderline];
end;

procedure TForm5.Label20MouseLeave(Sender: TObject);
begin
  Label20.Font.Style:=Label20.Font.Style-[fsUnderline];
end;

procedure TForm5.SpeedButton2Click(Sender: TObject);
begin
  if Form23.Visible then Form23.Hide;
  if PageControl1.TabIndex>0 then PageControl1.TabIndex:=PageControl1.TabIndex-1;
  if PageControl1.TabIndex=5 then SpeedButton4.Caption:='готово'
                             else SpeedButton4.Caption:='далее';
  HeaderComment;
end;

procedure TForm5.HeaderComment;
begin
  glWizardHeader1.Comments.Clear;
  case PageControl1.TabIndex of
    0: begin
         glWizardHeader1.Comments.Text:='¬ыбор мастера по ремонту и даты прин€ти€ (шаг 1 из 4)';
         Button2.SetFocus;
       end;
    1: begin
         glWizardHeader1.Comments.Text:='—ведени€ об аппарате (шаг 2 из 4)';
         ComboBox1.SetFocus;
       end;
    2: begin
         glWizardHeader1.Comments.Text:='—ведени€ о заказчике (шаг 3 из 4)';
         Edit3.SetFocus;
       end;
    3: begin
         glWizardHeader1.Comments.Text:='«аметки (шаг 4 из 4)';
         Edit8.SetFocus;
       end;
  end;
  glWizardHeader1.Repaint;
end;

procedure TForm5.cbMasterListChange(Sender: TObject);
var
  TempQuery: TADOQuery;
begin
  if cbMasterList.Items.Objects[cbMasterList.ItemIndex] = Pointer(-MaxLongInt)
    then Label24.Caption:='нет'
    else
      begin
        TempQuery := OpenQuery([
            'SELECT COUNT(*) as VCount ',
            'FROM MainTable ',
            'WHERE (MasterId = :mId) AND (Status = 1)'
          ], [
            Param(ftInteger, Integer(cbMasterList.Items.Objects[cbMasterList.ItemIndex]))
          ]);
        try
          if TempQuery.RecordCount > 0 then
            Label24.Caption := IntToStr(TempQuery.FieldByName('VCount').AsInteger) + ' шт.';
        finally
          TempQuery.Free;
        end;
      end;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.OnMessage:=nil;
  Form23.Free;
end;

procedure TForm5.FillClient;
begin
  ConnectSQL(ADOQuery5,'Select * from Clients Where Id='+IntToStr(ClientNum)+';');
  if DataSource5.DataSet.FieldValues['Name']<>null then
      Edit3.Text:=DataSource5.DataSet.FieldValues['Name'];
  if DataSource5.DataSet.FieldValues['Address']<>null then
      Edit4.Text:=DataSource5.DataSet.FieldValues['Address'];
  if DataSource5.DataSet.FieldValues['PhoneH']<>null then
      Edit5.Text:=DataSource5.DataSet.FieldValues['PhoneH'];
  if DataSource5.DataSet.FieldValues['PhoneW']<>null then
      Edit6.Text:=DataSource5.DataSet.FieldValues['PhoneW'];
  Edit4.ReadOnly:=True;
  Edit5.ReadOnly:=True;
  Edit6.ReadOnly:=True;
  Button1.Enabled:=True;
  Label26.Caption:='старый клиент';
  Label26.Font.Style:=[];
  if DataSource5.DataSet.FieldValues['TooBad'] then
    begin
      Label26.Caption:='занесен в "черный список"';
      Label26.Font.Style:=[fsBold];
    end;
  if DataSource5.DataSet.FieldValues['TooGood'] then
    begin
      Label26.Caption:='занесен в "белый список"';
      Label26.Font.Style:=[fsBold];
    end;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  Edit4.Text:='';
    Edit4.ReadOnly:=False;
  Edit5.Text:='';
    Edit5.ReadOnly:=False;
  Edit6.Text:='';
    Edit6.ReadOnly:=False;
  Label26.Caption:='новый клиент';
  Label26.Font.Style:=[];  
  ClientNum:=0;
  Button1.Enabled:=False;
end;

procedure TForm5.TabSheet4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Form23.Visible then Form23.Hide;
end;

procedure TForm5.Label18Click(Sender: TObject);
begin
  if Form23.Visible then Form23.Hide;
end;

procedure TForm5.AppMessage(var Msg: TMsg; var Handled: Boolean);
var ShiftPressed: boolean;
begin                                             // перехват нажати€ кнопки Tab
  ShiftPressed:=false;
  if Msg.Message = WM_KEYDOWN then
    if not shiftPressed and (Msg.wParam = VK_SHIFT) then
          Exit
      else
        begin
          if Msg.wParam = VK_TAB then
            if shiftPressed=false then
              if (ActiveControl = cbMasterList) or (ActiveControl = Edit2) or
                 (ActiveControl = Edit6) then
                begin
                  SpeedButton4Click(Self);
                  Handled:=false;
                end;
        end;
end;

procedure TForm5.FillCombos;
var
  Previous, i: integer;
    TempQuery: TADOQuery;
begin
  Previous := -MaxLongInt;

  if cbMasterList.Items.Count > 0 then
    Previous := Integer(cbMasterList.Items.Objects[cbMasterList.ItemIndex]);
// заполнение мастеров организации
  cbMasterList.Items.BeginUpdate;
  try
    cbMasterList.Items.Clear;
    cbMasterList.Items.AddObject('Ќе определено', Pointer(-MaxLongInt));

    TempQuery := OpenQuery([
        'SELECT Id, ',
        '  (LastName+" "+Left(FirstName,1)+"."+Left(FatherName,1)+".") as Name ',
        'FROM Users ',
        'ORDER BY (LastName+" "+Left(FirstName,1)+"."+Left(FatherName,1)+".");'
      ], [nullparam]);
    try
      while not TempQuery.EOF do
      begin
        cbMasterList.Items.AddObject(TempQuery.FieldByName('Name').AsString,
                                  Pointer(TempQuery.FieldByName('id').AsInteger));
        TempQuery.Next;
      end;
    finally
      TempQuery.Free;
    end;

    if Previous > -MaxLongInt
      then cbMasterList.ItemIndex := cbMasterList.Items.IndexOfObject(Pointer(Previous))
      else cbMasterList.ItemIndex := 0;
  finally
    cbMasterList.Items.EndUpdate;
  end;

  cbMasterListChange(Self);

  MainForm.SetProgressValue(30,'');

// заполнение фирм-производителей
  Previous := -MaxLongInt;

  if ComboBox2.Items.Count > 0 then
    Previous := Integer(ComboBox2.Items.Objects[ComboBox2.ItemIndex]);

  ComboBox2.Items.BeginUpdate;
  try
    ComboBox2.Items.Clear;
    ComboBox2.Items.AddObject('Ќе определено', Pointer(-MaxLongInt));

    TempQuery := OpenQuery([
        'SELECT Id, Name ',
        'FROM Firms ',
        'ORDER BY Name asc);'
      ], [nullparam]);
    try
      while not TempQuery.EOF do
      begin
        ComboBox2.Items.AddObject(TempQuery.FieldByName('Name').AsString,
                                  Pointer(TempQuery.FieldByName('id').AsInteger));
        TempQuery.Next;
      end;
    finally
      TempQuery.Free;
    end;

    if Previous > -MaxLongInt
      then ComboBox2.ItemIndex := ComboBox2.Items.IndexOfObject(Pointer(Previous))
      else ComboBox2.ItemIndex := 0;
  finally
    ComboBox2.Items.EndUpdate;
  end;

  MainForm.SetProgressValue(60,'');
// заполнение фирм-производителей
  Previous := -MaxLongInt;

  if ComboBox1.Items.Count > 0 then
    Previous := Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);

  ComboBox1.Items.BeginUpdate;
  try
    ComboBox1.Items.Clear;
    ComboBox1.Items.AddObject('Ќе определено', Pointer(-MaxLongInt));

    TempQuery := OpenQuery([
        'SELECT Id, Name ',
        'FROM Types ',
        'ORDER BY Name asc);'
      ], [nullparam]);
    try
      while not TempQuery.EOF do
      begin
        ComboBox1.Items.AddObject(TempQuery.FieldByName('Name').AsString,
                                  Pointer(TempQuery.FieldByName('id').AsInteger));
        TempQuery.Next;
      end;
    finally
      TempQuery.Free;
    end;

    if Previous > -MaxLongInt
      then ComboBox1.ItemIndex := ComboBox1.Items.IndexOfObject(Pointer(Previous))
      else ComboBox1.ItemIndex := 0;
  finally
    ComboBox1.Items.EndUpdate;
  end;

  MainForm.SetProgressValue(0,'');
end;

procedure TForm5.CheckMoney;
var CategoryId: integer;
begin
  DataSource2.DataSet.Locate('Name',ComboBox2.Items.Strings[ComboBox2.ItemIndex],[]);
  DataSource3.DataSet.Locate('Name',ComboBox1.Items.Strings[ComboBox1.ItemIndex],[]);
// ------------------------
  ConnectSQL(MainForm.SmallNeedsQuery,'Select * from Firms Where Id='+
                           IntToStr(DataSource2.DataSet.FieldValues['Id'])+';');
  if MainForm.SmallNeedsQuery.FieldValues['Category']<>null then
      CategoryId:=MainForm.SmallNeedsQuery.FieldValues['Category']
    else CategoryId:=-1;
  MainForm.SmallNeedsQuery.Active:=False;
// ------------------------
  ConnectSQL(MainForm.SmallNeedsQuery,'Select * from Prices Where CategoryId='+IntToStr(CategoryId)+' and TypeId='+IntToStr(DataSource3.DataSet.FieldValues['Id'])+';');
  if MainForm.SmallNeedsQuery.RecordCount=0 then Label21.Caption:='не задана'
    else Label21.Caption:=FloatToStr(MainForm.SmallNeedsQuery.FieldValues['Price'])+MainForm.MoneyValue;
// ------------------------
  MainForm.SmallNeedsQuery.Active:=False;
end;

procedure TForm5.ComboBox1Change(Sender: TObject);
begin
  CheckMoney;
end;

procedure TForm5.ComboBox2Change(Sender: TObject);
begin
  CheckMoney;
end;

procedure TForm5.FormActivate(Sender: TObject);
begin
  CheckMoney;
end;

procedure TForm5.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Edit3.Text='' then
    begin
      Form23.Hide;
      Exit;
    end;
  if ClientNum<>0 then Button1.Click;
  if (Edit3.Text='') then
    begin
      Form23.ADOQuery1.Active:=False;
      Form23.Hide;
    end
                   else
    begin
      ConnectSQL(Form23.ADOQuery1,'Select * from Clients Where Name like "'+Edit3.Text+'%";');
      if Form23.DataSource1.DataSet.RecordCount>0 then
          begin
            Form23.Top:=Edit3.Top+Edit3.Height*2+Form5.Top+glWizardHeader1.Height+5;
            Form23.Left:=Form5.Left+Edit3.Left+5;
            with Form23 do
              SetWindowPos(Handle,
              HWND_TOPMOST,
              Left,
              Top,
              Width,
              Height,
              SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
            Form23.Show;
            Edit3.SetFocus;
            Edit3.SelStart:=Length(Edit3.Text);
          end
        else
          Form23.Hide;
    end;
  if (Edit3.Text<>'') and (Key=(vk_Escape)) then Form23.Hide;
  if (Edit3.Text<>'') and (Key=(vk_Return)) then
    begin
      ClientNum:=Form23.DataSource1.DataSet.FieldValues['Id'];
      FillClient;
      Form23.Hide;
      Edit3.SelStart:=Length(Edit3.Text);
    end;
  if (Edit3.Text<>'') and (Key=(vk_Down)) then
    if Form23.Visible then Form23.DataSource1.DataSet.Next;
  if (Edit3.Text<>'') and (Key=(vk_Up)) then
    if Form23.Visible then Form23.DataSource1.DataSet.Prior;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TForm5.N1Click(Sender: TObject);
var TryThis: integer;
begin
  if (Edit7.Text='') or (TryStrToInt(Edit7.Text,TryThis)=false) then
    begin
      ShowInfoMessage('«аполните, пожалуйста, поле "номер квитанции".','„то же ¬ы хотите провер€ть?',true);
      Exit;      
    end;
  if DocNumExists(StrToInt(Edit7.Text)) then
    ShowInfoMessage(' витанци€ с таким номером уже существует!','ѕроверка номера квитанции',true);
end;

procedure TForm5.Edit4Change(Sender: TObject);
var Street: string;
     stVar: string;
begin
  if not(EditAllowed) then Exit;
  if Pos('ул.',Edit4.Text)=0 then Exit;
  Street:=RightStr(Edit4.Text,Length(Edit4.Text)-Pos('ул.',Edit4.Text)-2);
  if Street='' then Exit;
  if Pos(' ',Street)<>0 then Exit;

  ConnectSQL(SmallNeedsQuery,'Select Address From Clients Where Address Like "%ул.'+Street+'%" Order by Address asc;');
  if SmallNeedsQuery.RecordCount=0 then
    begin
      SmallNeedsQuery.Active:=False;
      Exit;
    end;
  stVar:=RightStr(SmallNeedsQuery.FieldValues['Address'],
                  Length(SmallNeedsQuery.FieldValues['Address'])-
                  Pos('ул.'+Street,SmallNeedsQuery.FieldValues['Address'])-2);
  if Pos(' ',stVar)<>0 then stVar:=LeftStr(StVar,Pos(' ',stVar));
  stVar:=RightStr(stVar,Length(stVar)-Length(Street));

  Edit4.Text:=Edit4.Text+stVar;
  Edit4.SelStart:=Length(Edit4.Text)-Length(stVar);
  Edit4.SelLength:=Length(stVar);

  SmallNeedsQuery.Active:=False;
end;

procedure TForm5.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_Back then EditAllowed:=false else EditAllowed:=true;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
// инициализаци€ переменных
  ClientNum:=0;
  DateTimePicker1.Date:=Date;
// -------------------
  Image3.Picture:=Image1.Picture;
  Image4.Picture:=Image3.Picture;
  Image5.Picture:=Image4.Picture;
// -------------------

  FillCombos;

  ComboBox1.ItemIndex:=0;
  HeaderComment;

  N4Click(Self);

  PageControl1.TabIndex:=0;
  Button2.SetFocus;
end;

procedure TForm5.N4Click(Sender: TObject);
var NextNum: integer;                                      // номер квитанции +1
begin
  ConnectSQL(SmallNeedsQuery,'Select Max(DocNum) as MaxNum from MainTable;');
  if SmallNeedsQuery.FieldValues['MaxNum']=null then NextNum:=0
    else NextNum:=SmallNeedsQuery.FieldValues['MaxNum'];
  inc(NextNum);
  Edit7.Text:=IntToStr(NextNum);
  SmallNeedsQuery.Active:=False;
end;

procedure TForm5.N3Click(Sender: TObject);
var i: integer;                                     // поиск пропусков в номерах
    Previous: integer;
begin
  ConnectSQL(SmallNeedsQuery,'Select DocNum from MainTable Where Str(DocNum)<>"" Order by DocNum;');
  if SmallNeedsQuery.RecordCount<2 then
    begin
      SmallNeedsQuery.Active:=False;
      ShowInfoMessage('—лишком мало использовано квитанций дл€ поиска.','ѕоиск пропусков',true);
      Exit;
    end;
  SmallNeedsQuery.RecNo:=1;
  Previous:=SmallNeedsQuery.FieldValues['DocNum'];
  for i:=2 to SmallNeedsQuery.RecordCount do
    begin
      SmallNeedsQuery.RecNo:=i;
      if SmallNeedsQuery.FieldValues['DocNum']<>Previous+1
          then break
          else Previous:=SmallNeedsQuery.FieldValues['DocNum'];
    end;
  inc(Previous);
  SmallNeedsQuery.Locate('DocNum',Previous,[loCaseInsensitive]);
  if SmallNeedsQuery.FieldValues['DocNum']<>Previous then Edit7.Text:=IntToStr(Previous)
    else ShowInfoMessage('ѕропусков в номерах квитанций не найдено.','ѕоиск пропусков',true);
  SmallNeedsQuery.Active:=False;
end;

function TForm5.DocNumExists(Number: integer): boolean;
begin                                 // существует ли квитанци€ с таким номером
  ConnectSQL(SmallNeedsQuery,'Select * from MainTable Where DocNum='+Edit7.Text+';');
  if SmallNeedsQuery.RecordCount>0 then Result:=true else Result:=false;
  SmallNeedsQuery.Active:=False;
end;

end.
