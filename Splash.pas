// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Splash-screen
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, IniFiles;

type
  TForm3 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel2: TBevel;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetLoadText(Caption: string);
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
var Config: TIniFile;
begin                                                // информация о регистрации
  Config:=TIniFile.Create(ChangeFileExt(paramstr(0),'.ini'));
  Label1.Caption:=Config.ReadString('Registration','Name','незарегистрированная версия');
  Label3.Caption:=Config.ReadString('Registration','SerNumber','');
  Config.Free;
end;

procedure TForm3.SetLoadText(Caption: string);
begin
  Label4.Caption:=Caption;
  Form3.Update;
end;

end.
