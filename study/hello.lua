--
-- Created by IntelliJ IDEA.
-- User: moxiaobai
-- Date: 2017/2/22  11:03
--

--获取参数  # try access /nginx_var?a=hello,world
--local param_a =  ngx.var.arg_a
--if not param_a then
--   ngx.say('fail');
--else
--    ngx.say(param_a)
--end


local function swap(a, b)
    return b, a
end

local x = 1
local y = 20

x,y = swap(x,y)
-- ngx.say(x,y)

local redisConfig  = require("config.redis")
if redisConfig.password == nil then
    ngx.say(11)
end


