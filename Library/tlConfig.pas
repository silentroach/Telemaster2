unit tlConfig;

interface

uses VolDBGrid;

type
  TConfig = record
    SortColumn: integer;                                // сортировка по столбцу
    SortType: TVolgaSortMark;                           // тип сортировки
    VisionStatus: 1..5;                                 // фильтраци€ по статусу
    FilterMonth: 0..12;                                 // фильтраци€ по мес€цу
    FilterYear: integer;                                // фильтраци€ по году
    OtherFilter: string;                                // фильтраци€ по значени€м панели
    LongColor: boolean;                                 // выдел€ть цветом залежавшийс€ аппарат
    UserType: 1..3;                                     // тип пользовател€
  end;

implementation

end.
