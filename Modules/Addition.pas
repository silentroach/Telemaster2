// -----------------------------------------------------------------------------
//
//    ���������� v2.0
//    �������������� ������� ���������
//
//                                            by ���������� ����� aka .:SILENT:.
// -----------------------------------------------------------------------------

unit Addition;

interface

uses ADODB, DB, StdCtrls, Registry, Windows, Graphics, SysUtils, StrUtils, InfoMessage,
     Forms, QuestionMessage, ElXPThemedControl, ElTree, ElTreeStdEditors, VolDBGrid,
     ComCtrls;

  procedure ConnectSQL(QueryName: TADOQuery; SQLString: string);
  procedure DeleteSQL(QueryName: TADOQuery; SQLString: string);
  procedure FieldEdit(SourceName: TDataSource;FieldName: string;Value: Variant);
  procedure FindListValue(Value: string; List: TObject);
  function sumtostring(value: string; MoneyValue: string): string;
  function MonthName(MonthNum: integer): string;
  function MonthColor(Month_num: integer): TColor;
  procedure ShowInfoMessage(Text: string; Caption: string; const MType: boolean=false);
  function ShowQuestionMessage(Text: string; Caption: string): boolean;
  procedure ColorApply(FormName: TForm);
  function GetRandomMessage: string;
  procedure GradientRect (FromRGB, ToRGB: TColor; Canvas: TCanvas);
  function GetLetterFromInt(i: integer): char;

implementation

uses MainWindow;

const a:array[0..8,0..9] of string=(
  ('','���� ','��� ','��� ','������ ','���� ','����� ','���� ','������ ','������ '),
  ('','','�������� ','�������� ','����� ','��������� ','���������� ','��������� ','����������� ','��������� '),
  ('','��� ','������ ','������ ','��������� ','������� ','�������� ','������� ','��������� ','��������� '),
  ('����� ','������ ','��� ������ ','��� ������ ','������ ������ ','���� ������ ','����� ������ ','���� ������ ','������ ������ ','������ ������ '),
  ('','','�������� ','�������� ','����� ','��������� ','���������� ','��������� ','����������� ','��������� '),
  ('','��� ','������ ','������ ','��������� ','������� ','�������� ','������� ','��������� ','��������� '),
  ('��������� ','���� ������� ','��� �������� ','��� �������� ','������ �������� ','���� ��������� ','����� ��������� ','���� ��������� ','������ ��������� ','������ ��������� '),
  ('','','�������� ','�������� ','����� ','��������� ','���������� ','��������� ','����������� ','��������� '),
  ('','��� ','������ ','������ ','��������� ','������� ','�������� ','������� ','��������� ','��������� '));
      b:array[0..9] of string=
  ('������ ','���������� ','���������� ','���������� ','������������ ','����������� ','������������ ','����������� ','������������� ','������������� ');

procedure ColorApply(FormName: TForm);
var i: integer;
    t: TObject;
begin
  for i:=FormName.ComponentCount-1 downto 0 do
    begin
      T:=FormName.Components[i];
      if (T is TEdit) then (T as TEdit).Color := MainForm.Config.ReadInteger('Colors','EditBox',clWhite);
      if (T is TComboBox) then (T as TComboBox).Color := MainForm.Config.ReadInteger('Colors','EditBox',clWhite);
      if (T is TElTree) then (T as TElTree).BkColor := MainForm.Config.ReadInteger('Colors','Background',clWhite);
      if (T is TElTree) then (T as TElTree).StripedOddColor := MainForm.Config.ReadInteger('Colors','Background',clWhite);
      if (T is TElTree) then (T as TElTree).StripedEvenColor := MainForm.Config.ReadInteger('Colors','Background',clWhite);
      if (T is TVolgaDBGrid) then (T as TVolgaDBGrid).Color := MainForm.Config.ReadInteger('Colors','Background',clWhite);
      if (T is TVolgaDBGrid) then (T as TVolgaDBGrid).HighlightColor := MainForm.Config.ReadInteger('Colors','SelectedBack',clWhite);
      if (T is TVolgaDBGrid) then (T as TVolgaDBGrid).HighlightTextColor := MainForm.Config.ReadInteger('Colors','SelectedFont',clWhite);
      if (T is TDateTimePicker) then (T as TDateTimePicker).Color := MainForm.Config.ReadInteger('Colors','EditBox',clWhite);
      if (T is TMemo) then (T as TMemo).Color := MainForm.Config.ReadInteger('Colors','EditBox',clWhite);
    end;
