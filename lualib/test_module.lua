--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2017/7/3
-- Time: 9:31
-- To change this template use File | Settings | File Templates.
--

 count = 0

local function hello()
   count = count + 1
    ngx.say("count : ", count)
end

local _M = {
    hello = hello
}

return _M
