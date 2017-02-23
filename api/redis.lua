--
-- Redis Demo
-- User: moxiaobai
-- Date: 2017/1/23  16:31
--

local cjson           = require("cjson")
local redis           = require("libaray.redis")
local redisInstance   = redis:new("task")

local ok
local res, err = redisInstance:get("user")
if not res then
    local userInfo = {name='moxiaobai', age=25}
    ok, err = redisInstance:set("user", cjson.encode(userInfo))
    if not ok then
        ngx.say("failed to set dog: ", err)
        return
    end

    res = userInfo
end

local user = cjson.decode(res)
ngx.say(user.name)

