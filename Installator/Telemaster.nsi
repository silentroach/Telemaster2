;��� ������� .silent

;--------------------------------
;�������� ����������� ������

  !include "MUI.nsh"
  !include "Sections.nsh"

;--------------------------------
;������������

  ;�������
  SetCompressor lzma
  SetDatablockOptimize on
  Name "���������� 2.06"
  OutFile "Install.exe"
  AllowRootDirInstall false 
  AutoCloseWindow false
  CRCCheck off
  SetFont Tahoma 8
  WindowIcon off
  XPStyle on
  SetOverwrite on

  ;����� ��� ����������� �� ���������
  InstallDir "$PROGRAMFILES\Telemaster2"
  
  ;���������� � ������ ���� ��� ���������
  InstallDirRegKey HKCU "Software\Telemaster2" ""

;--------------------------------
;��������� ����������

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
;��������, ������������ � ������������

  !insertmacro MUI_PAGE_LICENSE "License.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  
  Var MUI_TEMP
  Var STARTMENU_FOLDER

  !define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU" 
  !define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\Telemaster2" 
  !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "������"
  !insertmacro MUI_PAGE_STARTMENU Application $STARTMENU_FOLDER

  !insertmacro MUI_PAGE_INSTFILES
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  
;--------------------------------
;�����
 
  !insertmacro MUI_LANGUAGE "Russian"

;--------------------------------
;������ ������������

Section !��������� Program
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
    ;�������� �������
    CreateDirectory "$SMPROGRAMS\$STARTMENU_FOLDER"
    CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\���������� 2.05.lnk" "$INSTDIR\Telemaster2.exe"
    CreateShortCut "$SMPROGRAMS\$STARTMENU_FOLDER\�������.lnk" "$INSTDIR\Uninstall.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
  
  ;��������� ���� � ��������� � �������
  WriteRegStr HKCU "Software\����������2" "" $INSTDIR
  
  ;������� uninstall'����
  WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

Section !���� Base
  SetOutPath "$INSTDIR"
  IfFileExists "$INSTDIR\Telemaster2.dat" 0 +2
  Rename "$INSTDIR\Telemaster2.dat" "$INSTDIR\Telemaster2.bak"

  File "d:\MyProgramms\TeleMaster2\Telemaster2.dat";
SectionEnd

Section "������� ���������" Documents
  SetOutPath "$INSTDIR\Documents"
  File "d:\MyProgramms\TeleMaster2\Documents\Attention.xlt"
  File "d:\MyProgramms\TeleMaster2\Documents\Getting.xlt"
  File "d:\MyProgramms\TeleMaster2\Documents\Sending.xlt"
  File "d:\MyProgramms\TeleMaster2\Documents\Success.xlt"
SectionEnd

Section /o "���� � ���� ������" Patch
  SetOutPath "$INSTDIR"
  File "d:\MyProgramms\TeleMaster2\Patches\PatchBaseTo2-05\Patch.exe"
SectionEnd

;--------------------------------
;Descriptions

  LangString DESC_Program ${LANG_RUSSIAN} "����������� ����� ��� ������� ���������."
  LangString DESC_Documents ${LANG_RUSSIAN} "������� ����������, ����������� ���������. �� ��������������, ���� �� ������, ����� ���������� ��������� �����������."
  LangString DESC_Base ${LANG_RUSSIAN} "���� ���� ������. �� ��������������, ���� �� ��� ������������ ����������."
  LangString DESC_Patch ${LANG_RUSSIAN} "��������������� ���� ������ �� ������ 2.0 � ������ 2.06. ������� ������ ��� ������� ��������� ������ �� ���������� ������."

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
  
  MessageBox MB_YESNO|MB_ICONQUESTION "������ �� �� ������������� ������� ���� ������ ���������?" 0 +1
  Delete "$INSTDIR\Telemaster2.dat"
  Delete "$INSTDIR\Telemaster2.ini"
  Delete "$INSTDIR\Telemaster2.chm"
  Delete "$INSTDIR\flash7AX.exe"

  MessageBox MB_YESNO|MB_ICONQUESTION "������ �� �� ������� ���� ������� �������?" 0 +3
  Delete "$INSTDIR\Documents\Attention.xlt"
  Delete "$INSTDIR\Documents\Getting.xlt"
  Delete "$INSTDIR\Documents\Sending.xlt"
  Delete "$INSTDIR\Documents\Success.xlt"

  !insertmacro MUI_STARTMENU_GETFOLDER Application $MUI_TEMP
  Delete "$SMPROGRAMS\$MUI_TEMP\���������� 2.05.lnk"
  Delete "$SMPROGRAMS\$MUI_TEMP\�������.lnk"
  
  ;������� �������� ������ ���� ����
  StrCpy $MUI_TEMP "$SMPROGRAMS\$MUI_TEMP"
 
  startMenuDeleteLoop:
    RMDir $MUI_TEMP
    GetFullPathName $MUI_TEMP "$MUI_TEMP\.."
    
    IfErrors startMenuDeleteLoopDone
  
    StrCmp $MUI_TEMP $SMPROGRAMS startMenuDeleteLoopDone startMenuDeleteLoop
  startMenuDeleteLoopDone:

  RMDir "$SMPROGRAMS\���������� 2"
  RMDir "$INSTDIR\Documents"
  RMDir "$INSTDIR\BackUp"
  RMDir "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\Telemaster2"

SectionEnd