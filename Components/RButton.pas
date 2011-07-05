unit RButton;

interface

uses
  SysUtils, Classes, Controls, StdCtrls;

type
  TRButton = class(TButton)
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
  RegisterComponents('ROACHART Group', [TRButton]);
end;

end.
