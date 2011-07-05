unit tlConfig;

interface

uses VolDBGrid;

type
  TConfig = record
    SortColumn: integer;                                // ���������� �� �������
    SortType: TVolgaSortMark;                           // ��� ����������
    VisionStatus: 1..5;                                 // ���������� �� �������
    FilterMonth: 0..12;                                 // ���������� �� ������
    FilterYear: integer;                                // ���������� �� ����
    OtherFilter: string;                                // ���������� �� ��������� ������
    LongColor: boolean;                                 // �������� ������ ������������ �������
    UserType: 1..3;                                     // ��� ������������
  end;

implementation

end.
