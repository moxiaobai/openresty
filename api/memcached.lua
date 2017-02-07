--
-- Memcached Demo
-- User: moxiaobai
-- Date: 2017/1/24  10:38
--

local cjson      = require("cjson")
local memcached  = require("libaray.memcached")
local instance   = memcached:new("task")

local userInfo = {name='moxiaobai', age=25}
ok, err = instance:set("user", cjson.encode(userInfo))
if not ok then
    ngx.say("failed to set dog: ", err)
    return
end

local res, err = instance:get("user")

local user = cjson.decode(res)
ngx.say(user.name)


instance:close()



