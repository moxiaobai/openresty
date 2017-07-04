--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2017/7/3
-- Time: 10:31
-- To change this template use File | Settings | File Templates.
--

local function close_redis(red)
    if not red then
        return
    end

    --释放连接(连接池实现)
    local pool_max_idle_time = 10000 --毫秒
    local pool_size          = 100 --连接池大小
    local ok, err = red:set_keepalive(pool_max_idle_time, pool_size)
    if not ok then
        ngx.say("set  keepalive  error:" , err)
    end
end

local redis = require("resty.redis")

--创建实例
local red = redis:new()
red:set_timeout(1000)

local ok, err = red:connect("127.0.0.1", 6379)
if not ok then
    ngx.say("connect to redis error : ", err)
    return close_redis(red)
end

ok, err = red:set("msg", "hello world")
if not ok then
    ngx.say("set msg erro : ", err)
    return close_redis(red)
end

local resp, err = red:eval("return redis.call('get', KEYS[1])", 1, "msg")
--local resp, err = red:get("msg")
if not resp then
    ngx.say("get msg error", err)
    return close_redis(red)
end

--得到的数据为空处理
if resp == ngx.null then
    resp = ''
end

ngx.say("msg : ", resp)

close_redis(red)

