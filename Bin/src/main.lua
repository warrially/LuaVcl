print("程序入口在这里")

local function StartApplication()
    local Application = require("lua.Application")

    Application:Initialize();
    Application:SetMainFormOnTaskBar(true);

    require("src.TMainForm"):Create();

    Application:Run();
end;
-- StartApplication()

local function StartConsole()
    local Console = require("lua.Console");

    Console:Initialize();
    print("啊啊博雅")

    Console:WriteLn("press any key to continue")
    Console:ReadLn();
end;

-- StartConsole();