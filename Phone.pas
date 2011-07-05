// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Телефонная книжка
//
//                                            by Калашников Игорь aka .:SILENT:.
// -----------------------------------------------------------------------------

unit Phone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, VolDBGrid, ComCtrls, Buttons, DB, ADODB, ShellAPI,
  StdCtrls, Addition;

type
  TConfig = record
    SortColumn: 0..1;                                   // сортировка по столбцу
    SortType: TVolgaSortMark;                           // тип сортировки
  end;
  TForm9 = class(TForm)
    TabControl1: TTabControl;
    VolgaDBGrid1: TVolgaDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ScrollBar1: TScrollBar;
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
    Shape2: TShape;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Shape1: TShape;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VolgaDBGrid1TitleClick(Sender: TObject;
      Column: TVolgaColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure VolgaDBGrid1DrawCellAttr(Sender: TObject;
      Column: TVolgaColumn; AFont: TFont; var AColor: TColor;
      State: TGridDrawState);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure Label16MouseEnter(Sender: TObject);
    procedure Label16MouseLeave(Sender: TObject);
    procedure Label17MouseEnter(Sender: TObject);
    procedure Label17MouseLeave(Sender: TObject);
    procedure Label18MouseEnter(Sender: TObject);
    procedure Label18MouseLeave(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Label16Click(Sender: TObject);
  private
    procedure FillTabs;
    procedure Sorting;
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  Config: TConfig;

implementation

uses PhoneTabs, PhonesAdd, ClientDial;

{$R *.dfm}

procedure TForm9.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  ColorApply(Form9);

  Config.SortColumn:=0;
  Config.SortType:=vsmDown;
  FillTabs;  
  Sorting;
end;

procedure TForm9.VolgaDBGrid1TitleClick(Sender: TObject;
  Column: TVolgaColumn);
begin
  if Column.Index<>Config.SortColumn then
      begin
        Config.SortColumn:=Column.Index;
        Config.SortType:=vsmDown;
      end
    else
      if Config.SortType=vsmDown then Config.SortType:=vsmUp
                                 else Config.SortType:=vsmDown;
  Sorting;
end;

procedure TForm9.Sorting;
begin
  VolgaDBGrid1.Columns[Config.SortColumn].SortMark:=Config.SortType;
  ADOQuery2.Active:=False;
  ADOQuery2.SQL.Clear;
  VolgaDBGrid1.Columns[0].FieldName:='Name';
  if TabControl1.TabIndex>0 then
      begin
        VolgaDBGrid1.Columns[1].FieldName:='Phone1';
        DataSource1.DataSet.Locate('Name',TabControl1.Tabs.Strings[TabControl1.TabIndex],[]);
        ADOQuery2.SQL.Add('Select * from Phones Where TabId='+IntToStr(DataSource1.DataSet.FieldValues['Id'])+' Order by '+VolgaDBGrid1.Columns[Config.SortColumn].FieldName);
        if Config.SortType=vsmDown then ADOQuery2.SQL.Add('asc;')
                                   else ADOQuery2.SQL.Add('desc;');
      end
    else
      begin
        VolgaDBGrid1.Columns[1].FieldName:='Phone';
        ADOQuery2.SQL.Add('Select *, (LastName+" "+FirstName+" "+FatherName) as Name from Users ');
        if Config.SortColumn=0 then ADOQuery2.SQL.Add('Order by (LastName+" "+FirstName+" "+FatherName) ')
                               else ADOQuery2.SQL.Add('Order by '+VolgaDBGrid1.Columns[Config.SortColumn].FieldName+' ');
        if Config.SortType=vsmDown then ADOQuery2.SQL.Add('asc;')
                                   else ADOQuery2.SQL.Add('desc;');
      end;
  ADOQuery2.Active:=True;
  ScrollBar1.Min:=1;
  if DataSource2.DataSet.RecordCount>0 then ScrollBar1.Max:=DataSource2.DataSet.RecordCount
                                       else ScrollBar1.Max:=1;
  ScrollBar1.PageSize:=1;
end;

procedure TForm9.SpeedButton1Click(Sender: TObject);
begin                                              // закладки телефонной книжки
  try
    Application.CreateForm(TForm16, Form16);
    Form16.ShowModal;
  finally
    Form16.Hide;
    Form16.Free;
    FillTabs;
    Sorting;
  end;
end;

procedure TForm9.FillTabs;
var i: integer;
begin                                                 // заполнение tabов книжки
  TabControl1.Tabs.Clear;
  TabControl1.Tabs.Add('Мастера организации');
  ADOQuery1.Active:=False;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('Select * from PhoneTabs order by Name asc');
  ADOQuery1.Active:=True;
  for i:=1 to DataSource1.DataSet.RecordCount do
    begin
      DataSource1.DataSet.RecNo:=i;
      TabControl1.Tabs.Add(DataSource1.DataSet.FieldValues['Name']);
    end;
end;

procedure TForm9.TabControl1Change(Sender: TObject);
begin
  Sorting;
end;

procedure TForm9.VolgaDBGrid1DrawCellAttr(Sender: TObject;
  Column: TVolgaColumn; AFont: TFont; var AColor: TColor;
  State: TGridDrawState);
begin
  if AColor=VolgaDBGrid1.HighlightColor then
    begin
      ScrollBar1.Position:=DataSource2.DataSet.RecNo;
      if DataSource2.DataSet.RecordCount>0 then
          begin
            Label2.Caption:=DataSource2.DataSet.FieldValues['Name'];
            Label4.Caption:=DataSource2.DataSet.FieldValues['Address'];
            if TabControl1.TabIndex=0 then
                begin
                  Label6.Caption:=DataSource2.DataSet.FieldValues['Phone'];
                  Label8.Caption:='---';
                  Label10.Caption:='---';
                  Label12.Caption:='---';
                  Label14.Caption:='работник организации';
                end
              else
                begin
                  Label6.Caption:=DataSource2.DataSet.FieldValues['Phone1'];
                  if Label6.Caption='' then Label6.Caption:='---';
                  Label8.Caption:=DataSource2.DataSet.FieldValues['Phone2'];
                  if Label8.Caption='' then Label8.Caption:='---';
                  Label10.Caption:=DataSource2.DataSet.FieldValues['EMail'];
                  if Label10.Caption='' then Label10.Caption:='---';
                  Label12.Caption:=DataSource2.DataSet.FieldValues['Site'];
                  if Label12.Caption='' then Label12.Caption:='---';
                  Label14.Caption:=DataSource2.DataSet.FieldValues['Memo'];
                  if Label14.Caption='' then Label14.Caption:='---';
                end;
          end
        else
          begin
            Label2.Caption:='';
            Label4.Caption:='';
            Label6.Caption:='';
            Label8.Caption:='';
            Label10.Caption:='';
            Label12.Caption:='';
            Label14.Caption:='';
          end;
    end;
end;

procedure TForm9.ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
  DataSource2.DataSet.RecNo:=ScrollPos;
end;

procedure TForm9.Label16MouseEnter(Sender: TObject);
begin
  Label16.Font.Style:=Label16.Font.Style+[fsUnderline];
end;

procedure TForm9.Label16MouseLeave(Sender: TObject);
begin
  Label16.Font.Style:=Label16.Font.Style-[fsUnderline];
end;

procedure TForm9.Label17MouseEnter(Sender: TObject);
begin
  Label17.Font.Style:=Label17.Font.Style+[fsUnderline];
end;

procedure TForm9.Label17MouseLeave(Sender: TObject);
begin
  Label17.Font.Style:=Label17.Font.Style-[fsUnderline];
end;

procedure TForm9.Label18MouseEnter(Sender: TObject);
begin
  Label18.Font.Style:=Label18.Font.Style+[fsUnderline];
end;

procedure TForm9.Label18MouseLeave(Sender: TObject);
begin
  Label18.Font.Style:=Label18.Font.Style-[fsUnderline];
end;

procedure TForm9.SpeedButton3Click(Sender: TObject);
begin                                                     // добавление абонента
  if DataSource1.DataSet.RecordCount>0 then
      try
        Application.CreateForm(TForm17, Form17);
        Form17.ShowModal;
      finally
        Form17.Hide;
        Form17.Free;
        Sorting;
      end
    else ShowInfoMessage('В записной книжке отсутствуют закладки. Сначала создайте закладку.','Внимание',true);
end;

procedure TForm9.Label18Click(Sender: TObject);
begin
  if Label12.Caption<>'---' then
    ShellExecute(handle,'open',pChar(Label12.Caption),nil,nil,sw_shownormal);
end;

procedure TForm9.Label17Click(Sender: TObject);
begin
  if Label10.Caption<>'---' then
    ShellExecute(handle,'open',pChar('mailto:'+Label10.Caption),nil,nil,sw_shownormal);
end;

procedure TForm9.SpeedButton4Click(Sender: TObject);
begin
  if TabControl1.TabIndex>0 then
    if DataSource2.DataSet.RecordCount>0 then
      if ShowQuestionMessage('Вы действительно хотите удалить абонента?','Внимание')=true then
        DataSource2.DataSet.Delete;
end;

procedure TForm9.Label16Click(Sender: TObject);
var phone: string;
begin
  if (Label6.Caption='-') and (Label8.Caption='-') then Exit;
  if Label6.Caption='-' then phone:=Label8.Caption
                       else phone:=Label6.Caption;
  try
    Application.CreateForm(TForm31,Form31);
    Form31.ShowDial(phone);
    Form31.ShowModal;
  finally
    Form31.Hide;
    Form31.Free;
  end;
end;

end.
