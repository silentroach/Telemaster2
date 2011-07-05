// -----------------------------------------------------------------------------
//
//    ���������� v2.0
//    ������ �� �������
//
//                                            by ���������� ����� aka .:SILENT:.
// -----------------------------------------------------------------------------

unit ClientDial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls, Addition;

type
  TForm31 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Edit1: TEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    SpeedButton6: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Image1: TImage;
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ShowDial(PhoneNum: string);
  end;

var
  Form31: TForm31;
  hCommFile: THandle;

implementation

uses MainWindow;

{$R *.dfm}

procedure TForm31.SpeedButton6Click(Sender: TObject);
var
    PhoneNumber: string;
       CommPort: string;
  NumberWritten: Cardinal;
begin
  if Edit1.Text='' then
    begin
      ShowInfoMessage('���������� ������ ������ �� ��������.'#13'������� ������� �����, � ����� ��������� ������ <�������>.','������ �� ��������',true);
      Exit;
    end;
// ------------------
  if MainForm.Config.ReadBool('DialUp','Type',false)=false then
    PhoneNumber:='ATDP ' else PhoneNumber:='ATDT ';
  PhoneNumber:=PhoneNumber+Edit1.Text+#13+#10;
  CommPort := 'COM' + IntToStr(MainForm.Config.ReadInteger('DialUp', 'ComPort', 3));
// ------------------- �������� Com-�����
  hCommFile:=CreateFile(PChar(CommPort),GENERIC_WRITE,0,nil,
                        OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);
  if hCommFile=INVALID_HANDLE_VALUE then
    begin
      ShowInfoMessage('�� ���� ������� com-port ������. ��������� ��������� �������.','��������',true);
      Exit;
    end;
// ------------------- ������ �� ��������
  NumberWritten:=0;
  if WriteFile(hCommFile,PChar(PhoneNumber)^,Length(PhoneNumber),
               NumberWritten,nil)=false then
    ShowInfoMessage('�� ���� ���������� ������ � com-port.','��������',true);
end;

procedure TForm31.SpeedButton2Click(Sender: TObject);
begin
  CloseHandle(hCommFile);
end;

procedure TForm31.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm31.ShowDial(PhoneNum: string);
begin
  Edit1.Text:=PhoneNum;
end;

procedure TForm31.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TForm31.FormCreate(Sender: TObject);
begin
  ColorApply(Form31);
end;

end.
