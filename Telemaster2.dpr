program Telemaster2;

{%ToDo 'Telemaster2.todo'}

uses
  Forms,
  MainWindow in 'MainWindow.pas' {MainForm},
  Users in 'Users.pas' {Form2},
  Splash in 'Splash.pas' {Form3},
  UserAdd in 'UserAdd.pas' {AddMasterForm},
  Adding in 'Adding.pas' {Form5},
  AboutBox in 'AboutBox.pas' {Form6},
  FindThat in 'FindThat.pas' {Form7},
  Config in 'Config.pas' {Form8},
  Firms in 'Firms.pas' {Form10},
  Phone in 'Phone.pas' {Form9},
  AppType in 'AppType.pas' {Form12},
  Details in 'Details.pas' {Form13},
  MasterReport in 'MasterReport.pas' {Form14},
  AddEditDetails in 'AddEditDetails.pas' {Form15},
  FilterPanel in 'FilterPanel.pas' {Frame1: TFrame},
  PhoneTabs in 'PhoneTabs.pas' {Form16},
  PhonesAdd in 'PhonesAdd.pas' {Form17},
  NoRecords in 'NoRecords.pas' {Frame2: TFrame},
  MarkRepaired in 'MarkRepaired.pas' {Form19},
  Sending in 'Sending.pas' {Form20},
  Properties in 'Properties.pas' {Form21},
  VisibleColumns in 'VisibleColumns.pas' {VisibleColumnsForm},
  FindedList in 'FindedList.pas' {Form23},
  Calculator in 'Calculator.pas' {Form26},
  Clients in 'Clients.pas' {Form27},
  ChangeClientInfo in 'ChangeClientInfo.pas' {Form28},
  AddEdit in 'AddEdit.pas' {Form11},
  GoodWork in 'GoodWork.pas' {Form29},
  EarnReport in 'EarnReport.pas' {Form30},
  ClientDial in 'ClientDial.pas' {Form31},
  ToolBarConfig in 'ToolBarConfig.pas' {Form32},
  InfoMessage in 'InfoMessage.pas' {Form33},
  QuestionMessage in 'QuestionMessage.pas' {Form34},
  MailMessage in 'MailMessage.pas' {Form36},
  Security in 'Security.pas' {Form35},
  Login in 'Login.pas' {Form37},
  AddUserSecurity in 'AddUserSecurity.pas' {Form38},
  tlConfig in 'Library\tlConfig.pas',
  tlValueTypes in 'Library\tlValueTypes.pas',
  Addition in 'Modules\Addition.pas',
  Recognition in 'Modules\Recognition.pas',
  tlDatabase in 'Library\tlDatabase.pas',
  amDatabase in 'Modules\amDatabase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Телемастер v2.07';
  Form3:=TForm3.Create(Application);
  Form3.Show;
  Form3.Update;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TForm11, Form11);
  Form3.Hide;
  Form3.Free;
  Application.ProcessMessages;
  Application.Run;  
end.
