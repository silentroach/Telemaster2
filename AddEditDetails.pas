// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Двустрочное редактирование/добавление (деталей)
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit AddEditDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, Addition;

type
  TForm15 = class(TForm)
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Edit2: TEdit;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    ExitResult: boolean;
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

procedure TForm15.SpeedButton1Click(Sender: TObject);
begin
  ExitResult:=False;
  Close;
end;

procedure TForm15.SpeedButton3Click(Sender: TObject);
var probe: extended;
begin
  if Edit1.Text='' then
    begin
      ShowInfoMessage('Введите, пожалуйста, название детали!','Информация о детали');
      Exit;
    end;
  if Edit2.Text='' then
    begin
      ShowInfoMessage('Введите, пожалуйста, цену на использованную деталь!','Информация о детали');
      Exit;
    end;
  if not(TryStrToFloat(Edit2.Text,probe)) then
    begin
      ShowInfoMessage('Цена введена, к сожалению, неверно!','Информация о детали');
      Exit;
    end;

  ExitResult:=True;
  Close;
end;

procedure TForm15.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TForm15.FormCreate(Sender: TObject);
begin
  ColorApply(Form15);
end;

procedure TForm15.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then SpeedButton3Click(Self);
end;

procedure TForm15.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then SpeedButton3Click(Self);
end;

end.
