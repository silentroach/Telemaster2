unit RThemedPanel;

interface

uses
  SysUtils, Classes, Controls, ExtCtrls, Windows, Messages, UxTheme;

type
  TRThemedPanel = class(TPanel)
  private
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
  end;

procedure Register;

implementation

const
  themelib = 'uxtheme.dll';

var
  hThemeLib: HINST;
  hTheme: THandle;
  ThemesEnabled : boolean;

procedure Register;
begin
  RegisterComponents('ROACHART Group', [TRThemedPanel]);
end;

{ TRThemedPanel }

constructor TRThemedPanel.Create(AOwner: TComponent);
begin
  inherited;
  if not ThemesEnabled then
  begin
    Caption := '';
    BevelEdges := [beBottom];
    BevelKind := bkSoft;
    BevelOuter := bvNone;
  end;
end;

procedure TRThemedPanel.Paint;
var
  r: TRect;
begin
  if ThemesEnabled then
  begin
    HTheme := OpenThemeData(Parent.Handle, 'tab');
    try
      r := Rect(0, 0, Width + 1, Height + 1);
      DrawThemeBackground(HTheme, Canvas.Handle, TABP_PANE, 0, r, nil);
      r := Rect(0, 0, Width + 1, Height - 2);
      DrawThemeBackground(HTheme, Canvas.Handle, TABP_BODY, 0, r, nil);
    finally
      CloseThemeData(HTheme);
    end;
  end;
end;

initialization
  ThemesEnabled := false;
  if (Win32Platform  = VER_PLATFORM_WIN32_NT) and
     (((Win32MajorVersion = 5) and (Win32MinorVersion >= 1)) or
      (Win32MajorVersion > 5)) then
  begin
    hThemeLib := LoadLibrary(themelib);
    if hThemeLib <> 0 then
      try
        IsThemeActive := GetProcAddress(hThemeLib, 'IsThemeActive');
         ThemesEnabled := true;
      except
        ThemesEnabled := false;
      end;
  end;
  
finalization
  ThemesEnabled := false;

end.
