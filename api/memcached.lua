--
-- Memcached Demo
-- User: moxiaobai
-- Date: 2017/1/24  10:38
--

local cjson      = require("cjson")
local memcached  = require("libaray.memcached")
local instance   = memcached:new("task")

local result
local res, err = instance:get("user")
if not res then
    local userInfo = {name='moxiaobai', age=25}
    result, err = instance:set("user", cjson.encode(userInfo))
    if not result then
        ngx.say("failed to set ", err)
        return
    end

    res = userInfo
end

--local user = cjson.decode(res)
--ngx.say(user.name)

ngx.say(res)


instance:close()



