local Console = {}


-- 初始化 App
function Console:Initialize()
    require("vcl.Console").Initialize();
end;

function Console:WriteLn(s)
    require("vcl.Console").WriteLn(s);
end;
function Console:ReadLn(s)
    return require("vcl.Console").ReadLn();
end;



return Console;