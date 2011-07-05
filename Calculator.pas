// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Калькулятор
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit Calculator;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, StrUtils, Addition, ComCtrls,
  Recognition;

type
  TForm26 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    SpeedButton6: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Image1: TImage;
    procedure FlatButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Label3MouseEnter(Sender: TObject);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form26: TForm26;

implementation

{$R *.dfm}

{ TForm26 }

procedure TForm26.FlatButton25Click(Sender: TObject);
begin
  Close;
end;

procedure TForm26.SpeedButton2Click(Sender: TObject);
begin
  Edit1.Text:='';
end;

procedure TForm26.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm26.SpeedButton6Click(Sender: TObject);
var s: string;
    a: extended;
begin
  if Edit1.Text='' then
    begin
      ShowInfoMessage('Строка для расчета пуста!','Расчет формулы',true);
      Exit;
    end;
  s:=Edit1.Text;
  Preparation(s,[]);
  Recogn(s,a);

  Edit1.Text:=FloatToStr(a);
  Edit1.SelStart:=Length(Edit1.Text);
end;

procedure TForm26.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TForm26.Label3MouseEnter(Sender: TObject);
begin
  (Sender as TLabel).Font.Style:=(Sender as TLabel).Font.Style+[fsUnderline];
end;

procedure TForm26.Label3MouseLeave(Sender: TObject);
begin
  (Sender as TLabel).Font.Style:=(Sender as TLabel).Font.Style-[fsUnderline];
end;

procedure TForm26.Label3Click(Sender: TObject);
var calc: string;
   start: integer;
begin
  Start:=Edit1.SelStart;
  calc:=LeftStr(Edit1.Text,Edit1.SelStart);
  calc:=calc+(Sender as TLabel).Caption+'()';
  calc:=calc+RightStr(Edit1.Text,Length(Edit1.Text)-Edit1.SelStart);

  Edit1.Text:=calc;
  Edit1.SelStart:=Start+Length((Sender as TLabel).Caption)+1;
end;

procedure TForm26.FormCreate(Sender: TObject);
begin
  ColorApply(Form26);
end;

end.
