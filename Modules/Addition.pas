// -----------------------------------------------------------------------------
//
//    Телемастер v2.0
//    Дополнительные функции программы
//
//                                            by Калашников Игорь aka .:SILENT:.
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
  ('','один ','два ','три ','четыре ','пять ','шесть ','семь ','восемь ','девять '),
  ('','','двадцать ','тридцать ','сорок ','пятьдесят ','шестьдесят ','семьдесят ','восемьдесят ','девяносто '),
  ('','сто ','двести ','триста ','четыреста ','пятьсот ','шестьсот ','семьсот ','восемьсот ','девятьсот '),
  ('тысяч ','тысяча ','две тысячи ','три тысячи ','четыре тысячи ','пять тысячь ','шесть тысячь ','семь тысячь ','восемь тысячь ','девять тысячь '),
  ('','','двадцать ','тридцать ','сорок ','пятьдесят ','шестьдесят ','семьдесят ','восемьдесят ','девяносто '),
  ('','сто ','двести ','триста ','четыреста ','пятьсот ','шестьсот ','семьсот ','восемьсот ','девятьсот '),
  ('миллионов ','один миллион ','два миллиона ','три миллиона ','четыре миллиона ','пять миллионов ','шесть миллионов ','семь миллионов ','восемь миллионов ','девять миллионов '),
  ('','','двадцать ','тридцать ','сорок ','пятьдесят ','шестьдесят ','семьдесят ','восемьдесят ','девяносто '),
  ('','сто ','двести ','триста ','четыреста ','пятьсот ','шестьсот ','семьсот ','восемьсот ','девятьсот '));
      b:array[0..9] of string=
  ('десять ','одинадцать ','двенадцать ','тринадцать ','четырнадцать ','пятьнадцать ','шестьнадцать ','семьнадцать ','восемьнадцать ','девятьнадцать ');

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
  if s='0' then t:='Ноль ' else
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
                t:=b[strtoint(s[p-3])]+'тысяч '+t;
                i:=i-2;
              end;
          if (i=p-6) and (p>7) then
            if s[p-7]='1' then
              begin
                t:=b[strtoint(s[p-6])]+'миллионов '+t;
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
  lo:=lo+' коп. ';
  hi[1]:=AnsiUpperCase(hi[1])[1];
  Result:=hi+lo;
end;

function MonthColor(Month_num: integer): TColor;
begin                              // определение цвета месяца по его номеру
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
     1: Result:='январь';
     2: Result:='февраль';
     3: Result:='март';
     4: Result:='апрель';
     5: Result:='май';
     6: Result:='июнь';
     7: Result:='июль';
     8: Result:='август';
     9: Result:='сентябрь';
    10: Result:='октябрь';
    11: Result:='ноябрь';
    12: Result:='декабрь';
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

   Msg[1]:='  Данное сообщение Вы можете отключить в настройках программы, но только если Вы - зарегистрированный пользователь.';
   Msg[2]:='  Вы всегда можете отфильтровать ненужные Вам данные. Для этого нужно всего лишь щелкнуть на плоской кнопке слева от таблицы или выбрать в меню Вид -> Показать/скрыть панель фильтрации и выбрать только те устройства, которые Вам нужны.';
   Msg[3]:='  Чтобы в главной таблице программы отображались только те устройства, дата принятия которых произошла в один и тот же месяц, выбирете месяц и год на кнопках внизу главного окна.';
   Msg[4]:='  Все самые последние обновления программы Вы можете скачать с сайта команды http://www.roachart.by.ru.';
   Msg[5]:='  Вы можете экспортировать списки фирм-производителей и типов устройств в текстовый файл или в файл .xls. Для этого Вам необходимо нажать на кнопку <экспорт> в нужных Вам окнах.';
   Msg[6]:='  Иногда следует производить процедуру сжатия/восстановления первичных индексов в таблицах базы данных программы. Для этого выберите пункт меню Сервис -> Сжать/восстановить базу данных.';
   Msg[7]:='  В программе есть возможность использовать такую функцию как автоцена. Для этого необходимо разбить фирмы на категории, а в окне с типами устройств проставить для каждого типа свою цену в каждой из категорий.';
   Msg[8]:='  Шаблоны квитанций программы можно редактировать с помощью MS Excel. Если же Вы не можете (не умеете) работать с Excel, есть возможность послать запрос на оформление документов разработчикам за определенную плату.';
   Msg[9]:='  В шаблонах квитанций программы возможно использовать микрокоманды для автоматического заполнения динамических данных, полное описание которых Вы всегда найдете в справке к программе.';
  Msg[10]:='  В программе возможен дозвон до клиента, который настраивается в настройках программы.';
  Msg[11]:='  С помощью встроенной в программу телефонной книжки Вы сможете хранить данные об абонентах, с которыми Вы часто имеете дело.';
  Msg[12]:='  Встроенный в программу калькулятор поможет Вам в расчете сложных формул.';
  Msg[13]:='  В программе предусмотрен расчет зарплаты работников мастерской по нескольким признакам.';
  Msg[14]:='  В программе возможно автоматическое резервирование Ваших данных для большей уверенности в завтрашнем дне.';
  Msg[15]:='  Цвета отображающихся устройств в главной таблице Вы всегда можете сменить в разделе <цвета> в настройках программы.';
  Msg[16]:='  Каждая ошибка в программе фиксируется в файле errors.log в папке с программой. Этот файл Вы по желанию можете послать разработчикам для рассмотрения Вашей проблемы и, возможно, ее последующего решения.';
  Msg[17]:='  Вы можете работать с базой данных программы в сети на нескольких компьютерах. Для этого файл базы данных располагают на сервере или на главном из компьютеров и в настройках исправляют путь к базе данных на нужную.';
  Msg[18]:='  Можно настроить программу на сворачивание в system tray для удобства пользователя.';
  Msg[19]:='  Регистрацию данного продукта можно проводить через Web-Money кошельки, на счет в банке или по почте.';
  Msg[20]:='  Регистрационный запрос необходимо полностью тщательно заполнять, если Вы не хотите увидеть сообщение об ошибке при регистрации программы. Ключ-ответ второй раз не высылается.';
  Msg[21]:='  Для ускорения процесса регистрации программы Вам следует отсканировать квитанцию об оплате программы и отослать ее разработчикам.';

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
