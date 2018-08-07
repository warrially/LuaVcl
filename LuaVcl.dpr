program LuaVcl;

// {$APPTYPE CONSOLE}
uses
  SysUtils,
  Classes,
  Vcl.Forms,
  VerySimple.Lua in 'VerySimple.Lua.pas',
  VerySimple.Lua.Lib in 'VerySimple.Lua.Lib.pas',
  WaryLua in 'WaryLua.pas',
  ApplicationLua in 'ApplicationLua.pas',
  FormLua in 'FormLua.pas',
  GlobalDefine in 'GlobalDefine.pas',
  SampleForm in 'SampleForm.pas' {WaryForm} ,
  ConsoleLua in 'ConsoleLua.pas';

{$R *.res}

begin
  g_Lua := TWaryLua.Create;
  g_Lua.LibraryPath := LUA_LIBRARY;
  g_Lua.DoFile('lib/Wary.lua');
end.
