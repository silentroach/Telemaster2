// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Добавление нового мастера
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit UserAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, Mask, DB, ADODB, Addition,
  RThemedPanel, RButton,

  tlDatabase, amDatabase;

type
  TAddMasterForm = class(TForm)
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    RThemedPanel1: TRThemedPanel;
    Bevel1: TBevel;
    eSurname: TEdit;
    eName: TEdit;
    eFather: TEdit;
    eAddress: TEdit;
    ePhone: TEdit;
    ePayment: TEdit;
    rbPOrganization: TRadioButton;
    rbPPercent: TRadioButton;
    rbPPrice: TRadioButton;
    tbPercent: TTrackBar;
    lPercent: TLabel;
    lFName: TLabel;
    lName: TLabel;
    lSurname: TLabel;
    lPhone: TLabel;
    lAddress: TLabel;
    Label12: TLabel;
    lPayment: TLabel;
    lPPrice: TLabel;
    lPPercent: TLabel;
    lPOrganization: TLabel;
    rbAdd: TRButton;
    rbCancel: TRButton;
    procedure rbCancelClick(Sender: TObject);
    procedure rbAddClick(Sender: TObject);
    procedure lPPriceClick(Sender: TObject);
    procedure lPPercentClick(Sender: TObject);
    procedure rbPPriceClick(Sender: TObject);
    procedure rbPPercentClick(Sender: TObject);
    procedure tbPercentChange(Sender: TObject);
    procedure lPOrganizationClick(Sender: TObject);
    procedure rbPOrganizationClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
    TypeAddition: boolean;                     // тип - добавление или изменение
  end;

var
  AddMasterForm: TAddMasterForm;

implementation

uses MainWindow, Users;

{$R *.dfm}

procedure TAddMasterForm.lPPriceClick(Sender: TObject);
begin
  rbPPrice.Checked  := True;
  tbPercent.Enabled := False;
  lPercent.Enabled  := False;
  ePayment.Enabled  := True;
end;

procedure TAddMasterForm.lPPercentClick(Sender: TObject);
begin
  rbPPercent.Checked := True;
  ePayment.Text := '';
  ePayment.Enabled := False;
  tbPercent.Enabled := True;
  lPercent.Enabled := True;
end;

procedure TAddMasterForm.rbPPriceClick(Sender: TObject);
begin
  lPPriceClick(Self)
end;

procedure TAddMasterForm.rbPPercentClick(Sender: TObject);
begin
  lPPercentClick(Self);
end;

procedure TAddMasterForm.tbPercentChange(Sender: TObject);
begin
  lPercent.Caption := IntToStr(tbPercent.Position) + '%';
  tbPercent.SelStart := 0;
  tbPercent.SelEnd := tbPercent.Position;
end;

procedure TAddMasterForm.lPOrganizationClick(Sender: TObject);
begin
  ePayment.Text := '';
  ePayment.Enabled := False;

  rbPOrganization.Checked := True;
  tbPercent.Enabled := True;
  lPercent.Enabled:=True;
end;

procedure TAddMasterForm.rbPOrganizationClick(Sender: TObject);
begin
  lPOrganizationClick(Self);
end;

procedure TAddMasterForm.FormActivate(Sender: TObject);
begin
  eSurname.SetFocus;
end;

procedure TAddMasterForm.FormCreate(Sender: TObject);
begin
  ColorApply(Self);
end;

procedure TAddMasterForm.rbAddClick(Sender: TObject);
var CashType: 1..3;
   CashValue: currency;
begin
  if Trim(eSurname.Text) = '' then Exit;
  if (rbPPrice.Checked) and (Trim(ePayment.Text) = '') then Exit;

  CashType := 1;
  if rbPPrice.Checked then        CashType := 1 else
  if rbPPercent.Checked then      CashType := 2 else
  if rbPOrganization.Checked then CashType := 3;

  if rbPPrice.Checked then CashValue := StrToFloat(ePayment.Text)
                      else CashValue := tbPercent.Position;

  if TypeAddition then
    ExecuteQuery([
        'INSERT INTO [Users]',
          '(LastName, FirstName, FatherName, Address, Phone, CashType, CashValue)',
        'VALUES',
          '(:LastName, :FirstName, :FatherName, :Address, :Phone, :CashType, :CashValue)'
      ], [
        Param(ftString, eSurname.Text),               // фамилия мастера
        Param(ftString, eName.Text),                  // имя мастера
        Param(ftString, eFather.Text),                // отчество мастера
        Param(ftString, eAddress.Text),               // адрес
        Param(ftString, ePhone.Text),                 // телефон
        Param(ftInteger, CashType),                   // тип зарплаты
        Param(ftFloat, CashValue)                     // зарплата
      ]) else
    ExecuteQuery([
        'UPDATE [Users]',
          'SET LastName = :LastName, ',
              'FirstName = :FirstName, ',
              'FatherName = :FatherName, ',
              'Address = :Address, ',
              'Phone = :Phone, ',
              'CashType = :CashType, ',
              'CashValue = :CashValue ',
        'WHERE Id = :Id'
      ], [
        Param(ftString, eSurname.Text),               // фамилия мастера
        Param(ftString, eName.Text),                  // имя мастера
        Param(ftString, eFather.Text),                // отчество мастера
        Param(ftString, eAddress.Text),               // адрес
        Param(ftString, ePhone.Text),                 // телефон
        Param(ftInteger, CashType),                   // тип зарплаты
        Param(ftFloat, CashValue),                    // зарплата
        Param(ftInteger, Form2.DataSource1.DataSet.FieldValues['Id'])
      ]);

  Close;
end;

procedure TAddMasterForm.rbCancelClick(Sender: TObject);
begin
  Close;
end;

end.
