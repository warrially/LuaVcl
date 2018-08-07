local callback_list = {}

function WaryCallback(obj, name, ...)   
    if callback_list[obj] and callback_list[obj][name] then
        callback_list[obj][name](...)
    end
end

-- 注册一个
function WaryRegister(obj, name, fun)
    print("WaryRegister   " , obj, "  ", name, "  ", fun)
    callback_list[obj] = callback_list[obj] or {}
    callback_list[obj][name] = fun;
end;

function WaryUnRegister(obj)
    print(" 反注册 obj -->  ",  obj)   
    callback_list[obj] = nil    
end;
