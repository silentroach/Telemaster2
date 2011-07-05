{------------------------------------------------------------------------------}
{                                                                              }
{    Roach.Master                                                              }
{    Roach.Art Group (c) 2004-2005                                             }
{                                                                              }
{    Additional Functions for Database module                                  }
{    by Kalashnikov Igor aka .silent                                           }
{                                                                              }
{------------------------------------------------------------------------------}

unit amDatabase;

interface

uses DB, DBTables, Classes, Variants, ADODB, Forms, SysUtils, Windows,
// ---
  tlDatabase;

const
  qpSelectIdent = 'SELECT';
  qpWhereIdent  = 'WHERE';
  qpOrderIdent  = 'ORDER BY';

type
  TQueryPart = (qpSelect, qpWhere, qpOrder);

  // -- функции для работы с Query в реальном времени
  function Param(DataType: TDataType; Data: Variant): TParamRec;
  function DefineQuery(const SQL: array of const; Params: array of TParamRec): TADOQuery;
  function OpenQuery(const SQL: array of const; Params: array of TParamRec): TADOQuery;
  function ExecuteQuery(const SQL: array of const; Params: array of TParamRec): boolean; overload;
  function ExecuteQuery(const SQL: array of const; Params: array of TParamRec; var Identity: integer): boolean; overload;

  // -- другие функции
  procedure PrepareQuery(Query: TADOQuery);

implementation

resourcestring
  rsIdentity = 'SELECT @@IDENTITY';

function DefineQuery(const SQL: array of const; Params: array of TParamRec): TADOQuery;
var
  I: Integer;
begin
  Result := TADOQuery.Create(Application);
  Result.Active := false;
  Result.Connection := Database.MainConnection;
  Result.CursorLocation := clUseClient;
  Result.CursorType := ctUnspecified;
  try
    Result.SQL.BeginUpdate;
    try
      for I := 0 to High(SQL) do
        with SQL[I] do
          if VType = vtObject     then Result.SQL.AddStrings(VObject as TStrings) else
          if VType = vtString     then Result.SQL.Add(VString^) else
          if VType = vtAnsiString then Result.SQL.Add(AnsiString(VAnsiString));
    finally
      Result.SQL.EndUpdate;
    end;

    if Result.Parameters.Count > 0 then
      for I := 0 to High(Params) do
        if @Params[I] <> @NullParam then
          with Result.Parameters.Items[I] do
          begin
            DataType := Params[I].DataType;
            if Params[I].Data = null then Result.Parameters.Items[I].Value := null
                                     else Value := Params[I].Data;
          end;
  except on E: Exception do
    begin
      Result.Free;
    end;
  end;
end;

function GetIdentity: integer;
var
  TempQuery: TADOQuery;
begin
  TempQuery := OpenQuery([
      rsIdentity
    ], [nullparam]);
  try
    Result := TempQuery.Fields.Fields[0].AsInteger;
  finally
    TempQuery.Free;
  end;
end;

function OpenQuery(const SQL: array of const; Params: array of TParamRec): TADOQuery;
begin
  Result := DefineQuery(SQL, Params);
  try
    Result.Open;
  except on E: Exception do
    begin
      Result.Free;
    end;
  end;
end;

function ExecuteQuery(const SQL: array of const; Params: array of TParamRec): boolean;
var
  Query: TADOQuery;
begin
  Result := true;
  // ---
  Query := DefineQuery(SQL, Params);
  try
    try
      Query.ExecSQL;
    except on E: Exception do
      begin
        Application.MessageBox(PChar(E.Message), 'Ошибка', mb_IconExclamation + mb_OK);
        Result := false;
      end;
    end;
  finally
    Query.Free;
  end;
end;

function ExecuteQuery(const SQL: array of const; Params: array of TParamRec; var Identity: integer): boolean; overload;
begin
  Result := ExecuteQuery(SQL, Params);
  Identity := GetIdentity;
end;

function Param(DataType: TDataType; Data: Variant): TParamRec;
begin
  Result.DataType := DataType;
  Result.Data := Data;
end;

procedure PrepareQuery(Query: TADOQuery);
begin
  Query.Connection := Database.MainConnection;
  Query.ConnectionString := '';
  Query.Active := true;
end;

end.