end;

function SumToStrin(Value: String): string;
var    s,t:string;
  p,pp,i,k:integer;
begin
  s:=value;
  if s='0' then t:='���� ' else
    begin
      p:=length(s);
      pp:=p;
      if p>1 then
        if (s[p-1]='1') and (s[p]>'0') then
          begin
            t:=b[strtoint(s[p])];
            pp:=pp-2;
          end;
      i:=pp;
      while i>0 do
        begin
          if (i=p-3) and (p>4) then
            if s[p-4]='1' then
              begin
                t:=b[strtoint(s[p-3])]+'����� '+t;
                i:=i-2;
              end;
          if (i=p-6) and (p>7) then
            if s[p-7]='1' then
              begin
                t:=b[strtoint(s[p-6])]+'��������� '+t;
                i:=i-2;
              end;
          if i>0 then
            begin
              k:=strtoint(s[i]);
              t:=a[p-i,k]+t;
              i:=i-1;
            end;
        end;
    end;
  Result:=t;
end;

procedure get2str(value: string; var hi,lo: string);
var p: integer;
begin
  p:=pos(',',value);
  lo:='';hi:='';
  if p=0 then p:=pos('.',value);
  if p<>0 then delete(value,p,1);
  if p=0 then
    begin
      hi:=value;
      lo:='00';
    end;
  if p>length(value) then
    begin
      hi:=value;
      lo:='00';
    end;
  if p=1 then
    begin
      hi:='0';
      lo:=value;
    end;
  if (p>1) and (p<Length(value)) then
    begin
      hi:=copy(value,1,p-1);
      lo:=copy(value,p,length(value));
    end;
end;

function sumtostring(value: string; MoneyValue: string): string;
var hi,lo:string;
    pr,er:integer;
begin
  get2str(value,hi,lo);
  if (hi='') or (lo='') then
    begin
      result:='';
      exit;
    end;
  val(hi,pr,er);
  if er<>0 then
    begin
      result:='';
      exit;
    end;
  hi:=sumtostrin(inttostr(pr))+MoneyValue;
  if lo<>'00' then
    begin
      val(lo,pr,er);
      if er<>0 then
        begin
          result:='';
          exit;
        end;
      lo:=inttostr(pr);
    end;
  lo:=lo+' ���. ';
  hi[1]:=AnsiUpperCase(hi[1])[1];
  Result:=hi+lo;
end;

function MonthColor(Month_num: integer): TColor;
begin                              // ����������� ����� ������ �� ��� ������
  case Month_num of
    1:  Result:=$00563018;
    2:  Result:=$0082717A;
    3:  Result:=$00E2C8B8;
    4:  Result:=$00B8E4B6;
    5:  Result:=$004BBA45;
    6:  Result:=$0087A8DA;
    7:  Result:=$00243AA6;
    8:  Result:=$001A305E;
    9:  Result:=$00B3EAF0;
    10: Result:=$00A6D9D9;
    11: Result:=$00263C4A;
    12: Result:=$00733F20;
  else Result:=0;
  end;
end;

function MonthName(MonthNum: integer): string;
begin
  case MonthNum of
     1: Result:='������';
     2: Result:='�������';
     3: Result:='����';
     4: Result:='������';
     5: Result:='���';
     6: Result:='����';
     7: Result:='����';
     8: Result:='������';
     9: Result:='��������';
    10: Result:='�������';
    11: Result:='������';
    12: Result:='�������';
  else
    Result:='error';
  end;
end;

procedure ConnectSQL(QueryName: TADOQuery; SQLString: string);
begin
  QueryName.Active:=False;
  QueryName.SQL.Clear;
  QueryName.SQL.Text:=SQLString;
  QueryName.Active:=True;
end;

procedure DeleteSQL(QueryName: TADOQuery; SQLString: string);
begin
  QueryName.Active:=False;
  QueryName.SQL.Clear;
  QueryName.SQL.Add(SQLString);
  QueryName.ExecSQL;
  QueryName.Active:=False;
