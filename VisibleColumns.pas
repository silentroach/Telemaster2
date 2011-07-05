// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Видимые колонки в главной таблице
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit VisibleColumns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, DB, ComCtrls, RButton, ADODB, DBTables,
  RThemedPanel,

  amDatabase, Addition,
  tlDatabase;

type
  TVisibleColumnsForm = class(TForm)
    RThemedPanel1: TRThemedPanel;
    lbColumnsSource: TListBox;
    lbColumnsTarget: TListBox;
    sbUp: TSpeedButton;
    sbDown: TSpeedButton;
    sbLeft: TSpeedButton;
    sbRight: TSpeedButton;
    lblSource: TLabel;
    lblVisible: TLabel;
    sbApply: TRButton;
    sbClose: TRButton;
    procedure sbCloseClick(Sender: TObject);
    procedure lbColumnsSourceDblClick(Sender: TObject);
    procedure sbApplyClick(Sender: TObject);
    procedure lbColumnsTargetDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbRightClick(Sender: TObject);
    procedure sbLeftClick(Sender: TObject);
    procedure sbUpClick(Sender: TObject);
    procedure sbDownClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure SwapStrings(Component: TObject; FirstIndex, SecondIndex: integer);
    procedure FillFields;
  public
    { Public declarations }
  end;

var
  VisibleColumnsForm: TVisibleColumnsForm;

implementation

uses MainWindow;

{$R *.dfm}

procedure TVisibleColumnsForm.sbCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TVisibleColumnsForm.lbColumnsSourceDblClick(Sender: TObject);
begin
  sbRightClick(Self);
end;

procedure TVisibleColumnsForm.sbApplyClick(Sender: TObject);
var i: integer;
begin
  if lbColumnsTarget.Items.Count = 0 then
  begin                      // предупреждение о видимой хотя бы одной колонке
    ShowInfoMessage('Должна быть видима хотя бы одна колонка!','Внимание',true);
    Exit;
  end;

// делаем все колонки невидимыми
  ExecuteQuery([
      'UPDATE TableColumns SET Visible = false;'
    ], [nullparam]);

// и заполняем все остальное
  for i := 0 to lbColumnsTarget.Items.Count - 1 do
  begin
    ExecuteQuery([
        'UPDATE TableColumns SET Visible = True ',
        'WHERE Id = :id'
      ], [
        Param(ftInteger, Integer(lbColumnsTarget.Items.Objects[i]))
      ]);
      
    ExecuteQuery([
        'UPDATE TableColumns SET [Position] = :pos ',
        'WHERE Id = :id'
      ], [
        Param(ftInteger, i + 1),
        Param(ftInteger, Integer(lbColumnsTarget.Items.Objects[i]))
      ]);
  end;
  sbCloseClick(Self);

  MainForm.ColumnsBuild;
  MainForm.Sorting;
end;

procedure TVisibleColumnsForm.SwapStrings(Component: TObject; FirstIndex,
  SecondIndex: integer);
begin
  if (Component is TListBox) then
    (Component as TListBox).Items.Move(FirstIndex, SecondIndex);
end;

procedure TVisibleColumnsForm.lbColumnsTargetDblClick(Sender: TObject);
begin
  sbLeftClick(Self);
end;

procedure TVisibleColumnsForm.FormShow(Sender: TObject);
begin
  FillFields;
end;

procedure TVisibleColumnsForm.sbRightClick(Sender: TObject);
begin
  if lbColumnsSource.ItemIndex <> -1 then
  begin
    lbColumnsTarget.Items.AddObject(
      lbColumnsSource.Items.Strings[lbColumnsSource.ItemIndex],
      lbColumnsSource.Items.Objects[lbColumnsSource.ItemIndex]);
    lbColumnsSource.DeleteSelected;
  end;
end;

procedure TVisibleColumnsForm.sbLeftClick(Sender: TObject);
begin
  if lbColumnsTarget.ItemIndex <> -1 then
  begin
    lbColumnsSource.Items.AddObject(
      lbColumnsTarget.Items.Strings[lbColumnsTarget.ItemIndex],
      lbColumnsTarget.Items.Objects[lbColumnsTarget.ItemIndex]);
    lbColumnsTarget.DeleteSelected;
  end;
end;

procedure TVisibleColumnsForm.sbUpClick(Sender: TObject);
begin
  if lbColumnsTarget.ItemIndex > 0 then
  begin
    SwapStrings(
      lbColumnsTarget,
      lbColumnsTarget.ItemIndex,
      lbColumnsTarget.ItemIndex - 1);
  end;
end;

procedure TVisibleColumnsForm.sbDownClick(Sender: TObject);
begin
  if (lbColumnsTarget.ItemIndex >- 1) and
     (lbColumnsTarget.ItemIndex < lbColumnsTarget.Items.Count - 1) then
  begin
    SwapStrings(
      lbColumnsTarget,
      lbColumnsTarget.ItemIndex,
      lbColumnsTarget.ItemIndex + 1);
  end;
end;

procedure TVisibleColumnsForm.FormCreate(Sender: TObject);
begin
  ColorApply(Self);
end;

procedure TVisibleColumnsForm.FillFields;
var
  TempQuery: TADOQuery;
begin
  TempQuery := OpenQuery([
      'SELECT Id, VisibleName, Visible ',
      'FROM Captions'
    ], [nullparam]);
  try
    while not TempQuery.EOF do
    begin
      if TempQuery.FieldByName('Visible').AsBoolean
        then lbColumnsTarget.Items.AddObject(
               TempQuery.FieldByName('VisibleName').AsString,
               Pointer(TempQuery.FieldByName('Id').AsInteger))
        else lbColumnsSource.Items.AddObject(
               TempQuery.FieldByName('VisibleName').AsString,
               Pointer(TempQuery.FieldByName('Id').AsInteger));
      TempQuery.Next;
    end;
  finally
    TempQuery.Free;
  end;
end;

end.
