-- Form.lua

local TForm = {}

-- 窗体创建
function TForm:Create() 
    local instance = require("vcl.Application").CreateForm();
    local pForm = {}
    setmetatable(pForm, {__index = self});
    pForm.instance = instance;
    print("instance = ", instance)

    -- 手动补构造函数
    if pForm.onCreate then
        pForm:onCreate();
    end
    return pForm;
end;

-- 设置标题栏
function TForm:SetCaption(strValue)
    print("SetCaption", self.instance);     
    require("vcl.Form").SetCaption(self.instance,  tostring(strValue));
end;

-- 设置点击回调
function TForm:SetOnClick(fun)
    print("SetOnClick", self.instance, fun)

    -- 在LUA注册
    WaryRegister(self.instance, "__OnClick", fun)

    -- 在VCL注册
    require("vcl.Form").SetOnClick(self.instance, "__OnClick"); 
end;

return TForm;
