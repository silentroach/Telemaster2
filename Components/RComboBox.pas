unit RComboBox;

interface

uses
  SysUtils, Classes, Controls, StdCtrls;

type
  TRComboBox = class(TComboBox)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('ROACHART Group', [TRComboBox]);
end;

end.
