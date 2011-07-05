// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Поиск заказа
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit FindThat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, Addition, DB;

type
  TForm7 = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Image1: TImage;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    Label3: TLabel;
    Label5: TLabel;
    CheckBox2: TCheckBox;
    Bevel1: TBevel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses MainWindow;

{$R *.dfm}

procedure TForm7.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm7.Label4Click(Sender: TObject);
begin
  CheckBox1.Checked:=not(CheckBox1.Checked);
end;

procedure TForm7.Label3Click(Sender: TObject);
begin
  CheckBox3.Checked:=not(CheckBox3.Checked);
end;

procedure TForm7.Label5Click(Sender: TObject);
begin
  CheckBox2.Checked:=not(CheckBox2.Checked);
end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
var SearchField: string;
  LocateOptions: TLocateOptions;
begin
  if Edit1.Text='' then Exit;

  LocateOptions:=[loPartialKey];
// ---------
  if CheckBox1.Checked then LocateOptions:=LocateOptions+[loCaseInsensitive];
  if CheckBox3.Checked then LocateOptions:=LocateOptions-[loPartialKey];
// ---------
  case ComboBox1.ItemIndex of
    0: SearchField:='Model';
    1: SearchField:='FirmName';
    2: SearchField:='Number';
    3: SearchField:='ClientName';
    4: SearchField:='ClientAddress';
    5: SearchField:='ClientHPhone';
    6: SearchField:='ClientWPhone';
    7: SearchField:='DocNum';
  end;
  if CheckBox2.Checked then
    begin
      ConnectSQL(MainForm.SmallNeedsQuery,'SELECT MainTable.*, (Users.LastName+" "+Left(Users.FirstName,1)+"."+Left(Users.FatherName,1)+".") AS MasterName, Clients.Name AS ClientName, Clients.PhoneH as ClientHPhone, Clients.PhoneW as ClientWPhone, Clients.Address as ClientAddress,'#13+
                                       'Firms.Name AS FirmName, Types.Name AS TypeName, (Types.Name+" "+Firms.Name+" "+Model) AS Name'#13+
                                       'FROM Firms RIGHT JOIN (Types RIGHT JOIN (Users RIGHT JOIN (Clients RIGHT JOIN MainTable ON Clients.Id=MainTable.ClientId) ON Users.Id=MainTable.MasterId) ON Types.Id=MainTable.Type) ON Firms.Id=MainTable.Firm Where MainTable.Attention2=false;');
      if MainForm.SmallNeedsQuery.Locate(SearchField,Edit1.Text,LocateOptions)=false then
        begin
          ShowInfoMessage('Поиск по таким параметрам результатов не дал!','Внимание');
          MainForm.SmallNeedsQuery.Active:=False;
          Exit;
        end;

      with MainForm do
      begin
        Configuration.FilterMonth:=0;
        Configuration.FilterYear:=0;
        case SmallNeedsQuery.FieldValues['Status'] of
          1: sbInRepairClick(sbInRepair);
          2: sbInRepairClick(sbRepaired);
          3: sbInRepairClick(sbGuarantee);
          4: sbInRepairClick(sbArchive);
          5: sbInRepairClick(sbTrash);
        end;
        DataSource3.DataSet.Locate(SearchField,Edit1.Text,LocateOptions);
      end;
      
      Exit;
    end;

  if MainForm.DataSource3.DataSet.Locate(SearchField, Edit1.Text, LocateOptions)=false then
    begin
      ShowInfoMessage('Поиск по таким параметрам результатов не дал!','Внимание');
      Exit;
    end;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
  ColorApply(Form7);
end;

end.
