--
-- Redis辅助类
-- User: moxiaobai
-- Date: 2017/1/23  16:34
--

local redis        = require("resty.redis")
local redisConfig  = require("config.redis")

local _M = {_VERSION = '1.0'}

function _M.new(self, site)
    local cache = redis:new()
    cache:set_timeout(1000)

    local config = redisConfig[site]
    if config == nil then
        ngx.log("Missing Redis Config")
        return
    end

    local ok, err = cache:connect(config.host, config.port)
    if not ok then
        ngx.log("Fail to connect:", err)
        return
    end

    -- password auth
    if redisConfig.password ~= nil then
        local count
        count, err = cache:get_reused_times()
        if 0 == count then
            ok, err = cache:auth(redisConfig.password)
            if not ok then
                ngx.log("failed to auth: ", err)
                return
            end
        elseif err then
            ngx.log("failed to get reused times: ", err)
            return
        end
    end

    return cache
end

function _M.close(self)
    local sock = self.sock
    if not sock then
        ngx.log("not initialized")
        return nil, "not initialized"
    end

    local pool_max_idle_time = 10000 --毫秒
    local pool_size          = 100 --连接池大小
    local ok, err = red:set_keepalive(pool_max_idle_time, pool_size)
    if not ok then
        ngx.say("set  keepalive  error:" , err)
        return nil, err
    end
end

return _M

