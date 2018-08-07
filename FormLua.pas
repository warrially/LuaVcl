unit FormLua;

interface

uses
    VerySimple.Lua, VerySimple.Lua.Lib, Windows, System.Generics.Collections,
    System.Classes, SysUtils, Vcl.Forms;

{$M+}

type
    TFormLua = class
    private

    public
       procedure __OnClick(Sender: TObject); // 单击回调
    published

        function SetCaption(L: lua_State): Integer; // 设置窗体标题
        function SetOnClick(L: lua_State): Integer; // 设置窗体标题

    end;

implementation

uses IOUtils, Types, Lua;

{ TFormLua }


function TFormLua.SetCaption(L: lua_State): Integer;
var
   instance : pointer;
   strValue : string;
begin
   instance := lua_touserdata(L, 1);
   strValue := lua_tostring(L, 2);

   TForm(instance).Caption := strValue;

end;

// 设置单机回调
function TFormLua.SetOnClick(L: lua_State): Integer;
var
   instance : pointer;
begin
    instance := lua_touserdata(L, 1);

    TForm(instance).OnClick := self.__OnClick;
end;


procedure TFormLua.__OnClick(Sender: TObject);
var
  L : lua_State;
begin
   L := g_Lua.LuaState;
   lua_getglobal(L, 'WaryCallback');
   lua_pushlightuserdata(L, Sender);
   lua_pushstring(L, '__OnClick');
   lua_call(L, 2, 0);
end;
end.
