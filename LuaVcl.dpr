program LuaVcl;

uses
  SysUtils,
  Classes,
  VerySimple.Lua in 'VerySimple.Lua.pas',
  VerySimple.Lua.Lib in 'VerySimple.Lua.Lib.pas',
  WaryLua in 'WaryLua.pas',
  ApplicationLua in 'ApplicationLua.pas',
  FormLua in 'FormLua.pas',
  Vcl.Forms;

{$R *.res}

var
//  lpForm : TForm;
  Lua : TWaryLua;
begin
    Lua             := TWaryLua.Create;
    Lua.LibraryPath := LUA_LIBRARY;
    Lua.DoFile('main.lua');
    Sleep(2000);
//  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
//  Application.CreateForm(TForm, lpForm);
//  Application.Run;
end.
