// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Информационное сообщение
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit InfoMessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  TForm33 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Button1: TButton;
    Label1: TLabel;
    Bevel1: TBevel;
    Image1: TImage;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    MessageType: 0..1;
  end;

var
  Form33: TForm33;

implementation

{$R *.dfm}

procedure TForm33.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm33.FormActivate(Sender: TObject);
begin
  Beep;
end;

procedure TForm33.FormShow(Sender: TObject);
begin
  if MessageType=0 then Image1.Hide
                   else Image2.Hide;
end;

end.
