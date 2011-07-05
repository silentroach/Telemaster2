unit AddUserSecurity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DB, Addition, ADODB;

type
  TForm38 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function LoginExists(Login: string): boolean;
  public
    Adding: boolean;
    UserId: integer;
  end;

var
  Form38: TForm38;

implementation

{$R *.dfm}

procedure TForm38.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0: Label2.Caption:='этот тип учетной записи гарантирует его обладателю доступ к абсолютно любым данным, отчетам и настройкам';
    1: Label2.Caption:='этот тип учетной записи позвол€ет просматривать данные, отчеты, печатать документы и настраивать программу';
    2: Label2.Caption:='этот тип учетной записи предназначен дл€ ввода/редактировани€ данных и вывода их на печать';
  end;
end;

procedure TForm38.FormCreate(Sender: TObject);
begin
  ComboBox1Change(Self);
end;

procedure TForm38.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm38.FormActivate(Sender: TObject);
begin
  ComboBox1.SetFocus;
end;

procedure TForm38.Button1Click(Sender: TObject);
begin
  if (Edit1.Text='') or (Edit2.Text='') then
    begin
      ShowInfoMessage('¬ы не заполнили необходимые дл€ продолжени€ операции пол€. Ѕудьте внимательны при заполнении таких данных.','”четные записи',true);
      Exit;
    end;
  if Adding then
      begin
        if LoginExists(Edit1.Text) then
          begin
            ShowInfoMessage('ѕользователь с таким Login''ом уже существует. ѕожалуйста, будьте внимательны при заполнении таких данных.','ƒобавление пользовател€',true);
            Exit;
          end;
        ConnectSQL(ADOQuery1,'Select * from Passwords');
        DataSource1.DataSet.Locate('Login',Edit1.Text,[loCaseInsensitive]);
        if DataSource1.DataSet.RecordCount>0 then
          if AnsiUpperCase(DataSource1.DataSet.FieldValues['Login'])=AnsiUpperCase(Edit1.Text) then
            begin
              ShowInfoMessage('“акой пользователь уже существует. ѕожалуйста, будьте внимательнее.','ѕользователь уже существует',true);
              ADOQuery1.Active:=False;
              Exit;
            end;
        DataSource1.DataSet.AppendRecord([
                              nil,                        // идентификатор
                              Edit1.Text,                 // login
                              Edit2.Text,                 // пароль
                              ComboBox1.ItemIndex+1       // тип пользовател€
                                        ]);
        ADOQuery1.Active:=False;
        Close;
      end
    else
      begin
        ConnectSQL(ADOQuery1,'Select * from Passwords Where Id='+IntToStr(UserId)+';');
        FieldEdit(DataSource1,'Login',Edit1.Text);
        FieldEdit(DataSource1,'Pass',Edit2.Text);
        FieldEdit(DataSource1,'UserType',ComboBox1.ItemIndex+1);
        ADOQuery1.Active:=False;
        Close;
      end;
end;

procedure TForm38.FormShow(Sender: TObject);
begin
  if not(Adding) then
    begin
      ConnectSQL(ADOQuery1,'Select * from Passwords Where Id='+IntToStr(UserId)+';');
      ComboBox1.ItemIndex:=ADOQuery1.FieldValues['UserType']-1;
      Edit1.Text:=ADOQuery1.FieldValues['Login'];
      Edit2.Text:=ADOQuery1.FieldValues['Pass'];
      ComboBox1Change(Self);
      ADOQuery1.Active:=False;
    end;
end;

function TForm38.LoginExists(Login: string): boolean;
begin                                              // существует ли така€ запись
  ConnectSQL(ADOQuery1,'Select * from Passwords Where Login="'+Login+'";');
  if ADOQuery1.RecordCount>0 then Result:=true else Result:=false;
  ADOQuery1.Active:=False;
end;

end.
