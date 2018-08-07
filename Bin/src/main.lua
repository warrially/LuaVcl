print("程序入口在这里")

local Application = require("lua.Application")

Application:Initialize();
Application:SetMainFormOnTaskBar(true);

require("src.TMainForm"):Create();

Application:Run();