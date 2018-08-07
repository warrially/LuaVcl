program LuaVcl;

uses
  SysUtils,
  Classes,
  VerySimple.Lua in 'VerySimple.Lua.pas',
  VerySimple.Lua.Lib in 'VerySimple.Lua.Lib.pas',
  WaryLua in 'WaryLua.pas',
  ApplicationLua in 'ApplicationLua.pas',
  FormLua in 'FormLua.pas',
  Vcl.Forms,
  Lua in 'Lua.pas';

{$R *.res}


begin
    g_Lua             := TWaryLua.Create;
    g_Lua.LibraryPath := LUA_LIBRARY;
    g_Lua.DoFile('lib/Wary.lua');
end.
