{------------------------------------------------------------------------------}
{                                                                              }
{    Roach.Master                                                              }
{    Roach.Art Group (c) 2004-2005                                             }
{                                                                              }
{    Database Type Library module                                              }
{    by Kalashnikov Igor aka .silent                                           }
{                                                                              }
{------------------------------------------------------------------------------}

unit tlDatabase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Forms, DB, DBTables,
  ADODB;

type
  TParamRec = record
    DataType: TDataType;
    Data: Variant;
  end;

  TDatabase = class
  private
    FFile: string;
    FConnected: boolean;
    
    procedure OnConnect(Connection: TADOConnection; const Error: Error; var EventStatus: TEventStatus);
    procedure OnDisconnect(Connection: TADOConnection; var EventStatus: TEventStatus);
  protected
  public
    MainConnection: TADOConnection;

    constructor Create(AOwner: TComponent; const FileName: string);
    destructor Destroy; override;
    procedure Connect;

    property Connected: boolean read FConnected;
end;

var
  Database: TDatabase;
  NullParam: TParamRec;

implementation

{ TDatabase }

procedure TDatabase.Connect;
begin
  try
    with MainConnection do
    begin
      Connected := false;
      ConnectionString :=
        'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + FFile + ';'+
        'Mode=ReadWrite;Extended Properties="";Jet OLEDB:System database="";'+
        'Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";';
      Provider := 'Microsoft.Jet.OLEDB.4.0';

      LoginPrompt := false;
      ConnectionTimeOut := 10;
      IsolationLevel := ilBrowse;
      ConnectOptions := coAsyncConnect;
      Mode := cmReadWrite;

      OnDisconnect := OnDisconnect;
      OnConnectComplete := OnConnect;
      Connected := true;
    end;
  except
    FConnected := false;
  end;
end;

constructor TDatabase.Create(AOwner: TComponent; const FileName: string);
begin
  inherited Create;
  FConnected := false;
  FFile := FileName;

  MainConnection := TADOConnection.Create(AOwner);
  Connect;
end;

destructor TDatabase.Destroy;
begin
  if MainConnection <> nil then
  begin
    MainConnection.Close;
    MainConnection.Free;
  end;
  inherited;
end;

procedure TDatabase.OnConnect(Connection: TADOConnection; const Error: Error; var EventStatus: TEventStatus);
begin
  FConnected := true;
end;

procedure TDatabase.OnDisconnect(Connection: TADOConnection; var EventStatus: TEventStatus);
begin
  FConnected := false;
end;

end.
