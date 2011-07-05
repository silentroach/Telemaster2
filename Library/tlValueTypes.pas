unit tlValueTypes;

interface

type
  TValuesType = (vtId,                                  // идентификатор заказа
                 vtGetDate,                             // дата принятия
                 vtMasterName,                          // краткое ФИО мастера
                 vtFullMasterName,                      // полное ФИО мастера
                 vtMasterPhone,                         // домашний телефон мастера
                 vtMemo,
                 vtHType,                               // тип устройства
                 vtHTypeId,                             // тип устройства (номер)
                 vtHFirm,                               // фирма-производитель устройства
                 vtHModel,                              // модель устройства
                 vtHNumber,                             // заводской номер устройства
                 vtHComplete,                           // тип + фирма + модель
                 vtHDiagnose,                           // предварительный диагноз
                 vtHComplection,                        // комплектация
                 vtHStatus,                             // статус железяки
                 vtHCategory,                           // категория аппарата
                 vtCName,                               // ФИО клиента
                 vtCAddress,                            // адрес клиента
                 vtCPhoneH,                             // домашний телефон клиента
                 vtCPhoneW,                             // рабочий телефон клиента
                 vtCStatus,                             // статус клиента
  // ------------------------ информация об выдаче
                 vtDocNum,                              // номер квитанции
                 vtRepairPrice,                         // цена за ремонт
                 vtRepairDiagnose,                      // неисправность
                 vtRepairDate,                          // дата ремонта
                 vtFullPrice,                           // полная цена (за ремонт+детали)
                 vtSendDate,                            // дата выдачи
                 vtGuarantyOn,                          // количество месяцев на гарантию
                 vtGuarantyUntil,                       // дата окончания гарантии
                 vtDetailSumPrice,                      // сумма, затраченная на детали
                 vtDetailCount,                         // количество деталей
  // ------------------------ информация об организации
                 vtOrgName,                             // название организации
                 vtOrgAddress,                          // адрес организации
                 vtOrgPhone,                            // телефон организации
                 vtOrgFax,                              // факс организации
                 vtOrgMail,                             // эл.почта организации
                 vtOrgDirector,                         // директор организации
                 vtOrgBuh,                              // главный бухгалтер организации
  // ------------------------ дополнительная информация
                 vtMinYear,                             // минимальный год
                 vtMaxYear                              // максимальный год
                 );

implementation

end.
