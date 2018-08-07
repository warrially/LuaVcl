unit WaryLua;

{$M+}

interface

uses
  VerySimple.Lua, VerySimple.Lua.Lib, System.SysUtils, Winapi.Windows,
  ApplicationLua, FormLua, ConsoleLua;

type
  // MyLua example class
  TWaryLua = class(TVerySimpleLua)
  private
    pApplicationLua: TApplicationLua;
    pFormLua: TFormLua;
    pConSole: TConsoleLua;
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
uses GlobalDefine, cnConsole;

constructor TWaryLua.Create;
begin
  inherited;
  LibraryPath := LUA_LIBRARY;
  pApplicationLua := TApplicationLua.Create();
  pFormLua := TFormLua.Create();
  pConSole := TConsoleLua.Create();
end;

destructor TWaryLua.Destroy;
begin
  pApplicationLua.Free();
  pFormLua.Free();
  pConSole.Free();
  inherited;
end;

procedure TWaryLua.DoError(Msg: String);
begin
  if Assigned(g_Console) then
  begin
    g_console.SetTextColor(tfRed + tfIntensity);
    Writeln(Msg);
    g_console.SetTextColor(tfWhite);
  end
  else
  begin
    OutPutDebugString(PChar(Msg));
  end;
end;

procedure TWaryLua.DoPrint(Msg: string);
begin
  if Assigned(g_Console) then
  begin
    g_console.SetTextColor(tfGreen + tfIntensity);
    Writeln(Msg);
    g_console.SetTextColor(tfWhite);
  end
  else
  begin
    OutPutDebugString(PChar(Msg));
  end;
end;

procedure TWaryLua.Open;
begin
  inherited;
  // and create a second package and auto register those package functions
  RegisterPackage('vcl.Application', pApplicationLua);
  RegisterPackage('vcl.Form', pFormLua);
  RegisterPackage('vcl.Console', pConSole);
end;

end.
