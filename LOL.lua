local LOL = {}
LOL.__index = LOL
function LOL:clone(...)
    local T = setmetatable({}, self)
    T.__index = T
    return T
end
function LOL:init(...) end
function LOL:is(T)
    return getmetatable(self) == T
end
function LOL:issub(T)
    local mt = getmetatable(self)
    while mt do
        if mt == T then return true end
        mt = getmetatable(mt)
    end
    return false
end
return LOL