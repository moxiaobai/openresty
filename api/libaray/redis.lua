--
-- Redis辅助类
-- User: moxiaobai
-- Date: 2017/1/23  16:34
--

local redis        = require("resty.redis")
local redisConfig  = require("config.redis")

local _M = {}
_M._VERSION = '1.0'

function _M.new(self, site)
    local cache = redis:new()
    cache:set_timeout(1000)

    local config = redisConfig[site]
    if config == nil then
        ngx.say("Missing Redis Config")
    end

    local ok, err = cache:connect(config.host, config.port)
    if not ok then
        ngx.say("Fail to connect:")
    end

    return cache
end

function keepalive(self)
    local sock = self.sock
    if not sock then
        ngx.say("not initialized")
    end

    return sock:set_keepalive(10000, 100)
end

return _M

