unit ConsoleLua;

interface

uses
  VerySimple.Lua, VerySimple.Lua.Lib, Windows, System.Generics.Collections,
  System.Classes, SysUtils;

{$M+}

type
  TConsoleLua = class
  published
    function Print(L: lua_State): Integer; //
    function Initialize(L: lua_State): Integer; // 初始化

    function WriteLn(L: lua_State): Integer; //
    function ReadLn(L: lua_State): Integer; //
  end;

implementation

uses IOUtils, Types, GlobalDefine, CnConsole;

function TConsoleLua.Initialize(L: lua_State): Integer;
begin
  g_Console := TCnConsole.Create(nil);
  g_Console.Enabled := True;

  Result := 0;
end;

function TConsoleLua.Print(L: lua_State): Integer;
begin
  Result := 0;
end;

function TConsoleLua.ReadLn(L: lua_State): Integer;
var
  s :string;
begin
  System.Readln(s);
  lua_pushstring(L, PAnsiChar(s));
  Result := 1;
end;

function TConsoleLua.WriteLn(L: lua_State): Integer;
var
  s: string;
begin
  s := lua_tostring(L, 1);
  System.WriteLn(s);
end;

end.
