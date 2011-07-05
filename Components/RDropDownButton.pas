unit RDropDownButton;

interface

uses
  SysUtils, Classes, Controls, Menus, Messages, Themes, Types, ComCtrls, Windows;

type
  TRDropDownButton = class(TGraphicControl)
  private
    FDown: Boolean;
    FMenuItem: TMenuItem;
    FDropdownMenu: TPopupMenu;
    FEnableDropdown: Boolean;
    function IsCheckedStored: Boolean;
    function IsWidthStored: Boolean;
    procedure SetDown(const Value: Boolean);
    procedure SetDropdownMenu(const Value: TPopupMenu);
    procedure SetEnableDropdown(const Value: Boolean);
    procedure SetMenuItem(const Value: TMenuItem);
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Paint; override;
    procedure RefreshControl; virtual;
    procedure UpdateControl; virtual;
    procedure ValidateContainer(AComponent: TComponent); override;
  public
    constructor Create(AOwner: TComponent); override;
    function CheckMenuDropdown: Boolean; dynamic;
    procedure Click; override;
  published
    property Action;
    property Caption;
    property Down: Boolean read FDown write SetDown stored IsCheckedStored default False;
    property DragCursor;
    property DragKind;
    property DragMode;
    property DropdownMenu: TPopupMenu read FDropdownMenu write SetDropdownMenu;
    property Enabled;
    property EnableDropdown: Boolean read FEnableDropdown write SetEnableDropdown default False;
    property Height stored False;
    property MenuItem: TMenuItem read FMenuItem write SetMenuItem;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;
    property Width stored IsWidthStored;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('ROACHART Group', [TRDropDownButton]);
end;

const
  {$EXTERNALSYM TB_ENABLEBUTTON}
  TB_ENABLEBUTTON         = WM_USER + 1;
  {$EXTERNALSYM TB_CHECKBUTTON}
  TB_CHECKBUTTON          = WM_USER + 2;
  {$EXTERNALSYM TB_PRESSBUTTON}
  TB_PRESSBUTTON          = WM_USER + 3;

{ TRDropDownButton }

procedure TRDropDownButton.SetEnableDropdown(const Value: Boolean);
begin
  if FEnableDropdown <> Value then
    FEnableDropdown := Value;
end;

procedure TRDropDownButton.SetDropdownMenu(const Value: TPopupMenu);
begin
  if Value <> FDropdownMenu then
  begin
    FDropdownMenu := Value;
    if Value <> nil then Value.FreeNotification(Self);
  end;
end;

procedure TRDropDownButton.SetMenuItem(const Value: TMenuItem);
begin
  if Value <> nil then
  begin
    if FMenuItem <> Value then
      Value.FreeNotification(Self);
    Action := Value.Action;
    Caption := Value.Caption;
    Down := Value.Checked;
    Enabled := Value.Enabled;
    Hint := Value.Hint;
    Visible := Value.Visible;
  end;
  FMenuItem := Value;
end;

procedure TRDropDownButton.SetDown(const Value: Boolean);
const
  DownMessage: array[Boolean] of Integer = (TB_PRESSBUTTON, TB_CHECKBUTTON);
begin
  if Value <> FDown then
    FDown := Value;
end;

function TRDropDownButton.IsCheckedStored: Boolean;
begin
  Result := (ActionLink = nil);
end;

procedure TRDropDownButton.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  if MouseCapture then
    Down := (X >= 0) and (X < ClientWidth) and (Y >= 0) and (Y <= ClientHeight);
end;

constructor TRDropDownButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if ThemeServices.ThemesAvailable then
    ControlStyle := [csSetCaption, csClickEvents]
  else
    ControlStyle := [csCaptureMouse, csSetCaption, csClickEvents];
  Width := 75;
  Height := 25;
end;

function TRDropDownButton.CheckMenuDropdown: Boolean;
begin
  Result := not (csDesigning in ComponentState) and ((DropdownMenu <> nil) and
    DropdownMenu.AutoPopup or (MenuItem <> nil));
end;

procedure TRDropDownButton.UpdateControl;
begin

end;

procedure TRDropDownButton.Paint;
const
  XorColor = $00FFD8CE;
  DropDownWidth = 14;
var
  R: TRect;
  Details: TThemedElementDetails;
begin
  if (GetComCtlVersion = ComCtlVersionIE5) then
    with Canvas do
    begin
      if not Down then
      begin
        R := Rect(Width - DropDownWidth, 1, Width, Height);
        DrawEdge(Handle, R, BDR_RAISEDOUTER, BF_TOP or BF_RIGHT or BF_BOTTOM);
        R.Top := 0;
        DrawEdge(Handle, R, EDGE_ETCHED, BF_LEFT);
      end
      else begin
        R := Rect(Width - DropDownWidth + 1, -1, Width, Height);
        DrawEdge(Handle, R, BDR_SUNKEN, BF_TOP or BF_RIGHT or BF_BOTTOM);
        DrawEdge(Handle, R, EDGE_ETCHED, BF_LEFT);
      end;
    end;

  if csDesigning in ComponentState then
    { Draw separator outline }
    if not Down then
    begin
      R := Rect(0, 0, Width, Height);
      if ThemeServices.ThemesEnabled then
      begin
        Details := ThemeServices.GetElementDetails(ttbButtonHot);
        ThemeServices.DrawEdge(Canvas.Handle, Details, R, BDR_RAISEDINNER, BF_RECT);
      end
      else
        DrawEdge(Canvas.Handle, R, BDR_RAISEDINNER, BF_RECT);
    end;
end;

procedure TRDropDownButton.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  if (Button = mbLeft) and (X >= 0) and (X < ClientWidth) and (Y >= 0) and
    (Y <= ClientHeight) then
  Down := False;
end;

procedure TRDropDownButton.ValidateContainer(AComponent: TComponent);
begin
  inherited;

end;

procedure TRDropDownButton.Click;
begin
  inherited Click;
end;

procedure TRDropDownButton.RefreshControl;
begin

end;

procedure TRDropDownButton.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if (Button = mbLeft) then
    if Enabled or EnableDropdown then
      Down := not Down;
  inherited MouseDown(Button, Shift, X, Y);
end;

function TRDropDownButton.IsWidthStored: Boolean;
begin
  Result := false;
end;

end.
