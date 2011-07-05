unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Mask, StdCtrls, ExtCtrls, DB, ADODB, Addition;

type
  TForm37 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Edit1: TEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Image1: TImage;
    Bevel2: TBevel;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    TryNum: integer;
    procedure MainFormTransform(UserType: integer; Login: string);
  public
    { Public declarations }
  end;

var
  Form37: TForm37;

implementation

uses MainWindow;

{$R *.dfm}

procedure TForm37.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TForm37.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm37.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((ssAlt in Shift) and (Key = VK_F4)) then
    Key:=0;
end;

procedure TForm37.FormCreate(Sender: TObject);
begin
  TryNum:=0;
  Form37.KeyPreview:=true;
end;

procedure TForm37.Button1Click(Sender: TObject);
var i: integer;
begin
  ConnectSQL(ADOQuery1,'Select * from Passwords Where Login="'+Edit1.Text+'"');
  if DataSource1.DataSet.RecordCount<>0 then
    for i:=1 to DataSource1.DataSet.RecordCount do
      begin
        DataSource1.DataSet.RecNo:=i;
        if DataSource1.DataSet.FieldValues['Pass']=MaskEdit1.Text then
          begin
            MainFormTransform(DataSource1.DataSet.FieldValues['UserType'],
                              DataSource1.DataSet.FieldValues['Login']);
            ADOQuery1.Active:=False;            
            Close;
            Exit;
          end;
      end;
  ADOQuery1.Active:=False;
  
  if TryNum=2 then
      begin
        ShowInfoMessage('Вы, вероятно, незванный гость... Прошу Вас, не заходите в программу, не предназначенную для Вашего просмотра.','Вход в систему',true);
        Application.Terminate;
      end
    else
      begin
        ShowInfoMessage('Введенный Вами login или пароль неверен. Пожалуйста, будьте внимательны при наборе Ваших данных.','Вход в систему');
        Inc(TryNum);
      end;
end;


procedure TForm37.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Button1Click(Self);
end;

procedure TForm37.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Button1Click(Self);
end;

procedure TForm37.MainFormTransform(UserType: integer; Login: string);
begin                                // добавление в заголовок типа пользователя
  MainForm.Caption:='Телемастер v2.07 - '+Login+' (';

  with MainForm do
  begin
    case UserType of
      1: Caption := Caption + 'администратор';
      2: Caption := Caption + 'диспетчер';
      3: Caption := Caption + 'начальник';
    end;
    Configuration.UserType := UserType;
    Caption := Caption+')';
  end;
end;

end.
