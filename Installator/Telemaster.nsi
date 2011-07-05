;Код написал .silent

;--------------------------------
;Включаем необходимые модули

  !include "MUI.nsh"
  !include "Sections.nsh"

;--------------------------------
;Конфигурация

  ;Главная
  SetCompressor lzma
  SetDatablockOptimize on
  Name "Телемастер 2.06"
  OutFile "Install.exe"
  AllowRootDirInstall false 
  AutoCloseWindow false
  CRCCheck off
  SetFont Tahoma 8
  WindowIcon off
  XPStyle on
  SetOverwrite on

  ;Папка для инсталляции по умолчанию
  InstallDir "$PROGRAMFILES\Telemaster2"
  
  ;Запихиваем в реестр путь для установки
  InstallDirRegKey HKCU "Software\Telemaster2" ""

;--------------------------------
;Настройки интерфейса

  !define MUI_HEADERIMAGE_BITMAP_NOSTRETCH
  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_BITMAP "Header.bmp"
  !define MUI_HEADERIMAGE_RIGHT
  !define MUI_ABORTWARNING
  !define MUI_ICON "Install.ico"
  !define MUI_UNICON "UnInstall.ico"

;------------------- alpha-blending splash ---------
Function .onInit
  SetOutPath $TEMP
  File /oname=spl.bmp "Splash.bmp"

  advsplash::show 1500 2500 250 -1 $TEMP\spl

  Pop $0          

  Delete $TEMP\spl.bmp

FunctionEnd
;---------------------------------------------------

;--------------------------------
;Страницы, используемые в инсталляторе

  !insertmacro MUI_PAGE_LICENSE "License.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  
  Var MUI_TEMP
  Var STARTMENU_FOLDER

  !define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU" 
  !define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\Telemaster2" 
  !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Ярлыки"
  !insertmacro MUI_PAGE_STARTMENU Application $STARTMENU_FOLDER

  !insertmacro MUI_PAGE_INSTFILES
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  
;--------------------------------
;Языки
 
  !insertmacro MUI_LANGUAGE "Russian"

;--------------------------------
;Секции инсталлятора

Section !Программа Program
  SectionIn RO
  SetOutPath "$INSTDIR"
  CreateDirectory "$INSTDIR\BackUp"
  File "d:\MyProgramms\TeleMaster2\Telemaster2.exe"
  File "d:\MyProgramms\TeleMaster2\Telemaster2.ini"

  DeleteINISec "$INSTDIR\Telemaster2.ini" "Registration"
  WriteINIStr  "$INSTDIR\Telemaster2.ini" "Main"    "BasePath"   ""
  WriteINIStr  "$INSTDIR\Telemaster2.ini" "Main"    "ToolTips"   "1"
  WriteINIStr  "$INSTDIR\Telemaster2.ini" "BackUp"  "BackupDir"  "$INSTDIR\Backup"
  File "d:\MyProgramms\TeleMaster2\Telemaster2.chm"

  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    ;Создание ярлыков
    CreateDirectory "$SMPROGRAMS\$STARTMENU_FOLDER"
    CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\Телемастер 2.05.lnk" "$INSTDIR\Telemaster2.exe"
    CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\Удалить.lnk" "$INSTDIR\Uninstall.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
  
  ;Сохраняем путь к программе в реестре
  WriteRegStr HKCU "Software\Телемастер2" "" $INSTDIR
  
  ;Создаем uninstall'ятор
  WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

Section !База Base
  SetOutPath "$INSTDIR"
  IfFileExists "$INSTDIR\Telemaster2.dat" 0 +2
  Rename "$INSTDIR\Telemaster2.dat" "$INSTDIR\Telemaster2.bak"

  File "d:\MyProgramms\TeleMaster2\Telemaster2.dat";
SectionEnd

Section "Шаблоны квитанций" Documents
  SetOutPath "$INSTDIR\Documents"
  File "d:\MyProgramms\TeleMaster2\Documents\Attention.xlt"
  File "d:\MyProgramms\TeleMaster2\Documents\Getting.xlt"
  File "d:\MyProgramms\TeleMaster2\Documents\Sending.xlt"
  File "d:\MyProgramms\TeleMaster2\Documents\Success.xlt"
SectionEnd

Section /o "Патч к базе данных" Patch
  SetOutPath "$INSTDIR"
  File "d:\MyProgramms\TeleMaster2\Patches\PatchBaseTo2-05\Patch.exe"
SectionEnd

;--------------------------------
;Descriptions

  LangString DESC_Program ${LANG_RUSSIAN} "Необходимые файлы для запуска программы."
  LangString DESC_Documents ${LANG_RUSSIAN} "Шаблоны документов, необходимых программе. Не устанавливайте, если Вы хотите, чтобы предыдущие документы сохранились."
  LangString DESC_Base ${LANG_RUSSIAN} "Файл база данных. Не устанавливайте, если Вы уже пользовались программой."
  LangString DESC_Patch ${LANG_RUSSIAN} "Конвертирование базы данных из версии 2.0 в версию 2.06. Ставьте только при желании сохранить данные из предыдущей версии."

  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${Program} $(DESC_Program)
    !insertmacro MUI_DESCRIPTION_TEXT ${Documents} $(DESC_Documents)
    !insertmacro MUI_DESCRIPTION_TEXT ${Base} $(DESC_Base)
    !insertmacro MUI_DESCRIPTION_TEXT ${Patch} $(DESC_Patch)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END
 
;--------------------------------
;Uninstaller Section

Section "Uninstall"

  Delete "$INSTDIR\Uninstall.exe"
  Delete "$INSTDIR\Telemaster2.exe"
  
  MessageBox MB_YESNO|MB_ICONQUESTION "Хотите ли Вы действительно удалить базу данных программы?" 0 +1
  Delete "$INSTDIR\Telemaster2.dat"
  Delete "$INSTDIR\Telemaster2.ini"
  Delete "$INSTDIR\Telemaster2.chm"
  Delete "$INSTDIR\flash7AX.exe"

  MessageBox MB_YESNO|MB_ICONQUESTION "Хотите ли Вы удалить Ваши рабочие шаблоны?" 0 +3
  Delete "$INSTDIR\Documents\Attention.xlt"
  Delete "$INSTDIR\Documents\Getting.xlt"
  Delete "$INSTDIR\Documents\Sending.xlt"
  Delete "$INSTDIR\Documents\Success.xlt"

  !insertmacro MUI_STARTMENU_GETFOLDER Application $MUI_TEMP
  Delete "$SMPROGRAMS\$MUI_TEMP\Телемастер 2.05.lnk"
  Delete "$SMPROGRAMS\$MUI_TEMP\Удалить.lnk"
  
  ;Удаляем ненужные пункты меню Пуск
  StrCpy $MUI_TEMP "$SMPROGRAMS\$MUI_TEMP"
 
  startMenuDeleteLoop:
    RMDir $MUI_TEMP
    GetFullPathName $MUI_TEMP "$MUI_TEMP\.."
    
    IfErrors startMenuDeleteLoopDone
  
    StrCmp $MUI_TEMP $SMPROGRAMS startMenuDeleteLoopDone startMenuDeleteLoop
  startMenuDeleteLoopDone:

  RMDir "$SMPROGRAMS\Телемастер 2"
  RMDir "$INSTDIR\Documents"
  RMDir "$INSTDIR\BackUp"
  RMDir "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\Telemaster2"

SectionEnd