end;

procedure FieldEdit(SourceName: TDataSource; FieldName: string; Value: Variant);
begin
  SourceName.DataSet.Edit;
  SourceName.DataSet.FieldValues[FieldName]:=Value;
  SourceName.DataSet.Post;
end;

procedure FindListValue(Value: string; List: TObject);
var i: integer;
begin
  for i:=0 to (List as TComboBox).Items.Count-1 do
    if (List as TComboBox).Items.Strings[i]=Value then
      begin
        (List as TComboBox).ItemIndex:=i;
        Exit;
      end;
end;

procedure ShowInfoMessage(Text: string; Caption: string; const MType: boolean=false);
begin
  try
    Application.CreateForm(TForm33, Form33);
    Form33.Caption:=Caption;
    Form33.Label1.Caption:=Text;
    if MType then Form33.MessageType:=1
             else Form33.MessageType:=0;
    Form33.ShowModal;
  finally
    Form33.Hide;
    Form33.Free;
  end;
end;

function ShowQuestionMessage(Text: string; Caption: string): boolean;
begin
  try
    Application.CreateForm(TForm34, Form34);
    Form34.Caption:=Caption;
    Form34.Label1.Caption:=Text;
    Form34.ShowModal;
  finally
    Form34.Hide;
    Result:=Form34.FormResult;
    Form34.Free;
  end;
end;

function GetRandomMessage: string;
const HMsg=21;
var msg: array[1..HMsg] of string;
begin
  Randomize;

   Msg[1]:='  ������ ��������� �� ������ ��������� � ���������� ���������, �� ������ ���� �� - ������������������ ������������.';
   Msg[2]:='  �� ������ ������ ������������� �������� ��� ������. ��� ����� ����� ����� ���� �������� �� ������� ������ ����� �� ������� ��� ������� � ���� ��� -> ��������/������ ������ ���������� � ������� ������ �� ����������, ������� ��� �����.';
   Msg[3]:='  ����� � ������� ������� ��������� ������������ ������ �� ����������, ���� �������� ������� ��������� � ���� � ��� �� �����, �������� ����� � ��� �� ������� ����� �������� ����.';
   Msg[4]:='  ��� ����� ��������� ���������� ��������� �� ������ ������� � ����� ������� http://www.roachart.by.ru.';
   Msg[5]:='  �� ������ �������������� ������ ����-�������������� � ����� ��������� � ��������� ���� ��� � ���� .xls. ��� ����� ��� ���������� ������ �� ������ <�������> � ������ ��� �����.';
   Msg[6]:='  ������ ������� ����������� ��������� ������/�������������� ��������� �������� � �������� ���� ������ ���������. ��� ����� �������� ����� ���� ������ -> �����/������������ ���� ������.';
   Msg[7]:='  � ��������� ���� ����������� ������������ ����� ������� ��� ��������. ��� ����� ���������� ������� ����� �� ���������, � � ���� � ������ ��������� ���������� ��� ������� ���� ���� ���� � ������ �� ���������.';
   Msg[8]:='  ������� ��������� ��������� ����� ������������� � ������� MS Excel. ���� �� �� �� ������ (�� ������) �������� � Excel, ���� ����������� ������� ������ �� ���������� ���������� ������������� �� ������������ �����.';
   Msg[9]:='  � �������� ��������� ��������� �������� ������������ ������������ ��� ��������������� ���������� ������������ ������, ������ �������� ������� �� ������ ������� � ������� � ���������.';
  Msg[10]:='  � ��������� �������� ������ �� �������, ������� ������������� � ���������� ���������.';
  Msg[11]:='  � ������� ���������� � ��������� ���������� ������ �� ������� ������� ������ �� ���������, � �������� �� ����� ������ ����.';
  Msg[12]:='  ���������� � ��������� ����������� ������� ��� � ������� ������� ������.';
  Msg[13]:='  � ��������� ������������ ������ �������� ���������� ���������� �� ���������� ���������.';
  Msg[14]:='  � ��������� �������� �������������� �������������� ����� ������ ��� ������� ����������� � ���������� ���.';
  Msg[15]:='  ����� �������������� ��������� � ������� ������� �� ������ ������ ������� � ������� <�����> � ���������� ���������.';
  Msg[16]:='  ������ ������ � ��������� ����������� � ����� errors.log � ����� � ����������. ���� ���� �� �� ������� ������ ������� ������������� ��� ������������ ����� �������� �, ��������, �� ������������ �������.';
  Msg[17]:='  �� ������ �������� � ����� ������ ��������� � ���� �� ���������� �����������. ��� ����� ���� ���� ������ ����������� �� ������� ��� �� ������� �� ����������� � � ���������� ���������� ���� � ���� ������ �� ������.';
  Msg[18]:='  ����� ��������� ��������� �� ������������ � system tray ��� �������� ������������.';
  Msg[19]:='  ����������� ������� �������� ����� ��������� ����� Web-Money ��������, �� ���� � ����� ��� �� �����.';
  Msg[20]:='  ��������������� ������ ���������� ��������� ��������� ���������, ���� �� �� ������ ������� ��������� �� ������ ��� ����������� ���������. ����-����� ������ ��� �� ����������.';
  Msg[21]:='  ��� ��������� �������� ����������� ��������� ��� ������� ������������� ��������� �� ������ ��������� � �������� �� �������������.';

  Result:=Msg[Random(HMsg-1)+1];
