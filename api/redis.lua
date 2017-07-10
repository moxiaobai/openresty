--
-- Redis Demo
-- User: moxiaobai
-- Date: 2017/1/23  16:31
--

local cjson           = require("cjson")
local redis           = require("libaray.redis")
local redisInstance   = redis:new("task")

local res, err = redisInstance:get("user")
if res == ngx.null then
    res = "moxiaobai"
    ok, err = redisInstance:set("user", res)
end

--local user = cjson.decode(res)
--ngx.say(user.name)



ngx.say(res)

redisInstance:close()

