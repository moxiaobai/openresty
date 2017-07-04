--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2017/7/3
-- Time: 16:18
-- To change this template use File | Settings | File Templates.
--

local lrucache = require("resty.lrucache")

local cache, err = lrucache.new(200)
if not cache then
    ngx.log(ngx.ERR, "create cache error : ", err)
end

local function set(key, value, ttlInSeconds)
    cache:set(key, value, ttlInSeconds)
end

local function get(key)
    return cache:get(key)
end

local _M = {
  set = set,
  get = get
}

return _M


