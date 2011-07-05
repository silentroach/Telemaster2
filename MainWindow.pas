// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Модуль главного окна
//
//                                               by Калашников Игорь aka .silent
// -----------------------------------------------------------------------------

unit MainWindow;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, DateUtils, Buttons, Menus, ImgList, DBTables,
  StrUtils, GlPrgrs, Grids, VolDBGrid, ShellAPI, AppEvnts, TextTrayIcon, ElTree,
  CoolTrayIcon, DB, IniFiles, ADODB, FilterPanel, NoRecords, ToolWin, Windows,
  glSmallFontsDefence, ComObj, ExtCtrls, SyncObjs, ExcelXP, XPMan,

  tlValueTypes, tlConfig, tlDataBase,
  amDataBase;

type
  TClassRef = class of TObject;
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    tTime: TTimer;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ilMenu: TImageList;
    N9: TMenuItem;
    N10: TMenuItem;
    MonthPopup: TPopUpMenu;
    YearPopup: TPopUpMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    Panel2: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label4: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    N23: TMenuItem;
    N24: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N39: TMenuItem;
    glProgress1: TglProgress;
    dbgMain: TVolgaDBGrid;
    sbMain: TScrollBar;
    tiMain: TTextTrayIcon;
    aeMain: TApplicationEvents;
    N40: TMenuItem;
    N41: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    N58: TMenuItem;
    N60: TMenuItem;
    N25: TMenuItem;
    N61: TMenuItem;
    Label3: TLabel;
    MainConnection: TADOConnection;
    N67: TMenuItem;
    N68: TMenuItem;
    N69: TMenuItem;
    N70: TMenuItem;
    N71: TMenuItem;
    N72: TMenuItem;
    tbMain: TToolBar;
    N38: TMenuItem;
    N73: TMenuItem;
    Frame11: TFrame1;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ilCheckBoxes: TImageList;
    SmallNeedsQuery: TADOQuery;
    DataSource2: TDataSource;
    MainQuery: TADOQuery;
    DataSource3: TDataSource;
    Frame21: TFrame2;
    Bevel4: TBevel;
    Label5: TLabel;
    glSmallFontsDefence1: TglSmallFontsDefence;
    N59: TMenuItem;
    N79: TMenuItem;
    N80: TMenuItem;
    N81: TMenuItem;
    N82: TMenuItem;
    N83: TMenuItem;
    DataSource4: TDataSource;
    TableCaptions: TADOTable;
    N42: TMenuItem;
    N63: TMenuItem;
    N64: TMenuItem;
    N65: TMenuItem;
    N66: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N62: TMenuItem;
    N84: TMenuItem;
    N85: TMenuItem;
    N86: TMenuItem;
    N87: TMenuItem;
    N88: TMenuItem;
    cbMain: TCoolBar;
    Panel1: TPanel;
    N89: TMenuItem;
    N90: TMenuItem;
    N91: TMenuItem;
    N92: TMenuItem;
    N93: TMenuItem;
    N94: TMenuItem;
    N95: TMenuItem;
    oolBar1: TMenuItem;
    MainPopup: TPopupMenu;
    N96: TMenuItem;
    N97: TMenuItem;
    N98: TMenuItem;
    N99: TMenuItem;
    N100: TMenuItem;
    N101: TMenuItem;
    N102: TMenuItem;
    N103: TMenuItem;
    N104: TMenuItem;
    N105: TMenuItem;
    N106: TMenuItem;
    N107: TMenuItem;
    N108: TMenuItem;
    N109: TMenuItem;
    N110: TMenuItem;
    N111: TMenuItem;
    N112: TMenuItem;
    N113: TMenuItem;
    N114: TMenuItem;
    N115: TMenuItem;
    N116: TMenuItem;
    N117: TMenuItem;
    N118: TMenuItem;
    N119: TMenuItem;
    N120: TMenuItem;
    N121: TMenuItem;
    N122: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    ApplicationEvents2: TApplicationEvents;
    Image4: TImage;
    FlatSpeedButton1: TSpeedButton;
    FlatSpeedButton2: TSpeedButton;
    sbInRepair: TSpeedButton;
    sbRepaired: TSpeedButton;
    sbGuarantee: TSpeedButton;
    sbArchive: TSpeedButton;
    sbTrash: TSpeedButton;
    N123: TMenuItem;
    N124: TMenuItem;
    N125: TMenuItem;
    N126: TMenuItem;
    N128: TMenuItem;
    N129: TMenuItem;
    N132: TMenuItem;
    N127: TMenuItem;
    N130: TMenuItem;
    XPManifest1: TXPManifest;
    procedure tTimeTimer(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aeMainMinimize(Sender: TObject);
    procedure tiMainClick(Sender: TObject);
    procedure dbgMainTitleClick(Sender: TObject;
      Column: TVolgaColumn);
    procedure N46Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N68Click(Sender: TObject);
    procedure N69Click(Sender: TObject);
    procedure N70Click(Sender: TObject);
    procedure N72Click(Sender: TObject);
    procedure Frame11ElTree1DblClick(Sender: TObject);
    procedure dbgMainDrawCellAttr(Sender: TObject;
      Column: TVolgaColumn; AFont: TFont; var AColor: TColor;
      State: TGridDrawState);
    procedure sbMainChange(Sender: TObject);
    procedure N78Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N60Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure N57Click(Sender: TObject);
    procedure dbgMainDblClick(Sender: TObject);
    procedure dbgMainMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N83Click(Sender: TObject);
    procedure dbgMainColumnResized(Sender: TObject;
      Column: TVolgaColumn);
    procedure N25Click(Sender: TObject);
    procedure N73Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N63Click(Sender: TObject);
    procedure dbgMainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N80Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N84Click(Sender: TObject);
    procedure N81Click(Sender: TObject);
    procedure Frame11SpeedButton4Click(Sender: TObject);
    procedure N87Click(Sender: TObject);
    procedure N89Click(Sender: TObject);
    procedure N58Click(Sender: TObject);
    procedure N91Click(Sender: TObject);
    procedure N94Click(Sender: TObject);
    procedure oolBar1Click(Sender: TObject);
    procedure N64Click(Sender: TObject);
    procedure tbMainMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N122Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure ApplicationEvents2Exception(Sender: TObject; E: Exception);
    procedure FlatSpeedButton1Click(Sender: TObject);
    procedure FlatSpeedButton2Click(Sender: TObject);
    procedure sbInRepairClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Frame11Button3Click(Sender: TObject);
    procedure Frame11Button2Click(Sender: TObject);
    procedure Frame11Button1Click(Sender: TObject);
    procedure N124Click(Sender: TObject);
    procedure N126Click(Sender: TObject);
    procedure N129Click(Sender: TObject);
    procedure N130Click(Sender: TObject);
    procedure N132Click(Sender: TObject);
  private
    MasterTree, TypeTree, FirmTree: TElTreeItem;          // объекты дерева фильтра
    function NullBase: boolean;                           // есть ли в базе что-нибудь?
    procedure SetAllEnabled;                              // все пункты меню - доступны
    procedure MenuDisable;                                // отключение некоторых пунктов меню
    procedure HideButtons;                                // отключение кнопок по пунктам меню
    procedure HintVisible(Sender: TObject);               // видим ли мы hint?
    procedure FillFilterPanel;                            // заполнение панели фильтров
    procedure FilterPanelShowHide(Show: boolean);         // показ/убирание фильтрующей панели
    procedure FilterApply;                                // применение фильтра
    procedure XLSetCellValue(Row,Column: integer; Value: string);
    procedure BaseCompress(ShowInfo: boolean);            // сжатие базы данных
    procedure FillYearFilterMenu;                         // заполнение меню фильтрации по году
    procedure SetClientStatus(Id: integer; Status: integer); // черный-белый список или снять
    procedure BackUp(ShowInfo: boolean);                  // резервирование базы данных
    procedure GuarantyCheck;                              // проверка даты гарантии
    procedure DeleteLastErased;                           // удаление из корзины последнего
  public
    ClassRef: TClassRef;
    Config: TIniFile;                                     // config-файл
    Configuration: TConfig;                               // настройки окна
    function MoneyValue: string;                          // денюжки
    function GetValue(ValueType: TValuesType): string;    // универсальный ответчик
    procedure SetProgressValue(Percent: integer;
                               Caption: string);          // задание Progress'у значений
    procedure ColumnsBuild;                               // построение колонок гл.таблицы
    procedure Sorting;                                    // сортировка
    procedure ToolBarConstruct;                           // построение ToolBar'а
  end;

var
       MainForm: TMainForm;
          XL: Variant;
  CheckEvent: TEvent;

implementation

uses Users, Adding, AboutBox, FindThat, Config, Splash, Phone, Firms,
  AppType, Details, MasterReport, MarkRepaired, Sending,
  Properties, VisibleColumns, Calculator, Clients,
  GoodWork, EarnReport, ClientDial, ToolBarConfig, Addition, ChangeClientInfo,
  MailMessage, Security, Login;

{$R *.dfm}

procedure TMainForm.tTimeTimer(Sender: TObject);
begin
  if (SecondOf(Time)<10) or ((SecondOf(Time)>30) and (SecondOf(Time)<40))
                       then Label4.Caption := IntToStr(DayOf(Date))+' '+
                                            MonthName(MonthOf(Date))+', '+
                                            IntToStr(YearOf(Date))
                       else Label4.Caption := TimeToStr(Time)
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.SpeedButton4Click(Sender: TObject);
begin
  N10.Click;
end;

procedure TMainForm.N10Click(Sender: TObject);
begin                                   // открытие окна с мастерами организации
  if MainForm.Configuration.UserType=2 then
    begin
      ShowInfoMessage('У Вас отсутствуют права на просмотр этой информации. Для редактирования работников необходимо иметь права начальника или администратора.','Работники организации',true);
      Exit;
    end;
  try
    Application.CreateForm(TForm2, Form2);
    Form2.ShowModal;
  finally
    Form2.Hide;
    FillFilterPanel;
    Form2.Free;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var  BaseFile: string;
    TempQuery: TADOQuery;
begin
  GradientRect(clWhite,15000804,Image4.Canvas);
  GradientRect(clWhite,15000804,Frame21.Image2.Canvas);
  GradientRect(clWhite,$00DADADA,Frame11.Image1.Canvas);
// ----------------------------------- проверка на запуск второй копии программы
  CheckEvent :=  TEvent.Create(nil, false, true, 'MYPROGRAM_CHECKEXIST');
  If CheckEvent.WaitFor(10) <> wrSignaled then
    begin
      ShowInfoMessage('Извините, но второй раз программу запускать совсем незачем!'#13'Возможно, Вы свернули программу в system tray?','Второй запуск программы');
      Application.Terminate;
    end;
// ------------------------
  Form3.SetLoadText('..::  инициализация глобальных переменных  ::..');
  Application.ProcessMessages;
// инициализация переменных
  Config := TIniFile.Create(ChangeFileExt(paramstr(0),'.ini'));
// продолжаем...
  Application.HintHidePause := 15000;
  Application.OnHint := HintVisible;
  Configuration.SortColumn := 0;
  Configuration.SortType := vsmDown;
  Configuration.FilterMonth := 0;
  Configuration.FilterYear := 0;
  Configuration.VisionStatus := 1;
  Configuration.OtherFilter := '';
  Configuration.LongColor := Config.ReadBool('Main','LongColor',false);
// цвета
  ColorApply(MainForm);
  Application.ProcessMessages;
// пункт меню "помощь" справа
  ModifyMenu(MainMenu.Handle, 6, mf_ByPosition or mf_Popup or mf_Help,
             N5.Handle, 'Помощь');
// подключение базы данных
  BaseFile := Config.ReadString('Main','BasePath',ExtractFilePath(paramstr(0))+ExtractFileName(ChangeFileExt(paramstr(0),'.dat')));
  if FileExists(BaseFile)=false then
    begin
      BaseFile := ExtractFilePath(paramstr(0)) + ExtractFileName(ChangeFileExt(paramstr(0),'.dat'));
      if FileExists(BaseFile) then Config.WriteString('Main','BasePath',BaseFile)
        else
          begin
            ShowInfoMessage('Файл базы данных не обнаружен. Проверьте наличие такового.'#13'При возникновении проблем обращайтесь к разработчику программы...','Внимание',true);
            Application.Terminate;
          end;
    end;

  DataBase := TDataBase.Create(Application, BaseFile);
  MainQuery.Connection := DataBase.MainConnection;

// заполнение панели фильтрации
  Form3.SetLoadText('..::  заполнение данных для фильтрации и сортировка  ::..');
  GuarantyCheck;
  FillFilterPanel;
  FillYearFilterMenu;
// автоматическое проставление даты при необходимости
  if Config.ReadBool('Main','AutoFilterApply',true) then
    begin
      Configuration.FilterMonth := MonthOf(Date);
      Label1.Caption := MonthName(MonthOf(Date));
      Configuration.FilterYear := YearOf(Date);
      Label2.Caption := IntToStr(YearOf(Date))+' год';
    end;                     
// ----------
  TableCaptions.Active := True;
  ColumnsBuild;
// автоматическое создание резервной копии при необходимости
  if Config.ReadBool('BackUp','Auto',false) then
    if Config.ReadDate('BackUp','NextDate',Date)=Date then
      begin
        Backup(Config.ReadBool('BackUp','InSilent',true));
        Case Config.ReadInteger('BackUp','AutomateDate',2) of
          1: Config.WriteDate('BackUp','NextDate',IncDay(Date,1));
          2: Config.WriteDate('BackUp','NextDate',IncMonth(Date,1));
          3: Config.WriteDate('BackUp','NextDate',IncYear(Date,1));
        end;
      end;
// построение ToolBar'а
  ToolBarConstruct;
// сортировка
  Sorting;
// login
  TempQuery := OpenQuery([
      'SELECT * FROM passwords'
    ], [nullparam]);
  try
    if TempQuery.RecordCount = 0 then Configuration.UserType := 1 else
      try
        Application.CreateForm(TForm37, Form37);
        Form37.ShowModal;
      finally
        Form37.Hide;
        Form37.Free;
      end;
  finally
    TempQuery.Free;
  end;
end;

procedure TMainForm.N29Click(Sender: TObject);
begin                                                     // запуск калькулятора
  try
    Application.CreateForm(TForm26, Form26);
    Form26.ShowModal;
  finally
    Form26.Hide;
    Form26.Free;
  end;
end;

procedure TMainForm.N31Click(Sender: TObject);
var   Success: boolean;
    TempQuery: TADOQuery;
begin                                                     // добавление аппарата
  Success := true;

  TempQuery := OpenQuery([
    'SELECT COUNT(*) as VCount FROM Firms;'], [nullparam]);
  try
    if TempQuery.FieldByName('VCount').AsInteger = 0 then Success := false;
  finally
    TempQuery.Free;
  end;

  TempQuery := OpenQuery([
    'SELECT COUNT(*) AS VCount FROM Types;'], [nullparam]);
  try
    if TempQuery.FieldByName('VCount').AsInteger = 0 then Success := false;
  finally
    TempQuery.Free;
  end;

  if Success = false then
  begin
    ShowInfoMessage('У Вас не готовы справочники типов и фирм.'#13'Сначала заполните их.','Добавление устройства',true);
    Exit;
  end;

  try
    Application.CreateForm(TForm5, Form5);
    Form5.ShowModal;
  finally
    Form5.Hide;
    Form5.Free;
  end;
end;

procedure TMainForm.N32Click(Sender: TObject);
begin                                                       // изменение свойств
  if Configuration.VisionStatus=5 then Exit;
  try
    Application.CreateForm(TForm21, Form21);
    Form21.ShowModal;
  finally
    Form21.Hide;
    Form21.Free;
  end;
end;

procedure TMainForm.N8Click(Sender: TObject);
begin                                                          // о программе...
  try
    Application.CreateForm(TForm6, Form6);
    Form6.ShowModal;
  finally
    Form6.Hide;
    Form6.Free;
  end;
end;

procedure TMainForm.N36Click(Sender: TObject);
begin                                                          // поиск аппарата
  if NullBase then
    begin
      ShowInfoMessage('Проводить поиск устройства на пустой базе данных смысла нет.'#13'Сначала добавьте какое-нибудь устройство в ремонт.','Поиск устройства',true);
      Exit;
    end;
// ---------------
  try
    Application.CreateForm(TForm7, Form7);
    Form7.ShowModal;
  finally
    Form7.Hide;
    Form7.Free;
  end;
end;

procedure TMainForm.N2Click(Sender: TObject);
begin                                                     // настройки программы
  if Configuration.UserType<>1 then
    begin
      ShowInfoMessage('У Вас отсутствуют права на изменение этой информации. Для изменения настроек необходимо иметь права администратора.','Настройка программы',true);
      Exit;
    end;
  try
    Application.CreateForm(TForm8, Form8);
    Form8.ShowModal;
  finally
    Form8.Hide;
    Form8.Free;
    ColorApply(MainForm);
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var HowMuch, i: integer;
     TempQuery: TADOQuery;
begin                   
  if ShowQuestionMessage('Вы действительно хотите выйти из программы?',
                         'Выход из программы')=false then Action := caNone
    else
      begin
      // ------ удаление из корзины ВСЕГО
        if Config.ReadBool('Trash','AutoEmpty',false)=true then
          begin
            TempQuery := OpenQuery([
              'SELECT COUNT(*) AS DelCount FROM Deleted;'], [nullparam]);
            try
              if TempQuery.FieldValues['DelCount'] <> null
                then HowMuch := TempQuery.FieldByName('DelCount').AsInteger
                else HowMuch := 0;
            finally
              TempQuery.Free;
            end;

            for i := 0 to HowMuch do
              DeleteLastErased;
          end;
      // --------------------------------
        TableCaptions.Active := False;
      // сжимаем базу при необходимости
        MainConnection.Connected := False;
        if Config.ReadBool('Main','CompressBase',false) then BaseCompress(false);
      // ------------------------------
        if Config.ReadBool('BackUp','Auto',false) then
          if Config.ReadInteger('BackUp','AutomateType',1)=4 then
            Backup(not(Config.ReadBool('BackUp','InSilent',true)));
        Config.Free;
      end;
end;

procedure TMainForm.aeMainMinimize(Sender: TObject);
begin
  if Config.ReadBool('Main','MinimizeToTray',true) then
    with tiMain do
    begin
      HideMainForm;
      IconVisible := True;
      ShowBalloonHint('Телемастер v2.00',
        'Программа свернулась в system tray. Для вызова главного окна, просто щелкните по этой иконке.',
        bitInfo,10);
    end;
end;

procedure TMainForm.tiMainClick(Sender: TObject);
begin
  with tiMain do
  begin
    IconVisible := False;
    ShowMainForm;
  end;
end;

procedure TMainForm.SetProgressValue(Percent: integer;Caption: string);
begin
  glProgress1.Percent := Percent;
  if Caption<>'' then glProgress1.Caption := Caption;
end;

procedure TMainForm.Sorting;
begin
// ставим метку в VolgaDBGrid на поле, по которому производится сортировка
  dbgMain.Columns[Configuration.SortColumn].SortMark := Configuration.SortType;
  dbgMain.Hint := '';
// генерация SQL-запроса к главной базе
  MainQuery.Active := False;
  MainQuery.SQL.Clear;
  MainQuery.SQL.Add('SELECT MainTable.*, (Users.LastName+" "+Left(Users.FirstName,1)+"."+Left(Users.FatherName,1)+".") AS MasterName, Clients.Name AS ClientName, Clients.PhoneH as ClientHPhone, Clients.PhoneW as ClientWPhone, Clients.Address as ClientAddress,');
  MainQuery.SQL.Add('Firms.Name AS FirmName, Types.Name AS TypeName, (Types.Name+" "+Firms.Name+" "+Model) AS Name');
  MainQuery.SQL.Add('FROM Firms RIGHT JOIN (Types RIGHT JOIN (Users RIGHT JOIN (Clients RIGHT JOIN MainTable ON Clients.Id=MainTable.ClientId) ON Users.Id=MainTable.MasterId) ON Types.Id=MainTable.Type) ON Firms.Id=MainTable.Firm');
  if Configuration.VisionStatus<>5 then
      begin
        MainQuery.SQL.Add('Where (Status='+IntToStr(Configuration.VisionStatus)+')');
        MainQuery.SQL.Add(' and (Erased=false)')
      end
    else
      MainQuery.SQL.Add('Where (Erased=true)');
  if Configuration.VisionStatus=3 then MainQuery.SQL.Add(' and (Attention2=false)');
  if Configuration.OtherFilter<>'' then MainQuery.SQL.Add(' and ');
  MainQuery.SQL.Add(Configuration.OtherFilter);
       // фильтрация по году и месяцу
  if Configuration.FilterYear<>0 then
    MainQuery.SQL.Add(' and (Year(GetDate)='+IntToStr(Configuration.FilterYear)+')');
  if Configuration.FilterMonth<>0 then
    MainQuery.SQL.Add(' and (Month(GetDate)='+IntToStr(Configuration.FilterMonth)+')');
       // сортировка по...
  DataSource4.DataSet.Locate('FieldCaption', dbgMain.Columns[Configuration.SortColumn].Title.Caption,[]);
  MainQuery.SQL.Add('Order by '+DataSource4.DataSet.FieldValues['SQL']+' ');
  if Configuration.SortType=vsmDown then MainQuery.SQL.Add('asc')
                                    else MainQuery.SQL.Add('desc');
       // конец SQL-кода
  MainQuery.SQL.Add(';');
  MainQuery.Active := True;
// показ сообщения, если нет записей по выбранному фильтру
  if DataSource3.DataSet.RecordCount>0 then Frame21.Visible := False
                                       else
    begin
      Frame21.Shape1.Brush.Color  :=  dbgMain.Color;
      Frame21.Visible := True;
    end;
// задание минимума и максимума ScrollBar'а
  sbMain.Min := 1;
  if DataSource3.DataSet.RecordCount>0 then sbMain.Max := DataSource3.DataSet.RecordCount
                                       else sbMain.Max := 1;
  sbMain.PageSize := 1;
// ---------------------- работаем с менюшками и кнопками
  SetAllEnabled;
  MenuDisable;
  HideButtons;
end;

procedure TMainForm.dbgMainTitleClick(Sender: TObject;
  Column: TVolgaColumn);
begin
  if Column.Index=Configuration.SortColumn then
      if Configuration.SortType=vsmDown then Configuration.SortType := vsmUp
                                        else Configuration.SortType := vsmDown
    else
      begin
        Configuration.SortColumn := Column.Index;
        Configuration.SortType := vsmDown;
      end;
  Sorting;
end;

procedure TMainForm.N46Click(Sender: TObject);
begin
  sbInRepair.Click;
end;

procedure TMainForm.N47Click(Sender: TObject);
begin
  sbRepaired.Click;
end;

procedure TMainForm.N48Click(Sender: TObject);
begin
  sbGuarantee.Click;
end;

procedure TMainForm.N49Click(Sender: TObject);
begin
  sbArchive.Click;
end;

procedure TMainForm.N51Click(Sender: TObject);
begin
  sbTrash.Click;
end;

procedure TMainForm.N26Click(Sender: TObject);
begin                                                          // фильтр по году
  Configuration.FilterYear := (Sender as TMenuItem).Tag;
  Label2.Caption := (Sender as TMenuItem).Caption;
  Sorting;
end;

procedure TMainForm.HintVisible(Sender: TObject);
var HintString: string;
             i: integer;
       success: boolean;
begin
  HintString := Application.Hint;
  Success := true;
  for i := 1 to Length(HintString) do
    if HintString[i]=#13 then
      begin
        success := false;
        break;
      end;
  if Success then Label3.Caption := Application.Hint;
end;

procedure TMainForm.N52Click(Sender: TObject);
begin                                                         // записная книжка
  try
    Application.CreateForm(TForm9, Form9);
    Form9.ShowModal;
  finally
    Form9.Hide;
    Form9.Free;
  end;
end;

procedure TMainForm.N68Click(Sender: TObject);
begin                                                     // фирмы-производители
  try
    Application.CreateForm(TForm10, Form10);
    Form10.ShowModal;
  finally
    Form10.Hide;
    FillFilterPanel;
    Form10.Free;
  end;
end;

procedure TMainForm.N69Click(Sender: TObject);
begin                                                          // типы устройств
  try
    Application.CreateForm(TForm12, Form12);
    Form12.ShowModal;
  finally
    Form12.Hide;
    FillFilterPanel;
    Form12.Free;
  end;
end;

procedure TMainForm.N70Click(Sender: TObject);
begin
  if Configuration.UserType=3 then
    begin
      ShowInfoMessage('У Вас отсутствуют права на использование данной функции!','Ошибка',true);
      Exit;
    end;

  if DataSource3.DataSet.RecordCount>0 then
    try
      Application.CreateForm(TForm13, Form13);
      Form13.ShowModal;
    finally
      Form13.Hide;
      Form13.Free;
    end;
end;

procedure TMainForm.N72Click(Sender: TObject);
begin                                                                  // отчеты
  if Configuration.UserType=2 then
  begin
    ShowInfoMessage('У Вас отсутствуют права на просмотр этой информации. Для просмотра отчетов необходимо иметь учетную запись начальника или администратора.','Отчеты',true);
    Exit;
  end;

  if NullBase then
  begin
    ShowInfoMessage('Не могу сформировать отчет по пустой базе!','Внимание',true);
    Exit;
  end;
// ---------------------
  try
    Application.CreateForm(TForm14, Form14);
    Form14.ShowModal;
  finally
    Form14.Hide;
    Form14.Free;
  end;
end;

procedure TMainForm.FillFilterPanel;
var i: integer;
    NewItem: TElTreeItem;
begin
  with Frame11 do
  begin
    ElTree1.Items.Clear;
  // фильтр по мастерам
  //--------------------------------------------------------------------------
    ConnectSQL(ADOQuery1,'Select * from Users order by (LastName+FirstName+FatherName) asc;');
    MasterTree := ElTree1.Items.AddItem(nil);
    MasterTree.Text := 'Мастер ('+IntToStr(DataSource1.DataSet.RecordCount)+')';

    NewItem := ElTree1.Items.AddItem(MasterTree);
    NewItem.Text := 'Выделить все';
    NewItem.Tag := -1;
    NewItem := ElTree1.Items.AddItem(MasterTree);
    NewItem.Text := 'Снять все выделения';
    NewItem.Tag := 0;

    for i := 1 to DataSource1.DataSet.RecordCount do
    begin
      DataSource1.DataSet.RecNo := i;
      NewItem := ElTree1.Items.AddItem(MasterTree);
      NewItem.Text := DataSource1.DataSet.FieldValues['LastName']+' '+
                      LeftStr(DataSource1.DataSet.FieldValues['FirstName'],1)+'.'+
                      LeftStr(DataSource1.DataSet.FieldValues['FatherName'],1)+'.';
      NewItem.Tag := DataSource1.DataSet.FieldValues['Id'];
      NewItem.ImageIndex := 1;
    end;
  // фильтр по типу оборудования
  //--------------------------------------------------------------------------
    ConnectSQL(ADOQuery1,'Select * from Types Order by Name asc;');
    TypeTree := ElTree1.Items.AddItem(nil);
    TypeTree.Text := 'Тип оборудования ('+IntToStr(DataSource1.DataSet.RecordCount)+')';

    NewItem := ElTree1.Items.AddItem(TypeTree);
    NewItem.Text := 'Не фильтровать по типу';
    NewItem.Tag := -1;
    NewItem := ElTree1.Items.AddItem(TypeTree);
    NewItem.Text := 'Снять все выделения';
    NewItem.Tag := 0;

    for i := 1 to DataSource1.DataSet.RecordCount do
    begin
      DataSource1.DataSet.RecNo := i;

      NewItem := ElTree1.Items.AddItem(TypeTree);
      NewItem.Text := DataSource1.DataSet.FieldValues['Name'];
      NewItem.Tag := DataSource1.DataSet.FieldValues['Id'];
      NewItem.ImageIndex := 1;
    end;
  // фильтр по фирме-производителю
  //--------------------------------------------------------------------------
    ConnectSQL(ADOQuery1,'Select * from Firms Order by Name asc;');
    FirmTree := ElTree1.Items.AddItem(nil);
    FirmTree.Text := 'Фирма-производитель ('+IntToStr(DataSource1.DataSet.RecordCount)+')';

    NewItem := ElTree1.Items.AddItem(FirmTree);
    NewItem.Text := 'Не фильтровать по фирме';
    NewItem.Tag := -1;
    NewItem := ElTree1.Items.AddItem(FirmTree);
    NewItem.Text := 'Снять все выделения';
    NewItem.Tag := 0;

    for i := 1 to DataSource1.DataSet.RecordCount do
    begin
      DataSource1.DataSet.RecNo := i;

      NewItem := ElTree1.Items.AddItem(FirmTree);
      NewItem.Text := DataSource1.DataSet.FieldValues['Name'];
      NewItem.Tag := DataSource1.DataSet.FieldValues['Id'];
      NewItem.ImageIndex := 1;
    end;
  end;
  ADOQuery1.Active := False;
end;

procedure TMainForm.Frame11ElTree1DblClick(Sender: TObject);
var i: integer;
begin
  if (Frame11.ElTree1.Selected.Parent<>nil) and (Frame11.ElTree1.Selected<>nil) then
    case Frame11.ElTree1.Selected.Tag of
     -1: For i := 2 to Frame11.ElTree1.Selected.Parent.ChildrenCount-1 do
           Frame11.ElTree1.Selected.Parent.Children[i].ImageIndex := 1;
      0: For i := 2 to Frame11.ElTree1.Selected.Parent.ChildrenCount-1 do
           Frame11.ElTree1.Selected.Parent.Children[i].ImageIndex := 0;
    else if Frame11.ElTree1.Selected.ImageIndex=0 then Frame11.ElTree1.Selected.ImageIndex := 1
                                                  else Frame11.ElTree1.Selected.ImageIndex := 0;
    end;
end;

procedure TMainForm.dbgMainDrawCellAttr(Sender: TObject;
  Column: TVolgaColumn; AFont: TFont; var AColor: TColor;
  State: TGridDrawState);
begin
  if AColor = dbgMain.HighlightColor then
    begin
      if sbMain.Position <> DataSource3.DataSet.RecNo then
        sbMain.Position := DataSource3.DataSet.RecNo;
        
      if DataSource3.DataSet.RecordCount > 0 then
          Label5.Caption := IntToStr(DataSource3.DataSet.RecNo)+' : '+IntToStr(DataSource3.DataSet.RecordCount)
        else Label5.Caption := '0 : 0';
    end;
  if DataSource3.DataSet.RecordCount>0 then
    begin
      if (DataSource3.DataSet.FieldValues['Attention1']=true) and (Configuration.VisionStatus<3) then AFont.Color := Config.ReadInteger('Colors','Attention2',0);
      if DataSource3.DataSet.FieldValues['MasterId']=0 then AFont.Color := Config.ReadInteger('Colors','Attention1',0);
      if Configuration.VisionStatus=2 then
        if Configuration.LongColor=true then
          if (DaysBetween(Date,StrToDate(GetValue(vtRepairDate)))>7) then
            AFont.Color := Config.ReadInteger('Colors','Attention3',0);
      if DataSource3.DataSet.FieldValues['Attention2']=true then AFont.Color := Config.ReadInteger('Colors','Attention4',0);
    end;
end;

procedure TMainForm.sbMainChange(Sender: TObject);
begin
  if DataSource3.DataSet.RecordCount>0 then
    DataSource3.DataSet.RecNo := sbMain.Position;
end;

procedure TMainForm.FilterApply;
var i: integer;
    n: integer;
    MasterStr, TypeStr, FirmStr: string;
    Needed: boolean;
begin                                     // применение фильтров из левой панели
// -----------------------------------------------------------------------------
// МАСТЕРА
// -----------------------------------------------------------------------------
  // проверка нужности генерации SQL-фильтра для мастеров
  Needed := true;
  for i := 2 to MasterTree.ChildrenCount-1 do
    if MasterTree.Children[i].ImageIndex=1 then Needed := false;
  if Needed=true then
    begin
      ShowInfoMessage('В фильтре по мастеру должен быть выделен хотя бы один человек!','Внимание',true);
      Exit;
    end;
  for i := 2 to MasterTree.ChildrenCount-1 do
    if MasterTree.Children[i].ImageIndex=0 then Needed := true;
  if Needed=false then MasterStr := ''
                  else
    begin  // если нужно сгенерить
      n := 0;
      MasterStr := '(MasterId in (';
      for i := 2 to MasterTree.ChildrenCount-1 do
        if MasterTree.Children[i].ImageIndex=1 then
          begin
            if n<>0 then MasterStr := MasterStr+',';
            MasterStr := MasterStr+IntToStr(MasterTree.Children[i].Tag);
            inc(n);
          end;
      MasterStr := MasterStr+'))';
    end;
// -----------------------------------------------------------------------------
// ТИПЫ
// -----------------------------------------------------------------------------
  // проверка нужности генерации SQL-фильтра для типов
  Needed := true;
  for i := 2 to TypeTree.ChildrenCount-1 do
    if TypeTree.Children[i].ImageIndex=1 then Needed := false;
  if Needed=true then
    begin
      ShowInfoMessage('В фильтре по типу должен быть выделен хотя бы один тип!','Внимание',true);
      Exit;
    end;
  for i := 2 to TypeTree.ChildrenCount-1 do
    if TypeTree.Children[i].ImageIndex=0 then Needed := true;
  if Needed=false then TypeStr := ''
                  else
    begin  // если нужно сгенерить
      n := 0;
      TypeStr := '(Type in (';
      for i := 2 to TypeTree.ChildrenCount-1 do
        if TypeTree.Children[i].ImageIndex=1 then
          begin
            if n<>0 then TypeStr := TypeStr+',';
            TypeStr := TypeStr+IntToStr(TypeTree.Children[i].Tag);
            inc(n);
          end;
      TypeStr := TypeStr+'))';
    end;
// -----------------------------------------------------------------------------
// ФИРМЫ
// -----------------------------------------------------------------------------
  // проверка нужности генерации SQL-фильтра для фирмы
  Needed := true;
  for i := 2 to FirmTree.ChildrenCount-1 do
    if FirmTree.Children[i].ImageIndex=1 then Needed := false;
  if Needed=true then
    begin
      ShowInfoMessage('В фильтре по фирмам должен быть выделена хотя бы один фирма!','Внимание',true);
      Exit;
    end;
  for i := 2 to FirmTree.ChildrenCount-1 do
    if FirmTree.Children[i].ImageIndex=0 then Needed := true;
  if Needed=false then FirmStr := ''
                  else
    begin  // если нужно сгенерировать
      n := 0;
      FirmStr := '(Firm in (';
      for i := 2 to FirmTree.ChildrenCount-1 do
        if FirmTree.Children[i].ImageIndex=1 then
          begin
            if n<>0 then FirmStr := FirmStr+',';
            FirmStr := FirmStr+IntToStr(FirmTree.Children[i].Tag);
            inc(n);
          end;
      FirmStr := FirmStr+'))';
    end;

  Configuration.OtherFilter := MasterStr;
  if (Configuration.OtherFilter<>'') and
     (TypeStr<>'') then Configuration.OtherFilter := Configuration.OtherFilter+' and ';
  Configuration.OtherFilter := Configuration.OtherFilter+TypeStr;

  if (Configuration.OtherFilter<>'') and
     (FirmStr<>'') then Configuration.OtherFilter := Configuration.OtherFilter+' and ';
  Configuration.OtherFilter := Configuration.OtherFilter+FirmStr;

  if Configuration.OtherFilter<>'' then
    Configuration.OtherFilter := Configuration.OtherFilter;
  Sorting;
end;

procedure TMainForm.N78Click(Sender: TObject);
begin
  ShellExecute(handle,'open','http://www.roachart.by.ru',nil,nil,sw_shownormal);
end;

procedure TMainForm.N11Click(Sender: TObject);
begin
  if (Sender as TMenuItem).Tag<>0 then
      Label1.Caption := RightStr(((Sender as TMenuItem).Caption),Length((Sender as TMenuItem).Caption)-5)
    else Label1.Caption := (Sender as TMenuItem).Caption;
  Configuration.FilterMonth := (Sender as TMenuItem).Tag;
  Sorting;
end;

procedure TMainForm.N34Click(Sender: TObject);
var HowMuch, i: integer;
     TempQuery: TADOQuery;
begin                                             // удаление аппарата в корзину
  if Configuration.UserType=3 then
    begin
      ShowInfoMessage('У Вас отсутствуют права на использование данной функции!','Ошибка',true);
      Exit;
    end;

  if DataSource3.DataSet.RecordCount=0 then Exit;
  if Configuration.VisionStatus<>5 then
      begin
        if ShowQuestionMessage('Вы действительно хотите удалить аппарат в корзину?','Внимание')=true then
          begin
            FieldEdit(DataSource3,'Erased',true);
            // --------
            ExecuteQuery([
                'INSERT INTO Deleted (HardwareId) VALUES (:hId);'
              ], [
                Param(ftInteger, StrToInt(GetValue(vtId)))
              ]);

            // --------
            TempQuery := OpenQuery([
              'SELECT COUNT(*) AS DelCount FROM Deleted;'], [nullparam]);
            try
              HowMuch := TempQuery.FieldByName('DelCount').AsInteger -
                Config.ReadInteger('Trash', 'HowMuch', 15);
            finally
              TempQuery.Free;
            end;

            if HowMuch>0 then
              for i := 0 to HowMuch do DeleteLastErased;
            // --------
            Sorting;
          end;
      end
    else
      if ShowQuestionMessage('Вы действительно хотите удалить аппарат из корзины?','Внимание')=true then
        begin
          ExecuteQuery([
              'Delete * from Sended Where HardWareId = :hId'
            ], [
              Param(ftInteger, StrToInt(GetValue(vtId)))
            ]);

          ExecuteQuery([
              'Delete * from Repaired Where HardWareId = :hId'
            ], [
              Param(ftInteger, StrToInt(GetValue(vtId)))
            ]);

          ExecuteQuery([
              'Delete * from Details Where HardWareId = :hId'
            ], [
              Param(ftInteger, StrToInt(GetValue(vtId)))
            ]);

          ExecuteQuery([
              'Delete * from Deleted Where HardWareId = :hId'
            ], [
              Param(ftInteger, StrToInt(GetValue(vtId)))
            ]);

          ExecuteQuery([
              'Delete * from MainTable Where HardWareId = :hId'
            ], [
              Param(ftInteger, StrToInt(GetValue(vtId)))
            ]);

          Sorting;
        end;
end;

procedure TMainForm.N60Click(Sender: TObject);
begin                                               // восстановление из корзины
  if Configuration.UserType=3 then
    begin
      ShowInfoMessage('У Вас отсутствуют права на использование данной функции!','Ошибка',true);
      Exit;
    end;
    
  if DataSource3.DataSet.RecordCount>0 then
    if Configuration.VisionStatus=5 then
      begin
        FieldEdit(DataSource3,'Erased',false);
        Sorting;
      end;
end;

procedure TMainForm.N56Click(Sender: TObject);
begin                                 // пометка аппарата как отремотнированного
  if Configuration.UserType=3 then
    begin
      ShowInfoMessage('У Вас отсутствуют права на использование данной функции!','Ошибка',true);
      Exit;
    end;

  if GetValue(vtMasterName)='' then
    begin
      ShowInfoMessage('Вы все еще не поставили мастера, ответственного за ремонт данного устройства!','Внимание',true);
      Exit;
    end;
  if StrToInt(GetValue(vtDetailCount))=0 then
    if ShowQuestionMessage('Вы не использовали ни одной детали для ремонта данного устройства?'#13'Хотите ли вы редактировать список деталей?','Внимание')=true then
      begin
        N70.Click;
        Exit;
      end;      
  try
    Application.CreateForm(TForm19, Form19);
    Form19.ShowModal;
  finally
    Form19.Hide;
    Form19.Free;
    Sorting;
  end;
end;

procedure TMainForm.N57Click(Sender: TObject);
begin                                          // пометка аппарата как выданного
  if Configuration.UserType=3 then
    begin
      ShowInfoMessage('У Вас отсутствуют права на использование данной функции!','Ошибка',true);
      Exit;
    end;
    
  try
    Application.CreateForm(TForm20, Form20);
    Form20.ShowModal;
  finally
    Form20.Hide;
    Sorting;
    Form20.Free;
  end;
end;

procedure TMainForm.SetAllEnabled;
var i: integer;
begin                                      // все пункты меню сделать доступными
  for i := ComponentCount-1 downto 0 do
    if (Components[i] is TMenuItem) then
       (Components[i] as TMenuItem).Enabled := True;
end;

procedure TMainForm.MenuDisable;
begin                              // сделать недоступными некоторые пункты меню
  case Configuration.VisionStatus of
    1: begin
         N60.Enabled := False;
         N57.Enabled := False;
         N84.Enabled := False;
         N58.Enabled := False;
         N62.Enabled := False;
         N88.Enabled := False;
         N85.Enabled := False;
         N101.Enabled := False;
         N106.Enabled := False;
         N108.Enabled := False;
         N109.Enabled := False;
       end;
    2: begin
         N60.Enabled := False;
         N56.Enabled := False;
         N58.Enabled := False;
         N62.Enabled := False;
         N101.Enabled := False;
         N105.Enabled := False;
         N109.Enabled := False;
       end;
    3: begin
         N60.Enabled := False;
         N56.Enabled := False;
         N57.Enabled := False;
         N84.Enabled := False;
         N101.Enabled := False;
         N105.Enabled := False;
         N106.Enabled := False;
         N108.Enabled := False;
       end;
    4: begin
         N60.Enabled := False;
         N56.Enabled := False;
         N57.Enabled := False;
         N84.Enabled := False;
         N58.Enabled := False;
         N55.Enabled := False;
         N101.Enabled := False;
         N103.Enabled := False;
         N105.Enabled := False;
         N106.Enabled := False;
         N108.Enabled := False;
         N109.Enabled := False;
       end;
    5: begin
         N32.Enabled := False;
         N70.Enabled := False;
         N55.Enabled := False;
         N56.Enabled := False;
         N57.Enabled := False;
         N84.Enabled := False;
         N58.Enabled := False;
         N25.Enabled := False;
         N62.Enabled := False;
         N88.Enabled := False;
         N85.Enabled := False;
         N96.Enabled := False;
         N98.Enabled := False;
         N103.Enabled := False;
         N105.Enabled := False;
         N106.Enabled := False;
         N108.Enabled := False;
         N109.Enabled := False;
       end;
  end;
  if DataSource3.DataSet.RecordCount=0 then
    begin
      N32.Enabled := False;
      N70.Enabled := False;
      N34.Enabled := False;
      N60.Enabled := False;
      N56.Enabled := False;
      N57.Enabled := False;
      N84.Enabled := False;
      N58.Enabled := False;
      N64.Enabled := False;
      N94.Enabled := False;
      N95.Enabled := False;
      N93.Enabled := False;
      N120.Enabled := False;
      N66.Enabled := False;
      N63.Enabled := False;
      N45.Enabled := False;
      N25.Enabled := False;
      N62.Enabled := False;
      N88.Enabled := False;
      N85.Enabled := False;
      N96.Enabled := False;
      N98.Enabled := False;
      N99.Enabled := False;
      N101.Enabled := False;
      N103.Enabled := False;
      N105.Enabled := False;
      N106.Enabled := False;
      N108.Enabled := False;
      N109.Enabled := False;
      N104.Enabled := False;
      N110.Enabled := False;
      N111.Enabled := False;
      N112.Enabled := False;
      N113.Enabled := False;
      N116.Enabled := False;
      N117.Enabled := False;
      N118.Enabled := False;
      N119.Enabled := False;
      N55.Enabled := False;
      N42.Enabled := False;
    end;
end;

procedure TMainForm.dbgMainDblClick(Sender: TObject);
begin
  if DataSource3.DataSet.RecordCount>0 then
    N32.Click;
end;

procedure TMainForm.dbgMainMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin                                                // появление списка колонок
  if (dbgMain.MouseCoord(x,y).y = 0) and (Button = mbRight) then
    N83Click(Self);

  if (dbgMain.MouseCoord(x,y).y > 0) and (dbgMain.MouseCoord(x,y).y < DataSource3.DataSet.RecordCount + 1) and
     (button=mbRight) then MainPopup.Popup(Mouse.CursorPos.x,Mouse.CursorPos.y);
end;

procedure TMainForm.N83Click(Sender: TObject);
begin
  try
    Application.CreateForm(TVisibleColumnsForm, VisibleColumnsForm);
    VisibleColumnsForm.ShowModal;
  finally
    VisibleColumnsForm.Hide;
    VisibleColumnsForm.Free;
  end;
end;

procedure TMainForm.ColumnsBuild;
var i: integer;
  NewColumn: TVolgaColumn;
begin                                      // построение колонок главной таблицы
  TableCaptions.Requery([]);
  
  dbgMain.Columns.Clear;
  TableCaptions.Requery([]);
  for i := 1 to DataSource4.DataSet.RecordCount do
    begin
      DataSource4.DataSet.RecNo := i;
      if DataSource4.DataSet.FieldValues['Visible']=true then
        begin
          NewColumn := TVolgaColumn.Create(dbgMain.Columns);
          NewColumn.Title.Caption := DataSource4.DataSet.FieldValues['FieldCaption'];
          NewColumn.Width := DataSource4.DataSet.FieldValues['Width'];
          NewColumn.FieldName := DataSource4.DataSet.FieldValues['FieldName'];
          case DataSource4.DataSet.FieldValues['FieldAlign'] of
            1: NewColumn.Title.Alignment := taLeftJustify;
            2: NewColumn.Title.Alignment := taCenter;
            3: NewColumn.Title.Alignment := taRightJustify;
          end;
          case DataSource4.DataSet.FieldValues['ColumnAlign'] of
            1: NewColumn.Alignment := taLeftJustify;
            2: NewColumn.Alignment := taCenter;
            3: NewColumn.Alignment := taRightJustify;
          end;
          NewColumn.CanClick := True;
        end;
    end;
  Configuration.SortColumn := 0;
end;

procedure TMainForm.dbgMainColumnResized(Sender: TObject;
  Column: TVolgaColumn);
begin                                // поиск поля в базе и изменение его ширины
  DataSource4.DataSet.Locate('FieldCaption',Column.Title.Caption,[]);
  FieldEdit(DataSource4,'Width',Column.Width);
end;

function TMainForm.GetValue(ValueType: TValuesType): string;
var    Temp: extended;
  TempQuery: TADOQuery;
begin
  case ValueType of
             vtId: Result := IntToStr(DataSource3.DataSet.FieldValues['Id']);
        vtGetDate: Result := DateToStr(DataSource3.DataSet.FieldValues['GetDate']);
         vtHModel: if DataSource3.DataSet.FieldValues['Model']<>null then
                     Result := DataSource3.DataSet.FieldValues['Model'];
        vtHNumber: if DataSource3.DataSet.FieldValues['Number']<>null then
                     Result := DataSource3.DataSet.FieldValues['Number'];
         vtDocNum: if DataSource3.DataSet.FieldValues['DocNum']<>null then
                     Result := IntToStr(DataSource3.DataSet.FieldValues['DocNum']);
           vtMemo: if DataSource3.DataSet.FieldValues['MemoField']<>null then
                     Result := DataSource3.DataSet.FieldValues['MemoField'];
          vtCName: begin
                     TempQuery := OpenQuery([
                         'SELECT Name FROM Clients WHERE Id = :id'
                       ], [
                         Param(ftInteger, DataSource3.DataSet.FieldByName('ClientId').AsInteger)
                       ]);
                     try
                       if TempQuery.RecordCount = 0
                         then Result := 'не определен'
                         else Result := TempQuery.FieldByName('Name').AsString;
                     finally
                       TempQuery.Free;
                     end;
                   end;
       vtCAddress: begin
                     TempQuery := OpenQuery([
                         'SELECT Address FROM Clients WHERE Id = :id'
                       ], [
                         Param(ftInteger, DataSource3.DataSet.FieldByName('ClientId').AsInteger)
                       ]);
                     try
                       if TempQuery.RecordCount = 0
                         then Result := 'не определен'
                         else Result := TempQuery.FieldByName('Address').AsString;
                     finally
                       TempQuery.Free;
                     end;
                   end;
        vtCPhoneH: begin
                     TempQuery := OpenQuery([
                         'SELECT PhoneH FROM Clients WHERE Id = :id'
                       ], [
                         Param(ftInteger, DataSource3.DataSet.FieldByName('ClientId').AsInteger)
                       ]);
                     try
                       if TempQuery.RecordCount = 0
                         then Result := 'не определен'
                         else Result := TempQuery.FieldByName('PhoneH').AsString;
                     finally
                       TempQuery.Free;
                     end;
                   end;
        vtCPhoneW: begin
                     TempQuery := OpenQuery([
                         'SELECT PhoneW FROM Clients WHERE Id = :id'
                       ], [
                         Param(ftInteger, DataSource3.DataSet.FieldByName('ClientId').AsInteger)
                       ]);
                     try
                       if TempQuery.RecordCount = 0
                         then Result := 'не определен'
                         else Result := TempQuery.FieldByName('PhoneW').AsString;
                     finally
                       TempQuery.Free;
                     end;
                   end;
        vtCStatus: begin
                     TempQuery := OpenQuery([
                         'SELECT TooBad, TooGood FROM Clients WHERE Id = :id'
                       ], [
                         Param(ftInteger, DataSource3.DataSet.FieldByName('ClientId').AsInteger)
                       ]);
                     try
                       if TempQuery.RecordCount = 0
                         then Result := '' else
                         begin
                           Result := '0';
                           if TempQuery.FieldByName('TooBad').AsBoolean then Result := '1';
                           if TempQuery.FieldByName('TooGood').AsBoolean then Result := '2';
                         end;
                     finally
                       TempQuery.Free;
                     end;
                   end;
      vtHComplete: if DataSource3.DataSet.FieldValues['Name']<>null then
                     Result := DataSource3.DataSet.FieldValues['Name'];
      vtHDiagnose: if DataSource3.DataSet.FieldValues['Diagnose']<>null then
                     Result := DataSource3.DataSet.FieldValues['Diagnose'];
   vtHComplection: if DataSource3.DataSet.FieldValues['Complection']<>null then
                     Result := DataSource3.DataSet.FieldValues['Complection'];
        vtOrgName: Result := Config.ReadString('Organization','Name','');
     vtOrgAddress: Result := Config.ReadString('Organization','Address','');
       vtOrgPhone: Result := Config.ReadString('Organization','Phone','');
         vtOrgFax: Result := Config.ReadString('Organization','Fax','');
        vtOrgMail: Result := Config.ReadString('Organization','EMail','');
    vtOrgDirector: Result := Config.ReadString('Organization','Director','');
         vtOrgBuh: Result := Config.ReadString('Organization','Accounter','');
     vtMasterName: begin
                     TempQuery := OpenQuery([
                         'SELECT LastName, FirstName, FatherName FROM Users WHERE Id = :id'
                       ], [
                         Param(ftInteger, DataSource3.DataSet.FieldByName('MasterId').AsInteger)
                       ]);
                     try
                       if TempQuery.RecordCount=0
                         then Result := ''
                         else Result := TempQuery.FieldByName('LastName').AsString + ' ' +
                                        LeftStr(TempQuery.FieldByName('FirstName').AsString, 1) + '.' +
                                        LeftStr(TempQuery.FieldByName('FatherName').AsString, 1) + '.';
                     finally
                       TempQuery.Free;
                     end;
                   end;
 vtFullMasterName: begin
                      TempQuery := OpenQuery([
                         'SELECT LastName, FirstName, FatherName FROM Users WHERE Id = :id'
                       ], [
                         Param(ftInteger, DataSource3.DataSet.FieldByName('MasterId').AsInteger)
                       ]);
                     try
                       if TempQuery.RecordCount=0
                         then Result := ''
                         else Result := TempQuery.FieldByName('LastName').AsString + ' ' +
                                        TempQuery.FieldByName('FirstName').AsString + ' ' +
                                        TempQuery.FieldByName('FatherName').AsString;
                     finally
                       TempQuery.Free;
                     end;
                   end;
    vtMasterPhone: begin
                     TempQuery := OpenQuery([
                         'SELECT Phone FROM Users WHERE Id = :id'
                       ], [
                         Param(ftInteger, DataSource3.DataSet.FieldByName('MasterId').AsInteger)
                       ]);
                     try
                       if TempQuery.RecordCount=0
                         then Result := ''
                         else
                           if TempQuery.FieldValues['Phone'] <> null then
                             Result := TempQuery.FieldByName('Phone').AsString;
                     finally
                       TempQuery.Free;
                     end;
                   end;
          vtHType: begin
                     ConnectSQL(SmallNeedsQuery,'Select * from Types Where Id='+
                                IntToStr(DataSource3.DataSet.FieldValues['Type'])+';');
                     if DataSource2.DataSet.RecordCount=0 then
                       Result := '' else Result := DataSource2.DataSet.FieldValues['Name'];
                   end;
        vtHTypeId: Result := IntToStr(DataSource3.DataSet.FieldValues['Type']);
          vtHFirm: begin
                     ConnectSQL(SmallNeedsQuery,'Select * from Firms Where Id='+
                                IntToStr(DataSource3.DataSet.FieldValues['Firm'])+';');
                     if DataSource2.DataSet.RecordCount=0 then
                       Result := '' else Result := DataSource2.DataSet.FieldValues['Name'];
                   end;
        vtHStatus: case DataSource3.DataSet.FieldValues['Status'] of
                     1: Result := 'находится в ремонте';
                     2: Result := 'отремонтирован, но еще не выдан';
                     3: Result := 'находится на гарантии';
                     4: Result := 'находится в архиве';
                     5: Result := 'находится в корзине';
                   end;
      vtHCategory: begin
                     ConnectSQL(SmallNeedsQuery,'Select * from Firms Where Id='+
                                IntToStr(DataSource3.DataSet.FieldValues['Firm'])+';');
                     if DataSource2.DataSet.RecordCount=0 then
                       Result := '' else Result := IntToStr(DataSource2.DataSet.FieldValues['Category']);
                   end;
    vtRepairPrice: begin
                     ConnectSQL(SmallNeedsQuery,'Select * from Repaired Where HardwareId='+GetValue(vtId)+';');
                     Result := '0' + MoneyValue;
                     if DataSource2.DataSet.RecordCount<>0 then
                       if DataSource2.DataSet.FieldValues['Price']<>null then
                         Result := FloatToStr(DataSource2.DataSet.FieldValues['Price']) + MoneyValue;
                   end;
      vtFullPrice: begin
                     temp := 0;
                     ConnectSQL(SmallNeedsQuery,'Select * from Repaired Where HardwareId='+GetValue(vtId)+';');
                     Result := '0' + MoneyValue;
                     if DataSource2.DataSet.RecordCount<>0 then
                       if DataSource2.DataSet.FieldValues['Price']<>null then
                         temp := DataSource2.DataSet.FieldValues['Price'];
                     ConnectSQL(SmallNeedsQuery,'Select Sum(Price) as SumPrice from Details Where HardwareId='+GetValue(vtId)+';');
                     Result := '0' + MoneyValue;
                     if DataSource2.DataSet.RecordCount<>0 then
                       if DataSource2.DataSet.FieldValues['SumPrice']<>null then
                         temp := temp+DataSource2.DataSet.FieldValues['SumPrice'];
                     Result := FloatToStr(temp) + MoneyValue;
                   end;
     vtRepairDate: begin
                     ConnectSQL(SmallNeedsQuery,'Select * from Repaired Where HardwareId='+GetValue(vtId)+';');
                     if DataSource2.DataSet.RecordCount=0 then Result := ''
                       else Result := DateToStr(DataSource2.DataSet.FieldValues['RepairDate']);
                   end;
       vtSendDate: begin
                     ConnectSQL(SmallNeedsQuery,'Select * from Sended Where HardwareId='+GetValue(vtId)+';');
                     if DataSource2.DataSet.RecordCount=0 then
                       Result := '' else Result := DateToStr(DataSource2.DataSet.FieldValues['SendDate']);
                   end;
     vtGuarantyOn: begin
                     ConnectSQL(SmallNeedsQuery,'Select * from Sended Where HardwareId='+GetValue(vtId)+';');
                     if DataSource2.DataSet.RecordCount=0 then
                       Result := '' else Result := IntToStr(MonthsBetween(DataSource2.DataSet.FieldValues['SendDate'],
                                                        DataSource2.DataSet.FieldValues['GuarantyDate']))+' мес.';
                   end;
  vtGuarantyUntil: begin
                     ConnectSQL(SmallNeedsQuery,'Select * from Sended Where HardwareId='+GetValue(vtId)+';');
                     if DataSource2.DataSet.RecordCount=0 then
                       Result := '' else Result := DateToStr(DataSource2.DataSet.FieldValues['GuarantyDate']);
                   end;
 vtDetailSumPrice: begin
                     ConnectSQL(SmallNeedsQuery,'Select Sum(Price) as SumPrice from Details Where HardwareId='+GetValue(vtId)+';');
                     Result := '0' + MoneyValue;
                     if DataSource2.DataSet.RecordCount<>0 then
                       if DataSource2.DataSet.FieldValues['SumPrice']<>null then
                         Result := FloatToStr(DataSource2.DataSet.FieldValues['SumPrice']) + MoneyValue;
                   end;
    vtDetailCount: begin
                     ConnectSQL(SmallNeedsQuery,'Select Count(Price) as DetailCount from Details Where HardwareId='+GetValue(vtId)+';');
                     if DataSource2.DataSet.RecordCount=0 then Result := '0'
                       else if DataSource2.DataSet.FieldValues['DetailCount']<>null then
                         Result := IntToStr(DataSource2.DataSet.FieldValues['DetailCount']);
                   end;
 vtRepairDiagnose: begin
                     ConnectSQL(SmallNeedsQuery,'Select * from Repaired Where HardwareId='+GetValue(vtId)+';');
                     if DataSource2.DataSet.RecordCount=0 then
                       Result := '' else Result := DataSource2.DataSet.FieldValues['Diagnose'];
                   end;
        vtMinYear: begin
                     ConnectSQL(SmallNeedsQuery,'Select Min(Year(GetDate)) as MinYear from MainTable;');
                     if DataSource2.DataSet.RecordCount=0 then
                       Result := '' else if DataSource2.DataSet.FieldValues['MinYear']<>null then
                           Result := IntToStr(DataSource2.DataSet.FieldValues['MinYear'])
                         else Result := '';
                   end;
        vtMaxYear: begin
                     ConnectSQL(SmallNeedsQuery,'Select Max(Year(GetDate)) as MaxYear from MainTable;');
                     if DataSource2.DataSet.RecordCount=0 then
                       Result := '' else if DataSource2.DataSet.FieldValues['MaxYear']<>null then
                           Result := IntToStr(DataSource2.DataSet.FieldValues['MaxYear'])
                         else Result := '';
                   end;
  end;
  if SmallNeedsQuery.Active=True then SmallNeedsQuery.Active := False;
end;

procedure TMainForm.N25Click(Sender: TObject);
var      FileName: OleVariant;
             i, n: integer;
            probe: integer;
    RangeX,RangeY: integer;
                p: integer;
                k: string;
label ending;
begin
//---------------
  if Sender is TMenuItem then p := (Sender as TMenuItem).Tag
                         else p := (Sender as TToolButton).Tag;
  case p of
    1: FileName := ExtractFilePath(paramstr(0))+'Documents\Getting.xlt';
    2: FileName := ExtractFilePath(paramstr(0))+'Documents\Sending.xlt';
    3: FileName := ExtractFilePath(paramstr(0))+'Documents\Attention.xlt';
    4: FileName := ExtractFilePath(paramstr(0))+'Documents\Success.xlt';
  else Exit
  end;

  if not(FileExists(FileName)) then
    begin
      ShowInfoMessage('Файл шаблона квитанции ('+FileName+') не обнаружен.','Печать квитанции',true);
      Exit; 
    end;

  Self.Enabled := False;
  dbgMain.Enabled := False;
  XL := CreateOLEObject('Excel.Application');              // Создание OLE объекта
  XL.WorkBooks.Open(FileName);

  RangeX := XL.Sheets.Item[1].UsedRange.Rows.Count;
  RangeY := XL.Sheets.Item[1].UsedRange.Columns.Count;

  SetProgressValue(0,' ');
  i := 1;
  while i<=RangeX do
    begin
      for n := 1 to RangeY do
        begin
          if TryStrToInt(XL.Cells[i,n].Value,probe)=false then
            if XL.Cells[i,n].Value<>'' then
              begin
                if AnsiUpperCase(XL.Cells[i,n].Value)=AnsiUpperCase('[StopString]') then
                  begin
                    XL.Cells[i,n].Value := '';
                    break;
                  end;
                if AnsiUpperCase(XL.Cells[i,n].Value)=AnsiUpperCase('[StopDocument]') then
                  begin
                    XL.Cells[i,n].Value := '';                  
                    goto ending;
                  end;
                if Length(XL.Cells[i,n].Value)>12 then
                  if AnsiUpperCase(LeftStr(XL.Cells[i,n].Value,13))=AnsiUpperCase('[SkipStrings]') then
                    begin
                      k := RightStr(XL.Cells[i,n].Value,Length(XL.Cells[i,n].Value)-Pos('=',XL.Cells[i,n].Value));
                      if TryStrToInt(k,probe)=true then
                        begin
                          XL.Cells[i,n].Value := '';
                          inc(i,StrToInt(k));
                          break;
                        end;
                    end;
                XLSetCellValue(i,n,AnsiUpperCase(XL.Cells[i,n].Value))
              end;
          Application.ProcessMessages;
        end;
      SetProgressValue(Round(i/RangeX*100),'');
      inc(i);
    end;
  XL.Cells[1,1].Select;
  SetProgressValue(0,' ');
  XL.visible := true;
  dbgMain.Enabled := True;
  Self.Enabled := True;

  ending:
    begin
      XL.Cells[1,1].Select;
      SetProgressValue(0,' ');
      XL.visible := true;
      dbgMain.Enabled := True;
      Self.Enabled := True;
    end;

  XL := unassigned;
end;


procedure TMainForm.XLSetCellValue(Row, Column: integer; Value: string);
var i: integer;
begin
// -----------------------------------------------------------------------------
// --------------------------------- даты --------------------------------------
// -----------------------------------------------------------------------------
  if Value=AnsiUpperCase('[Date]') then XL.Cells[Row,Column].Value := DateToStr(Date);
  if Value=AnsiUpperCase('[DateDay]') then XL.Cells[Row,Column].Value := IntToStr(DayOf(Date));
  if Value=AnsiUpperCase('[DateMonth]') then XL.Cells[Row,Column].Value := MonthName(MonthOf(Date));
  if Value=AnsiUpperCase('[DateYear]') then XL.Cells[Row,Column].Value := IntToStr(YearOf(Date));
  if Value=AnsiUpperCase('[GetDate]') then XL.Cells[Row,Column].Value := GetValue(vtGetDate);
  if Value=AnsiUpperCase('[GetDateDay]') then XL.Cells[Row,Column].Value := IntToStr(DayOf(StrToDate(GetValue(vtGetDate))));
  if Value=AnsiUpperCase('[GetDateMonth]') then XL.Cells[Row,Column].Value := MonthName(MonthOf(StrToDate(GetValue(vtGetDate))));
  if Value=AnsiUpperCase('[GetDateYear]') then XL.Cells[Row,Column].Value := IntToStr(YearOf(StrToDate(GetValue(vtGetDate))));
// -----------------------------------------------------------------------------
// ----------------------------- инфо о мастере --------------------------------
// -----------------------------------------------------------------------------
  if Value=AnsiUpperCase('[MasterName]') then XL.Cells[Row,Column].Value := GetValue(vtMasterName);
  if Value=AnsiUpperCase('[MasterFullName]') then XL.Cells[Row,Column].Value := GetValue(vtFullMasterName);
  if Value=AnsiUpperCase('[MasterPhone]') then XL.Cells[Row,Column].Value := GetValue(vtMasterPhone);
// -----------------------------------------------------------------------------
// ----------------------------- инфо о железе ---------------------------------
// -----------------------------------------------------------------------------
  if Value=AnsiUpperCase('[DocNum]') then XL.Cells[Row,Column].Value := GetValue(vtDocNum);
  if Value=AnsiUpperCase('[HardwareId]') then XL.Cells[Row,Column].Value := GetValue(vtId);
  if Value=AnsiUpperCase('[HardwareFullName]') then XL.Cells[Row,Column].Value := GetValue(vtHComplete);
  if Value=AnsiUpperCase('[HardwareType]') then XL.Cells[Row,Column].Value := GetValue(vtHType);
  if Value=AnsiUpperCase('[HardwareFirm]') then XL.Cells[Row,Column].Value := GetValue(vtHFirm);
  if Value=AnsiUpperCase('[HardwareModel]') then XL.Cells[Row,Column].Value := GetValue(vtHModel);
  if Value=AnsiUpperCase('[HardwareNumber]') then XL.Cells[Row,Column].Value := GetValue(vtHNumber);
  if Value=AnsiUpperCase('[HardwareComplection]') then XL.Cells[Row,Column].Value := GetValue(vtHComplection);
  if Value=AnsiUpperCase('[HardwarePreDiagnose]') then XL.Cells[Row,Column].Value := GetValue(vtHDiagnose);
  if Value=AnsiUpperCase('[Memo]') then XL.Cells[Row,Column].Value := GetValue(vtMemo);
// -----------------------------------------------------------------------------
// ----------------------------- инфо о ремонте --------------------------------
// -----------------------------------------------------------------------------
  if Value=AnsiUpperCase('[RepairPreDiagnose]') then XL.Cells[Row,Column].Value := GetValue(vtHDiagnose);
  if Value=AnsiUpperCase('[GuarantyOn]') then XL.Cells[Row,Column].Value := GetValue(vtGuarantyOn);
  if Value=AnsiUpperCase('[GuarantyUntil]') then XL.Cells[Row,Column].Value := GetValue(vtGuarantyUntil);
  if Value=AnsiUpperCase('[DetailsSumPrice]') then XL.Cells[Row,Column].Value := GetValue(vtDetailSumPrice);
  if Value=AnsiUpperCase('[CapitalDetailsSumPrice]') then XL.Cells[Row,Column].Value := SumToString(GetValue(vtDetailSumPrice), MoneyValue);
  if Value=AnsiUpperCase('[RepairPrice]') then XL.Cells[Row,Column].Value := GetValue(vtRepairPrice);
  if Value=AnsiUpperCase('[FullPrice]') then XL.Cells[Row,Column].Value := GetValue(vtFullPrice);
  if Value=AnsiUpperCase('[CapitalRepairPrice]') then XL.Cells[Row,Column].Value := SumToString(GetValue(vtRepairPrice), MoneyValue);
  if Value=AnsiUpperCase('[HardwareDiagnose]') then XL.Cells[Row,Column].Value := GetValue(vtRepairDiagnose);
  if Value=AnsiUpperCase('[DropDownDetailList]') then
    begin
      ConnectSQL(SmallNeedsQuery,'Select * from Details Where HardwareId='+GetValue(vtId)+' order by Name;');
      if DataSource2.DataSet.RecordCount>0 then
        for i := 1 to DataSource2.DataSet.RecordCount do
          begin
            DataSource2.DataSet.RecNo := i;
            XL.Cells[Row-1+i,Column].Value := DataSource2.DataSet.FieldValues['Name'];
          end;
    end;
  if Value=AnsiUpperCase('[DropDownDetailPrice]') then
    begin
      ConnectSQL(SmallNeedsQuery,'Select * from Details Where HardwareId='+GetValue(vtId)+' order by Name;');
      if DataSource2.DataSet.RecordCount>0 then
        for i := 1 to DataSource2.DataSet.RecordCount do
          begin
            DataSource2.DataSet.RecNo := i;
            XL.Cells[Row-1+i,Column].Value := FloatToStr(DataSource2.DataSet.FieldValues['Price']);
          end;
    end;
// -----------------------------------------------------------------------------
// ------------------------------- инфо о клиенте ------------------------------
// -----------------------------------------------------------------------------
  if Value=AnsiUpperCase('[ClientName]') then XL.Cells[Row,Column].Value := GetValue(vtCName);
  if Value=AnsiUpperCase('[ClientAddress]') then XL.Cells[Row,Column].Value := GetValue(vtCAddress);
  if Value=AnsiUpperCase('[ClientHomePhone]') then XL.Cells[Row,Column].Value := GetValue(vtCPhoneH);
  if Value=AnsiUpperCase('[ClientWorkPhone]') then XL.Cells[Row,Column].Value := GetValue(vtCPhoneW);
// -----------------------------------------------------------------------------
// ---------------------------- инфо об организации ----------------------------
// -----------------------------------------------------------------------------
  if Value=AnsiUpperCase('[OrgName]') then XL.Cells[Row,Column].Value := GetValue(vtOrgName);
  if Value=AnsiUpperCase('[OrgAddress]') then XL.Cells[Row,Column].Value := GetValue(vtOrgAddress);
  if Value=AnsiUpperCase('[OrgPhone]') then XL.Cells[Row,Column].Value := GetValue(vtOrgPhone);
  if Value=AnsiUpperCase('[OrgFax]') then XL.Cells[Row,Column].Value := GetValue(vtOrgFax);
  if Value=AnsiUpperCase('[OrgMail]') then XL.Cells[Row,Column].Value := GetValue(vtOrgMail);
  if Value=AnsiUpperCase('[OrgDirector]') then XL.Cells[Row,Column].Value := GetValue(vtOrgDirector);
  if Value=AnsiUpperCase('[OrgBuh]') then XL.Cells[Row,Column].Value := GetValue(vtOrgBuh);
  if SmallNeedsQuery.Active=True then SmallNeedsQuery.Active := False;
end;

procedure TMainForm.BaseCompress(ShowInfo: boolean);
var JetEngine: OleVariant;
            T: File of Byte;
  Size1,Size2: LongInt;
begin
  try
    AssignFile(T,Config.ReadString('Main','BasePath',ChangeFileExt(paramstr(0),'.dat')));
    Reset(T);
    Size1 := FileSize(T);
  finally
    CloseFile(T);
  end;
  JetEngine := CreateOleObject('JRO.JetEngine');
  JetEngine.CompactDatabase(
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+Config.ReadString('Main','BasePath',ChangeFileExt(paramstr(0),'.dat'))+';Jet OLEDB:Database Password="";',
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+ChangeFileExt(Config.ReadString('Main','BasePath',ChangeFileExt(paramstr(0),'.dat')),'.bak')+';Jet OLEDB:Database Password="";');
  JetEngine := Unassigned;
  DeleteFile(PChar(Config.ReadString('Main','BasePath',ChangeFileExt(paramstr(0),'.dat'))));
  RenameFile(ChangeFileExt(Config.ReadString('Main','BasePath',ChangeFileExt(paramstr(0),'.dat')),'.bak'),Config.ReadString('Main','BasePath',ChangeFileExt(paramstr(0),'.dat')));
  try
    AssignFile(T,Config.ReadString('Main','BasePath',ChangeFileExt(paramstr(0),'.dat')));
    Reset(T);
    Size2 := FileSize(T);
  finally
    CloseFile(T);
  end;
  if ShowInfo then
    if Size1<>Size2 then ShowInfoMessage('База данных была успешно сжата с '+FloatToStr(Size1/1024)+'kb '+
                                         'до '+FloatToStr(Size2/1024)+'kb','Сжатие базы данных')
                    else ShowInfoMessage('Сжатие базы данных не привело к уменьшению размера файла базы','Сжатие базы данных');
end;

procedure TMainForm.N73Click(Sender: TObject);
begin
  Self.Enabled := False;
  MainConnection.Connected := False;

  BaseCompress(true);

  MainConnection.Connected := True;
  TableCaptions.Active := True;
  Self.Enabled := True;

  Sorting;
end;

procedure TMainForm.FillYearFilterMenu;
var NewItem: TMenuItem;
          i: integer;
begin
  if GetValue(vtMinYear)<>'' then
    for i := StrToInt(GetValue(vtMinYear)) to StrToInt(GetValue(vtMaxYear)) do
      begin
        NewItem := TMenuItem.Create(YearPopup);
        NewItem.Caption := IntToStr(i)+' год';
        NewItem.Tag := i;
        NewItem.ImageIndex := 56;
        NewItem.Hint := 'Фильтровать записи только по '+IntToStr(i)+' году';
        NewItem.OnClick := N26Click;
        YearPopup.Items.Add(NewItem);
      end;
end;

procedure TMainForm.FilterPanelShowHide(Show: boolean);
var i: integer;
begin
  if not(Show) then
      begin
        for i := Frame11.Left downto Round(-Frame11.Width/4-10)+10 do
          begin
            Frame11.Left := i*4;
            Application.ProcessMessages;
          end;
        Frame11.Left := -239;
      end
    else
      begin
        Frame11.Left := -Frame11.Width;
        i := Frame11.Left;
        while i-3<dbgMain.Left+2 do
          begin
            Frame11.Left := i;
            Application.ProcessMessages;
            i := i+4;
          end;
        Frame11.Left := -1;
        Frame11.Refresh;
        Frame11.Repaint;
      end;
end;

procedure TMainForm.N44Click(Sender: TObject);
begin                                                     // справочник клиентов
  try
    Application.CreateForm(TForm27, Form27);
    Form27.ShowModal;
  finally
    Form27.Hide;
    Form27.Free;
  end;
end;

procedure TMainForm.SetClientStatus(Id: integer; Status: integer);
begin                                            // присваивание статуса клиенту
  ConnectSQL(SmallNeedsQuery,'Select * from Clients Where Id='+IntToStr(Id)+';');
  if DataSource2.DataSet.RecordCount=1 then
    case Status of
      0: begin
           FieldEdit(DataSource2,'TooBad',false);
           FieldEdit(DataSource2,'TooGood',false);
         end;
      1: begin
           FieldEdit(DataSource2,'TooGood',false);
           FieldEdit(DataSource2,'TooBad',true);
         end;
      2: begin
           FieldEdit(DataSource2,'TooBad',false);
           FieldEdit(DataSource2,'TooGood',true);
         end;
    end;
  SmallNeedsQuery.Active := False;
end;

procedure TMainForm.N63Click(Sender: TObject);
begin
  if Sender is TMenuItem then
    SetClientStatus(DataSource3.DataSet.FieldValues['ClientId'],(Sender as TMenuItem).Tag);
  if Sender is TToolButton then
    SetClientStatus(DataSource3.DataSet.FieldValues['ClientId'],(Sender as TToolButton).Tag);  
end;

procedure TMainForm.dbgMainMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var NewHint: string;
       temp: string;
     Phones: string;
begin
  if DataSource3.DataSet.RecordCount=0 then Exit;
  if dbgMain.MouseCoord(x,y).y=Round(dbgMain.ScreenToClient(Mouse.CursorPos).y/dbgMain.RowsHeight)+1 then
      begin
        if dbgMain.Hint<>'' then Exit;
        NewHint := 'Заказ №'+GetValue(vtId)+' от '+GetValue(vtGetDate)+':'+#13#13;
        if DataSource3.DataSet.FieldValues['Attention1'] then temp := ' срочный' else temp := '';
        NewHint := NewHint+GetValue(vtCName)+' сдал в'+temp+' ремонт устройство'+#13;
        NewHint := NewHint+GetValue(vtHComplete)+' с заводским номером '+GetValue(vtHNumber)+#13;
        temp := GetValue(vtCStatus);
        if temp='1' then NewHint := NewHint+'(клиент находится в "черном списке")'+#13;
        if temp='2' then NewHint := NewHint+'(клиент находится в "белом списке")'+#13;
        if GetValue(vtMasterName)<>'' then NewHint := NewHint+'Ответственный за ремонт устройства '+GetValue(vtMasterName)+#13;
        NewHint := NewHint+#13'О клиенте известно, что он проживает по адресу'+#13+GetValue(vtCAddress);
        temp := GetValue(vtCPhoneH);
        if temp<>'' then Phones := Phones+'дом.тел.: '+temp+'  ';
        temp := GetValue(vtCPhoneW);
        if temp<>'' then Phones := Phones+'раб.тел.: '+temp;
        if Phones<>'' then NewHint := NewHint+#13+Phones;
        if Configuration.VisionStatus>1 then
          begin
            if NewHint[Length(NewHint)]<>#13 then NewHint := NewHint+#13#13;
            NewHint := NewHint+GetValue(vtRepairDate)+' аппарат был отремонтирован и помещен в ожидание.'+#13;
            NewHint := NewHint+'В ходе ремонта было использовано '+GetValue(vtDetailCount)+' деталей на '+GetValue(vtDetailSumPrice);
          end;
        if Configuration.VisionStatus>2 then
          begin
            if NewHint[Length(NewHint)]<>#13 then NewHint := NewHint+#13#13;
            NewHint := NewHint+GetValue(vtSendDate)+' аппарат был выдан заказчику с гарантией на '+GetValue(vtGuarantyOn)+#13;
            NewHint := NewHint+'Дата окончания гарантии - '+GetValue(vtGuarantyUntil);
          end;
        dbgMain.Hint := NewHint;          
      end
    else
      begin
        dbgMain.Hint := '';
        Application.CancelHint;
      end;
end;

procedure TMainForm.BackUp(ShowInfo: boolean);
var BackupDir: string;
     FileName: string;
begin
  if Config.ReadString('BackUp','BackupDir','')='' then
      begin
        ShowInfoMessage('Не задан каталог для резервных копий базы данных программы.'#13'Создание резервной копии не возможно.','Внимание',true);
        Exit;
      end
    else BackupDir := Config.ReadString('BackUp','BackupDir','');
  FileName := BackupDir+'\'+IntToStr(YearOf(Date))+'_'+IntToStr(MonthOf(Date))+'_'+IntToStr(DayOf(Date))+'.tmb';
  if FileExists(FileName) then DeleteFile(PChar(FileName));
  CopyFile(PChar(Config.ReadString('Main','BasePath',ExtractFilePath(paramstr(0))+ExtractFileName(ChangeFileExt(paramstr(0),'.dat')))),
           PChar(FileName),true);
  if ShowInfo then ShowInfoMessage('Резервная копия базы данных программы успешно создана как'+#13+FileName,'Внимание');
end;

procedure TMainForm.N80Click(Sender: TObject);
begin
  BackUp(true);
end;

procedure TMainForm.N39Click(Sender: TObject);
begin                                 // расчет зарплаты сотрудников организации
  if Configuration.UserType=2 then
    begin
      ShowInfoMessage('У Вас отсутствуют права на просмотр этой информации. Для просмотра отчетов необходимо иметь учетную запись начальника или администратора.','Отчеты',true);
      Exit;
    end;
  if NullBase then
    begin
      ShowInfoMessage('Не могу сформировать отчет по пустой базе!','Внимание',true);
      Exit;
    end;
// -------------------
  try
    Application.CreateForm(TForm30, Form30);
    Form30.ShowModal;
  finally
    Form30.Hide;
    Form30.Free;
  end;
end;

procedure TMainForm.N84Click(Sender: TObject);
begin
  if Configuration.UserType=3 then
    begin
      ShowInfoMessage('У Вас отсутствуют права на использование данной функции!','Ошибка',true);
      Exit;
    end;

  if ShowQuestionMessage('Вы действительно хотите вернуть аппарат в доработку?','Внимание')=false then Exit;
  DeleteSQL(SmallNeedsQuery,'Delete * from Repaired Where HardwareId='+GetValue(vtId)+';');
  FieldEdit(DataSource3,'Status',1);
  Sorting;
end;

procedure TMainForm.N81Click(Sender: TObject);
var OpenDialog: TOpenDialog;
      BaseFile: string;
begin
  OpenDialog := TOpenDialog.Create(Self);
  OpenDialog.Title := 'Восстановление базы данных из резервной копии';
  OpenDialog.Filter := 'Резервные копии базы данных программы|*.tmb';
  OpenDialog.DefaultExt := '.tmb';
  if (OpenDialog.Execute) and (OpenDialog.FileName<>'') then
    begin
      Self.Enabled := False;
      MainConnection.Connected := False;

      BaseFile := Config.ReadString('Main','BasePath',ExtractFilePath(paramstr(0))+ExtractFileName(ChangeFileExt(paramstr(0),'.dat')));
      RenameFile(BaseFile,ChangeFileExt(BaseFile,'.bak'));
      CopyFile(Pchar(OpenDialog.FileName),Pchar(BaseFile),true);
      if FileExists(BaseFile) then
          begin
            DeleteFile(PChar(ChangeFileExt(BaseFile,'.bak')));
            ShowInfoMessage('Операция восстановления из резервной копии базы данных завершена успешно','Внимание');
          end
        else ShowInfoMessage('Операция восстановления завершилась неудачей','Внимание',true);

      MainConnection.Connected := True;
      TableCaptions.Active := True;
      Self.Enabled := True;
      Sorting;
    end;
  OpenDialog.Free;
end;

procedure TMainForm.GuarantyCheck;
var i: integer;                        // проверка гарантийных устройств по дате
begin
  ConnectSQL(SmallNeedsQuery,'SELECT MainTable.Id, Sended.GuarantyDate, MainTable.Status FROM MainTable INNER JOIN Sended ON MainTable.Id = Sended.HardwareId Where MainTable.Status=3;');
  for i := 1 to DataSource2.DataSet.RecordCount do
    begin
      DataSource2.DataSet.RecNo := i;
      if DataSource2.DataSet.FieldValues['GuarantyDate']<=Date then FieldEdit(DataSource2,'Status',4);
    end;
  SmallNeedsQuery.Active := False;

  ConnectSQL(SmallNeedsQuery,'SELECT MainTable.Id, Sended.GuarantyDate, MainTable.Status FROM MainTable INNER JOIN Sended ON MainTable.Id = Sended.HardwareId Where MainTable.Status=4;');
  for i := 1 to DataSource2.DataSet.RecordCount do
    begin
      DataSource2.DataSet.RecNo := i;
      if DataSource2.DataSet.FieldValues['GuarantyDate']>Date then FieldEdit(DataSource2,'Status',3);
    end;
  SmallNeedsQuery.Active := False;
end;

function TMainForm.MoneyValue: string;
begin
  Result := ' '+Config.ReadString('Main','MoneyValue','руб.');
end;

procedure TMainForm.Frame11SpeedButton4Click(Sender: TObject);
begin
  if Frame11.Left<-1 then FilterPanelShowHide(true)
                     else FilterPanelShowHide(false);
end;

procedure TMainForm.N87Click(Sender: TObject);
begin
  try
    Application.CreateForm(TForm29,Form29);
    Form29.ShowModal;
  finally
    Form29.Hide;
    Form29.Free;
  end;
end;

procedure TMainForm.N89Click(Sender: TObject);
Var PrintDialog: TPrinterSetupDialog;
begin
  PrintDialog := nil;
  try
    PrintDialog := TPrinterSetupDialog.Create(Self);
    PrintDialog.Execute;
  except
    ShowInfoMessage('У Вас нет ни одного принтера в системе!','Настройки принтера',true);
  end;
  if PrintDialog<>nil then PrintDialog.Free;
end;

procedure TMainForm.N58Click(Sender: TObject);
begin                                            // возврат аппарата по гарантии
  if Configuration.UserType=3 then
    begin
      ShowInfoMessage('У Вас отсутствуют права на использование данной функции!','Ошибка',true);
      Exit;
    end;

  if ShowQuestionMessage('Вы действительно хотите возвратить аппарат по гарантии?','Внимание')=false then Exit;
// ----------------
  ConnectSQL(SmallNeedsQuery,'Select * from MainTable;');
  SmallNeedsQuery.AppendRecord([
    nil,
    DataSource3.DataSet.FieldValues['MasterId'],
    DataSource3.DataSet.FieldValues['ClientId'],
    1,
    DataSource3.DataSet.FieldValues['GetDate'],
    DataSource3.DataSet.FieldValues['Type'],
    DataSource3.DataSet.FieldValues['Firm'],
    DataSource3.DataSet.FieldValues['Model'],
    DataSource3.DataSet.FieldValues['Number'],
    DataSource3.DataSet.FieldValues['Complection'],
    DataSource3.DataSet.FieldValues['Diagnose'],
    DataSource3.DataSet.FieldValues['Attention1'],
    true,
    DataSource3.DataSet.FieldValues['Erased']
                               ]);
  SmallNeedsQuery.Active := False;
  FieldEdit(DataSource3,'Attention2',true);
// -----------
  Sorting;
end;

procedure TMainForm.DeleteLastErased;
var LastId: integer;
begin
  ConnectSQL(SmallNeedsQuery,'Select Min(Id) as LastHard from Deleted;');
  if SmallNeedsQuery.FieldValues['LastHard']<>null then
    LastId := SmallNeedsQuery.FieldValues['LastHard'] else LastId := -666;
  SmallNeedsQuery.Active := False;

  if LastId=-666 then Exit;

  ConnectSQL(SmallNeedsQuery,'Select * from Deleted where Id='+IntToStr(LastId)+';');
  LastId := SmallNeedsQuery.FieldValues['HardwareId'];
  SmallNeedsQuery.Active := False;

  DeleteSQL(SmallNeedsQuery,'Delete * from Sended Where HardWareId='+IntToStr(LastId)+';');
  DeleteSQL(SmallNeedsQuery,'Delete * from Repaired Where HardWareId='+IntToStr(LastId)+';');
  DeleteSQL(SmallNeedsQuery,'Delete * from Details Where HardWareId='+IntToStr(LastId)+';');
  DeleteSQL(SmallNeedsQuery,'Delete * from Deleted Where HardWareId='+IntToStr(LastId)+';');
  DeleteSQL(SmallNeedsQuery,'Delete * from MainTable Where Id='+IntToStr(LastId)+';');
end;

function TMainForm.NullBase: boolean;
begin                         // проверка на наличие какого-либо аппарата в базе
  ConnectSQL(SmallNeedsQuery,'Select Count(Id) as RecCount from MainTable Where Erased=false and Attention2=false and Status<>5;');
  if SmallNeedsQuery.FieldValues['RecCount']>0 then Result := false else Result := true;
  SmallNeedsQuery.Active := False;
end;

procedure TMainForm.N91Click(Sender: TObject);
begin                                                      // дозвон до абонента
  try
    Application.CreateForm(TForm31, Form31);
    Form31.ShowDial('');
    Form31.ShowModal;
  finally
    Form31.Hide;
    Form31.Free;
  end;
end;

procedure TMainForm.N94Click(Sender: TObject);
var phone: string;
begin                                                       // дозвон до клиента
  if DataSource3.DataSet.RecordCount=0 then Exit;
  if Sender is TMenuItem then
    if (Sender as TMenuItem).Tag=1 then phone := GetValue(vtCPhoneH)
                                   else phone := GetValue(vtCPhoneW);
  if Sender is TToolButton then
    if (Sender as TToolButton).Tag=1 then phone := GetValue(vtCPhoneH)
                                     else phone := GetValue(vtCPhoneW);
  try
    Application.CreateForm(TForm31,Form31);
    Form31.ShowDial(phone);
    Form31.ShowModal;
  finally
    Form31.Hide;
    Form31.Free;
  end;
end;

procedure TMainForm.oolBar1Click(Sender: TObject);
begin                                                     // настройки ToolBar'а
  try
    Application.CreateForm(TForm32, Form32);
    Form32.ShowModal;
  finally
    Form32.Hide;
    Form32.Free;
    HideButtons;
  end;
end;

procedure TMainForm.ToolBarConstruct;
var Previous: integer;
         i,n: integer;
     NewItem: TToolButton;
begin                                                    // построение ToolBar'а
  for I := tbMain.ButtonCount - 1 downto 0 do
    begin
      NewItem := tbMain.Buttons[I];
      if NewItem.Action=Action then
        begin
          tbMain.Perform(CM_CONTROLCHANGE, WPARAM(NewItem), 0);
          NewItem.Free;
        end;
    end;

  ConnectSQL(SmallNeedsQuery,'Select * from VisibleToolBar;');
  Previous := 65536;

  for i := DataSource2.DataSet.RecordCount downto 1 do
  begin
    DataSource2.DataSet.RecNo := i;
    if (Previous<>-1) and (Previous-1<>DataSource2.DataSet.FieldValues['Position']) then
    begin
      NewItem := TToolButton.Create(tbMain);
      NewItem.Style := tbsSeparator;
      NewItem.Width := 8;
      NewItem.Parent := tbMain;
      dec(Previous);
    end;
    
    NewItem := TToolButton.Create(tbMain);
    NewItem.Style := tbsButton;
    NewItem.ShowHint := True;
    NewItem.ImageIndex := DataSource2.DataSet.FieldValues['Image'];
    NewItem.Parent := tbMain;

    for n := ComponentCount-1 downto 0 do
      if Components[n] is TMenuItem then
        if (Components[n] as TMenuItem).Name=DataSource2.DataSet.FieldValues['ButtonName'] then
          begin
            NewItem.OnClick := (Components[n] as TMenuItem).OnClick;
            NewItem.Hint := (Components[n] as TMenuItem).Hint;
            NewItem.Tag := (Components[n] as TMenuItem).Tag;
            Break;
          end;
    Previous := DataSource2.DataSet.FieldValues['Position'];
  end;
end;

procedure TMainForm.N64Click(Sender: TObject);
begin                                                        // свойства клиента
  try
    Application.CreateForm(TForm28, Form28);
    Form28.ClientId := DataSource3.DataSet.FieldValues['ClientId'];
    Form28.ShowModal;
  finally
    Form28.Hide;
    Form28.Free;
    Sorting;
  end;
end;

procedure TMainForm.tbMainMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then oolBar1Click(Self);
end;

procedure TMainForm.N122Click(Sender: TObject);
begin
  Frame11.SpeedButton4.Click;
end;

procedure TMainForm.HideButtons;
var i,n: integer;
begin                                              // отключение ненужных кнопок
  for i := tbMain.ComponentCount-1 downto 0 do
    if tbMain.Components[i] is TToolButton then
      (tbMain.Components[i] as TToolButton).Enabled := True;
// -----------------
  for i := tbMain.ComponentCount-1 downto 0 do
    if tbMain.Components[i] is TToolButton then
      for n := ComponentCount-1 downto 0 do
        if Components[n] is TMenuItem then
          if (Components[n] as TMenuItem).Enabled=false then
            if (Components[n] as TMenuItem).ImageIndex<>-1 then
              if (Components[n] as TMenuItem).Hint=
                 (tbMain.Components[i] as TToolButton).Hint then
                   begin
                     (tbMain.Components[i] as TToolButton).Enabled := False;
                     break;
                   end;
end;

procedure TMainForm.N6Click(Sender: TObject);
begin
  if not(FileExists(ExtractFilePath(paramstr(0))+'\Telemaster2.chm')) then
    begin
      Application.MessageBox('Файл справки к программе не найден!','Справка',mb_OK+mb_IconError);
      Exit;
    end;
  ShellExecute(handle,'open',PChar(ExtractFilePath(paramstr(0))+'\Telemaster2.chm'),nil,nil,sw_shownormal);
end;

procedure TMainForm.ApplicationEvents2Exception(Sender: TObject;
  E: Exception);
var LogFile: TextFile;
    ClassTree: String;
begin                                        // обработка исключений в программе
  AssignFile(LogFile,ExtractFilePath(paramstr(0))+'errors.log');
  if FileExists(ExtractFilePath(paramstr(0))+'errors.log')
      then
        begin
          Append(LogFile);
          WriteLn(LogFile);
        end
      else
        begin
          ReWrite(LogFile);
        end;
  WriteLn(LogFile);
  WriteLn(LogFile,DateToStr(Date)+' '+TimeToStr(Time));
  WriteLn(LogFile,'-------------------------------------------------------------');

  ClassTree := E.ClassName;
  ClassRef := E.ClassType;
  while ClassRef.ClassParent<>nil do
  begin 
    ClassRef := ClassRef.ClassParent;
    ClassTree := ClassRef.ClassName+' => '+ClassTree;
  end;

  WriteLn(LogFile,ClassTree+':');
  WriteLn(LogFile,E.Message);
  WriteLn(LogFile,'-------------------------------------------------------------');
  Flush(LogFile);
  CloseFile(LogFile);

  ShowInfoMessage('Во время работы программы возникла ошибка. Данные об ошибке сохранены в файл errors.txt. По возможности передайте файл разработчикам.','Ошибка в программе',true);
end;

procedure TMainForm.FlatSpeedButton1Click(Sender: TObject);
begin
  YearPopup.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TMainForm.FlatSpeedButton2Click(Sender: TObject);
begin
  MonthPopup.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TMainForm.sbInRepairClick(Sender: TObject);
begin
  Configuration.VisionStatus := (Sender as TSpeedButton).Tag;
  (Sender as TSpeedButton).Down := true;
  Sorting;
end;

procedure TMainForm.Button1Click(Sender: TObject);
var MS,TS,FS: boolean;
begin
// инициализация переменных
  ms := false;
  ts := false;
  fs := false;
// запоминаем состояние раскрытости главных ветвей
  if MasterTree.Expanded then MS := true;
  if TypeTree.Expanded then TS := true;
  if FirmTree.Expanded then FS := true;
// применяем заполнение дерева заново
  FillFilterPanel;
// и раскрываем прежде раскрытые ветви
  if MS then MasterTree.Expand(true);
  if TS then TypeTree.Expand(true);
  if FS then FirmTree.Expand(true);
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
// запуск процедуры применения фильтра
  FilterApply;
end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
  FilterPanelShowHide(false);
end;

procedure TMainForm.Frame11Button3Click(Sender: TObject);
begin
  FilterPanelShowHide(false);
end;

procedure TMainForm.Frame11Button2Click(Sender: TObject);
begin
// запуск процедуры применения фильтра
  FilterApply;
end;

procedure TMainForm.Frame11Button1Click(Sender: TObject);
var MS,TS,FS: boolean;
begin
// инициализация переменных
  ms := false;
  ts := false;
  fs := false;
// запоминаем состояние раскрытости главных ветвей
  if MasterTree.Expanded then MS := true;
  if TypeTree.Expanded then TS := true;
  if FirmTree.Expanded then FS := true;
// применяем заполнение дерева заново
  FillFilterPanel;
// и раскрываем прежде раскрытые ветви
  if MS then MasterTree.Expand(true);
  if TS then TypeTree.Expand(true);
  if FS then FirmTree.Expand(true);
end;

procedure TMainForm.N124Click(Sender: TObject);
var i, n, k: integer;
begin
  if DataSource3.DataSet.RecordCount=0 then Exit;

  Self.Enabled := False;
  dbgMain.Enabled := False;
  XL := CreateOLEObject('Excel.Application');              // Создание OLE объекта
  XL.WorkBooks.Add;

  n := 0;
  for i := 1 to dbgMain.Columns.Count do
    inc(n,dbgMain.Columns.Items[i-1].Width);
  for i := 1 to dbgMain.Columns.Count do
    begin
      XL.Columns[GetLetterFromInt(i)+':'+GetLetterFromInt(i)].ColumnWidth := dbgMain.Columns.Items[i-1].Width*81.50/n;
      XL.Range[GetLetterFromInt(i)+'5:'+GetLetterFromInt(i)+'5'].Select;
      XL.Selection.HorizontalAlignment := xlCenter;
      XL.Selection.Value := dbgMain.Columns.Items[i-1].Title.Caption;
      XL.Selection.Font.Bold := true;
      XL.Selection.Font.ColorIndex := 2;
      XL.Selection.Interior.ColorIndex := 16;
    end;

  XL.Cells.Select;
  XL.Selection.Font.Name := 'Tahoma';
  XL.Selection.Font.Size := 8;

  XL.Cells.Range['A1:'+GetLetterFromInt(dbgMain.Columns.Count)+'1'].Select;
  XL.Selection.Merge;
  case Configuration.VisionStatus of
    1: XL.Selection.Value := 'список устройств в ремонте';
    2: XL.Selection.Value := 'список отремонтированных устройств';
    3: XL.Selection.Value := 'список устройств, находящихся на гарантии';
    4: XL.Selection.Value := 'список устройств в архиве';
    5: XL.Selection.Value := 'список устройств в корзине';
  end;
  XL.Selection.Font.Bold := True;
  XL.Selection.HorizontalAlignment := xlCenter;

  XL.Cells.Range['A2:'+GetLetterFromInt(dbgMain.Columns.Count)+'2'].Select;
  XL.Selection.Merge;
  XL.Selection.Value := 'генерировано программой Телемастер 2';
  XL.Selection.Font.Size := 6;
  XL.Selection.HorizontalAlignment := xlCenter;
  XL.Selection.VerticalAlignment := xlTop;

  n := DataSource3.DataSet.RecNo;
  for i := 1 to DataSource3.DataSet.RecordCount do
    begin
      DataSource3.DataSet.RecNo := i;
      SetProgressValue(Round(i*100/DataSource3.DataSet.RecordCount),' ');
      for k := 1 to dbgMain.Columns.Count do
        begin
          XL.Range[GetLetterFromInt(k)+IntToStr(5+i)+':'+GetLetterFromInt(k)+IntToStr(5+i)].Select;
          XL.Selection.HorizontalAlignment := xlLeft;
          if DataSource3.DataSet.FieldValues[dbgMain.Columns.Items[k-1].FieldName]<>null then
            XL.Selection.Value := DataSource3.DataSet.FieldValues[dbgMain.Columns.Items[k-1].FieldName];
        end;
    end;
  DataSource3.DataSet.RecNo := n;

  XL.Cells.Range['A1:A1'].Select;

  XL.Visible := True;
  XL := unassigned;
  
  SetProgressValue(0,' ');
  dbgMain.Enabled := True;
  Self.Enabled := True;
end;

procedure TMainForm.N126Click(Sender: TObject);
begin                                   // высказывание о программе ТЕЛЕМАСТЕР 2
  try
    Application.CreateForm(TForm36, Form36);
    Form36.ShowModal;
  finally
    Form36.Hide;
    Form36.Free;
  end;
end;

procedure TMainForm.N129Click(Sender: TObject);
begin                                  // учетные записи пользователей программы
  if Configuration.UserType<>1 then
    begin
      ShowInfoMessage('У Вас отсутствуют права на изменение данных настроек','Политика безопасности',true);
      Exit;
    end;
    
  try
    Application.CreateForm(TForm35, Form35);
    Form35.ShowModal;
  finally
    Form35.Hide;
    Form35.Free;
  end;
end;

procedure TMainForm.N130Click(Sender: TObject);
begin
  Sorting;
end;

procedure TMainForm.N132Click(Sender: TObject);
begin
  ConnectSQL(SmallNeedsQuery, 'Select * from Passwords');
  if SmallNeedsQuery.RecordCount=0 then
      ShowInfoMessage('У Вас не настроены учетные записи политики безопасности. Сначала добавьте хотя бы одного пользователя системы.','Блокирование программы',true)
    else
      try
        Application.CreateForm(TForm37, Form37);
        Form37.Label1.Caption := '    Программа была заблокирована. Прошу Вас ввести свой login и пароль...';
        Form37.ShowModal;
      finally
        Form37.Hide;
        Form37.Free;
      end;
end;

end.
