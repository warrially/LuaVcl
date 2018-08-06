unit ApplicationLua;

interface

uses
    VerySimple.Lua, VerySimple.Lua.Lib, Windows, System.Generics.Collections,
    System.Classes, SysUtils, Vcl.Forms;

{$M+}

type
    TApplicationLua = class
    private
//        m_nIdx: UInt32;
//        m_xls : TDictionary<UInt32, TXLSReadWriteII5>;
    public
        constructor Create;
        destructor Destroy;
    published
        function Print(L : lua_State): Integer; //
        function Initialize(L : lua_State): Integer; // 初始化
        function Run(L : lua_State): Integer; // 运行
        function SetMainFormOnTaskBar(L : lua_State): Integer; // 设置窗体是否可以在任务栏上运行
        function CreateForm(L : lua_State): Integer; // 创建一个窗体
    end;

implementation

uses IOUtils, Types, FormLua  ;
{ TMyPackage2 }



constructor TApplicationLua.Create;
begin
  inherited;

end;

function TApplicationLua.CreateForm(L: lua_State): Integer;
var
   pForm : TForm;
begin
   Application.CreateForm(TFormLua, pForm);
end;

destructor TApplicationLua.Destroy;
begin

  inherited;
end;

function TApplicationLua.Initialize(L: lua_State): Integer;
begin
     Application.Initialize();
end;

function TApplicationLua.Print(L: lua_State): Integer;
begin
     OutputDebugString('TApplicationLua');
     Result := 0;
end;

function TApplicationLua.Run(L: lua_State): Integer;
begin
     Application.Run();
end;

function TApplicationLua.SetMainFormOnTaskBar(L: lua_State): Integer;
var
   bValue : boolean;
   n : integer;
begin
     n :=  lua_toboolean(L, 1) ;
     bValue := lua_toboolean(L, 1) = 1;
     Application.MainFormOnTaskbar := bValue;
end;

end.
