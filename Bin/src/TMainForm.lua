-- TMainForm.lua


local TMainForm = setmetatable({}, {__index = require("lua.TForm")});

function TMainForm:onCreate()	
	self:SetCaption("TMainForm SetCaption");
	self:SetOnClick(function() 	
		self:SetCaption("Click")
	end)
end;



return TMainForm;
