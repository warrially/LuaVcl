print("程序入口在这里")

local Application = require("lua.Application")

Application:Initialize();
Application:SetMainFormOnTaskBar(true);
local pForm = Application:CreateForm();
pForm:SetCaption("wangwei");
Application:Run();