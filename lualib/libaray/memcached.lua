--
-- Memcached类
-- User: moxiaobai
-- Date: 2017/1/24  10:08
--

local memcached        = require("resty.memcached")
local memcachedConfig  = require("config.memcached")

local _M = {}
_M._VERSION = '1.0'

function _M.new(self, site)
    local cache,err  = memcached:new()

    if not cache then
        ngx.say("Failed to instantiate  Memcached: ", err)
    end

    cache:set_timeout(1000)

    local config = memcachedConfig[site]
    if config == nil then
        ngx.say("Missing Memcached Config")
    end

    local ok, err = cache:connect(config.host, config.port)
    if not ok then
        ngx.say("failed to connect: ", err)
    end

    return cache
end

function _M.close(self)
    local sock = self.sock
    if not sock then
        ngx.say("not initialized")
    end

    local ok, err = sock:set_keepalive(10000, 100)
    if not ok then
        ngx.say("cannot set keepalive: ", err)
    end

     local ok, err = sock:close()
     if not ok then
         ngx.say("failed to close: ", err)
     end
end

return _M


