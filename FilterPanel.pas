// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Frame - Панель фильтрации
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit FilterPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ElXPThemedControl, ElTree, DB, ADODB, ExtCtrls,
  StdCtrls;

type
  TFrame1 = class(TFrame)
    ElTree1: TElTree;
    SpeedButton4: TSpeedButton;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    Image1: TImage;
    Shape1: TShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
