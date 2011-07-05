// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Окно с найденными совпадениями
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit FindedList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, VolDBGrid;

type
  TForm23 = class(TForm)
    VolgaDBGrid1: TVolgaDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure VolgaDBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
  end;

var
  Form23: TForm23;

implementation

uses Adding;

{$R *.dfm}

procedure TForm23.VolgaDBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then
    begin
      Form5.ClientNum:=DataSource1.DataSet.FieldValues['Id'];
      Form5.FillClient;
      Form23.Hide;
      Form5.Edit3.SelStart:=Length(Form5.Edit3.Text);
    end;
end;

end.
