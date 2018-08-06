unit ExcelLua;

interface

uses
    VerySimple.Lua, VerySimple.Lua.Lib,  Windows,
    System.Generics.Collections, System.Classes,
    SysUtils;

{$M+}

type
    TExcelLua = class
    private

    public
        constructor Create;
        destructor Destroy;
    published

        function S2F(L: lua_State): Integer;               // 字符串转浮点
        function S2D(L: lua_State): Integer;               // 字符串转日期形式
    end;

implementation

uses IOUtils, Types;
{ TMyPackage2 }

// 构造
constructor TExcelLua.Create;
begin

end;

// 强行转换成浮点
destructor TExcelLua.Destroy;
begin

end;

function TExcelLua.S2D(L: lua_State): Integer;
    function GetDateFormat(): string;
    var
        SysFrset: TFormatSettings;
    begin
        Result := '';
        GetLocaleFormatSettings(GetUserDefaultLCID, SysFrset);
        Result := SysFrset.DateSeparator; // DateSeparator当前系统日期分隔符
    end;

var
    fr, str: string;
begin
    fr  := GetDateFormat();
    str := lua_tostring(L, 1);
    str := StringReplace(str, '.', fr, [rfReplaceAll]);
    str := StringReplace(str, '/', fr, [rfReplaceAll]);
    str := StringReplace(str, '-', fr, [rfReplaceAll]);
    str := StringReplace(str, '年', fr, [rfReplaceAll]);
    str := StringReplace(str, '月', fr, [rfReplaceAll]);
    str := StringReplace(str, '日', '', [rfReplaceAll]);

    lua_pushnumber(L, StrToDateDef(str, 0));
    Result := 1;
end;
// 强行转换成浮点

function TExcelLua.S2F(L: lua_State): Integer;
var
    str: string;
begin
    str := lua_tostring(L, 1);
    str := StringReplace(str, ',', '', [rfReplaceAll]);
    str := StringReplace(str, '，', '', [rfReplaceAll]);
    lua_pushnumber(L, StrToFloatDef(str, 0));

    Result := 1;
end;

end.
