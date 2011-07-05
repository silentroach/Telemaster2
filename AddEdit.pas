// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Однострочное редактирование
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit AddEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Addition;

type
  TForm11 = class(TForm)
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Edit1: TEdit;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    ExitResult: boolean;                                // выход - ок или отмена
    procedure ShowForm(Caption, LabelStr, ButtonCap: string);
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

procedure TForm11.ShowForm(Caption, LabelStr, ButtonCap: string);
begin
  Form11.Caption:=Caption;
  Label1.Caption:=LabelStr;
  SpeedButton3.Caption:=ButtonCap;
  Form11.ShowModal;
end;

procedure TForm11.SpeedButton1Click(Sender: TObject);
begin
  ExitResult:=false;
  Close;
end;

procedure TForm11.SpeedButton3Click(Sender: TObject);
begin
  if Edit1.Text='' then
    begin
      ShowInfoMessage('Вы не заполнили обязательные поля!','Внимание',true);
      Exit;
    end;
  ExitResult:=true;
  Close;
end;

procedure TForm11.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then SpeedButton3Click(Self);
end;

procedure TForm11.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TForm11.FormCreate(Sender: TObject);
begin
  ColorApply(Form11);
end;

end.
