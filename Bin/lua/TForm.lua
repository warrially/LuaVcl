-- Form.lua

local TForm = {}

-- 窗体创建
function TForm.Create() 
	local instance = require("vcl.Application").CreateForm();
	local pForm = {}
	setmetatable(pForm, {__index = TForm});
	pForm.instance = instance;
	print("instance = ", instance)
	return pForm;
end;

-- 设置标题栏
function TForm:SetCaption(strValue)
	print("SetCaption", self.instance);		
	require("vcl.Form").SetCaption(self.instance,  tostring(strValue));
end;


return TForm;
