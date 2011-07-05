// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Сообщение - вопрос
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit QuestionMessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TForm34 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Bevel1: TBevel;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    FormResult: boolean;
  end;

var
  Form34: TForm34;

implementation

{$R *.dfm}

procedure TForm34.Button2Click(Sender: TObject);
begin
  FormResult:=true;
  Close;
end;

procedure TForm34.Button1Click(Sender: TObject);
begin
  FormResult:=false;
  Close;
end;

end.