end;

procedure GradientRect (FromRGB, ToRGB: TColor; Canvas: TCanvas);
var
  RGBFrom : array[0..2] of Byte; { from RGB values }
  RGBDiff : array[0..2] of integer; { difference of from/to RGB values }
  ColorBand : TRect; { color band rectangular coordinates }
  I : Integer; { color band index }
  R : Byte; { a color band's R value }
  G : Byte; { a color band's G value }
  B : Byte; { a color band's B value }
begin
  { extract from RGB values}
  RGBFrom[0] := GetRValue (ColorToRGB (FromRGB));
  RGBFrom[1] := GetGValue (ColorToRGB (FromRGB));
  RGBFrom[2] := GetBValue (ColorToRGB (FromRGB));
  { calculate difference of from and to RGB values}
  RGBDiff[0] := GetRValue (ColorToRGB (ToRGB)) - RGBFrom[0];
  RGBDiff[1] := GetGValue (ColorToRGB (ToRGB)) - RGBFrom[1];
  RGBDiff[2] := GetBValue (ColorToRGB (ToRGB)) - RGBFrom[2];

  { set pen sytle and mode}
  Canvas.Pen.Style := psSolid;
  Canvas.Pen.Mode := pmCopy;

  { set color band's left and right coordinates}
  ColorBand.Left := 0;
  ColorBand.Right:= canvas.ClipRect.Right-Canvas.ClipRect.Left;

  for I := 0 to $ff do
  begin
    { calculate color band's top and bottom coordinates}
    ColorBand.Top := MulDiv (I , canvas.ClipRect.Bottom-Canvas.ClipRect.Top, $100);
    ColorBand.Bottom := MulDiv (I + 1,canvas.ClipRect.Bottom-Canvas.ClipRect.Top, $100);
    { calculate color band color}
    R := RGBFrom[0] + MulDiv (I, RGBDiff[0], $ff);
    G := RGBFrom[1] + MulDiv (I, RGBDiff[1], $ff);
    B := RGBFrom[2] + MulDiv (I, RGBDiff[2], $ff);
    { select brush and paint color band}
    Canvas.Brush.Color := RGB (R, G, B);
    Canvas.FillRect (ColorBand);
  end;
end;

function GetLetterFromInt(i: integer): char;
begin
  case i of
     1: Result:='A';
     2: Result:='B';
     3: Result:='C';
     4: Result:='D';
     5: Result:='E';
     6: Result:='F';
     7: Result:='G';
     8: Result:='H';
     9: Result:='I';
    10: Result:='J';
    11: Result:='K';
    12: Result:='L';
    13: Result:='M';
    14: Result:='N';
    15: Result:='O';
    16: Result:='P';
    17: Result:='Q';
    18: Result:='R';
    19: Result:='S';
    20: Result:='T';
  else Result:='A'
  end;
end;

end.
