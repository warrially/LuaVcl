unit WaryLua;

{$M+}

interface

uses
    VerySimple.Lua, VerySimple.Lua.Lib, System.SysUtils, Winapi.Windows, ApplicationLua, FormLua;

type
    // MyLua example class
    TWaryLua = class(TVerySimpleLua)
    private
        pApplicationLua: TApplicationLua;
        pFormLua : TFormLua;
    protected
        procedure DoPrint(Msg: string); override;
        procedure DoError(Msg: String); override;
    public
        constructor Create; override;
        destructor Destroy; override;
        procedure Open; override;
    published
        // lua functions this published methods are automatically added
        // to the lua function table if called with TLua.Create(True) or Create()
    end;

implementation

constructor TWaryLua.Create;
begin
    inherited;
    LibraryPath := LUA_LIBRARY;
    pApplicationLua := TApplicationLua.Create();
    pFormLua := TFormLua.Create();
end;

destructor TWaryLua.Destroy;
begin
    pApplicationLua.Free();
    pFormLua.Free();
    inherited;
end;

procedure TWaryLua.DoError(Msg: String);
begin
     OutPutDebugString(PChar(Msg));
end;

procedure TWaryLua.DoPrint(Msg: string);
begin
     OutPutDebugString(PChar(Msg));
end;

procedure TWaryLua.Open;
begin
    inherited;
    // and create a second package and auto register those package functions
    RegisterPackage('vcl.Application', pApplicationLua);
    RegisterPackage('vcl.Form', pFormLua);
end;

end.
