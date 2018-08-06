unit FormLua;

interface

uses
    VerySimple.Lua, VerySimple.Lua.Lib, Windows, System.Generics.Collections,
    System.Classes, SysUtils, Vcl.Forms;

{$M+}

type
    TFormLua = class
    private
    published
        function Print(L: lua_State): Integer; //

        function CreateForm(L: lua_State): Integer; // 创建一个窗体
        function SetCaption(L: lua_State): Integer; // 设置窗体标题
    end;

implementation

uses IOUtils, Types;

{ TFormLua }



function TFormLua.CreateForm(L: lua_State): Integer;
//var
//  pForm : TForm;
begin
//     pForm
end;


function TFormLua.Print(L: lua_State): Integer;
begin

end;

function TFormLua.SetCaption(L: lua_State): Integer;
var
   instance : pointer;
   strValue : string;
begin
   instance := lua_touserdata(L, 1);
   strValue := lua_tostring(L, 2);

   TForm(instance).Caption := strValue;

end;

end.
