unit tlValueTypes;

interface

type
  TValuesType = (vtId,                                  // ������������� ������
                 vtGetDate,                             // ���� ��������
                 vtMasterName,                          // ������� ��� �������
                 vtFullMasterName,                      // ������ ��� �������
                 vtMasterPhone,                         // �������� ������� �������
                 vtMemo,
                 vtHType,                               // ��� ����������
                 vtHTypeId,                             // ��� ���������� (�����)
                 vtHFirm,                               // �����-������������� ����������
                 vtHModel,                              // ������ ����������
                 vtHNumber,                             // ��������� ����� ����������
                 vtHComplete,                           // ��� + ����� + ������
                 vtHDiagnose,                           // ��������������� �������
                 vtHComplection,                        // ������������
                 vtHStatus,                             // ������ ��������
                 vtHCategory,                           // ��������� ��������
                 vtCName,                               // ��� �������
                 vtCAddress,                            // ����� �������
                 vtCPhoneH,                             // �������� ������� �������
                 vtCPhoneW,                             // ������� ������� �������
                 vtCStatus,                             // ������ �������
  // ------------------------ ���������� �� ������
                 vtDocNum,                              // ����� ���������
                 vtRepairPrice,                         // ���� �� ������
                 vtRepairDiagnose,                      // �������������
                 vtRepairDate,                          // ���� �������
                 vtFullPrice,                           // ������ ���� (�� ������+������)
                 vtSendDate,                            // ���� ������
                 vtGuarantyOn,                          // ���������� ������� �� ��������
                 vtGuarantyUntil,                       // ���� ��������� ��������
                 vtDetailSumPrice,                      // �����, ����������� �� ������
                 vtDetailCount,                         // ���������� �������
  // ------------------------ ���������� �� �����������
                 vtOrgName,                             // �������� �����������
                 vtOrgAddress,                          // ����� �����������
                 vtOrgPhone,                            // ������� �����������
                 vtOrgFax,                              // ���� �����������
                 vtOrgMail,                             // ��.����� �����������
                 vtOrgDirector,                         // �������� �����������
                 vtOrgBuh,                              // ������� ��������� �����������
  // ------------------------ �������������� ����������
                 vtMinYear,                             // ����������� ���
                 vtMaxYear                              // ������������ ���
                 );

implementation

end.
