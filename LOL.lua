local LOL = {}
LOL.__index = LOL
function LOL:clone(...)
    local T = setmetatable({}, self)
    T.__index = T
    return T
end
function LOL:init(...) end
function LOL:isa(T)
    if not getmetatable(self) then
        return false
    end
    if getmetatable(self) == T then
        return true
    end
    return getmetatable(self):isa(T)
end
return LOL