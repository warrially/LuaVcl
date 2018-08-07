
function new(T)
	local p = {}
	setmetatable(p, {__index = T})

	if p.onCreate then
		p:onCreate()
	end
end;


function class(super)
	
	local child = {}
	child.super = super;

	setmetatable(child, {
		__index = super,
		__call = new,
	})

	return child;
end