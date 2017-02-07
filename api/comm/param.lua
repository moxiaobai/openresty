--
-- Created by IntelliJ IDEA.
-- User: moxiaobai
-- Date: 2017/1/21
-- Time: 15:55
-- To change this template use File | Settings | File Templates.
--

local _M = {}

function _M.is_number(...)
    local arg = {... }

    local num
    for _,v in ipairs(arg) do
        num = tonumber(v)
        if nil == num then
            return false
        end
    end

    return true
end

return _M

