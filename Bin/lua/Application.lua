local Application = {}

-- 初始化 App
function Application:Initialize()
    require("vcl.Application").Initialize();
end;

function Application:SetMainFormOnTaskBar(bValue)
    require("vcl.Application").SetMainFormOnTaskBar(bValue);
end;

function Application:CreateForm()
    local pForm = require("lua.TForm").Create();
    return pForm;    
end;

function Application:Run()
    require("vcl.Application").Run();
end;




return Application;