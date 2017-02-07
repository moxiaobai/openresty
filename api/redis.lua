--
-- Redis Demo
-- User: moxiaobai
-- Date: 2017/1/23  16:31
--

local cjson           = require("cjson")
local redis           = require("libaray.redis")
local redisInstance   = redis:new("task")

local userInfo = {name='moxiaobai', age=25}
ok, err = redisInstance:set("user", cjson.encode(userInfo))
if not ok then
    ngx.say("failed to set dog: ", err)
    return
end

local res, err = redisInstance:get("user")

local user = cjson.decode(res)
ngx.say(user.name)

