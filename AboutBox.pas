// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Модуль окна "о программе"
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------


unit AboutBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, glLabel, ComCtrls, Buttons, ShellAPI,
  OleCtrls, Menus, Addition;

type
  TForm6 = class(TForm)
    SpeedButton1: TSpeedButton;
    pcMain: TPageControl;
    tsMain: TTabSheet;
    lMain: TglLabel;
    TabSheet3: TTabSheet;
    Memo1: TMemo;
    glLabel15: TglLabel;
    lMain2: TglLabel;
    lMain3: TglLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses MainWindow;

{$R *.dfm}

procedure TForm6.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm6.Image2Click(Sender: TObject);
begin
  ShellExecute(handle,'open','http://www.telemaster.ru',nil,nil,sw_shownormal);
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  ColorApply(Form6);
end;

end.
