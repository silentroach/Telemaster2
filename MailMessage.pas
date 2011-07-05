unit MailMessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Addition, ShellApi;

type
  TForm36 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    Edit1: TEdit;
    Memo1: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Label1: TLabel;
    Image1: TImage;
    CheckBox1: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  Form36: TForm36;

implementation

uses MainWindow;

{$R *.dfm}

procedure TForm36.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm36.Button1Click(Sender: TObject);
var Mark: string;
begin
  if Edit1.Text='' then
    begin
      ShowInfoMessage('Заполните, пожалуйста поле со своим Ф.И.О.','Отзыв о программе',true);
      Exit;
    end;
  if Memo1.Lines.Text='' then
    begin
      ShowInfoMessage('Заполните, пожалуйста, текст сообщения','Отзыв о программе',true);
      Exit;
    end;
  //JVMail1.Recipient.AddRecipient('roachart@mail.ru','RoachArt');

  Mark:='Ставлю программе оценку ';
  if RadioButton1.Checked then Mark:=Mark+'1';
  if RadioButton2.Checked then Mark:=Mark+'2';
  if RadioButton3.Checked then Mark:=Mark+'3';
  if RadioButton4.Checked then Mark:=Mark+'4';
  if RadioButton5.Checked then Mark:=Mark+'5';

  Memo1.Lines.Text:='Уважаемый Игорь Николаевич!'#13'--------------------------------------------'#13#13+
                    Memo1.Lines.Text+#13#13+Mark+#13'--------------------------------------------'#13+
                    'Письмо сгенерировано программой Телемастер 2';

                    {
  JVMail1.Body:=Memo1.Lines;
  JvMail1.Subject:='Отзыв о программе Телемастер 2';
  if CheckBox1.Checked then
    JVMail1.Attachment.Add(ExtractFilePath(paramstr(0))+'errors.log');
  JvMail1.SendMail(true);   }

  Close;
end;

procedure TForm36.FormActivate(Sender: TObject);
begin
  if Edit1.Text='' then Edit1.SetFocus
                   else Memo1.SetFocus;
end;

procedure TForm36.FormShow(Sender: TObject);
begin
  Edit1.Text:=MainForm.Config.ReadString('Registration','Name','---');
end;

procedure TForm36.FormCreate(Sender: TObject);
begin
  if FileExists(ExtractFilePath(paramstr(0))+'errors.log') then
      begin
        CheckBox1.Enabled:=True;
        CheckBox1.Checked:=True;
      end
    else
      begin
        CheckBox1.Enabled:=False;
        CheckBox1.Checked:=False;
      end;
end;

end.
