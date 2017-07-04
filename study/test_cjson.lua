--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2017/7/3
-- Time: 16:02
-- To change this template use File | Settings | File Templates.
--

local cjson = require("cjson")

--lua 对象到字符串
local obj = {
    id    = 1,
    name  = "moxiaobai",
    age   = nil
}

local str = cjson.encode(obj)
--ngx.say(str)

local json = '{"name":"moxiaobai","id":1,"age":null}';
local userInfo = cjson.decode(json)

ngx.say(obj.age)
ngx.say("莫小白")