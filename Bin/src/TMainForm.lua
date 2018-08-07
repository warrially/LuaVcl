-- TMainForm.lua


local TMainForm = setmetatable({}, {__index = require("lua.TForm")});

function TMainForm:ctor()	
	self:SetCaption("TMainForm SetCaption");
	self:SetOnClick(function() 	
		self:SetCaption("Click")
	end)
end;



return TMainForm;
