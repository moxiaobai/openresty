--
-- mysql 辅助类
-- User: moxiaobai
-- Date: 2017/1/22 15:13
--

local mysql        = require("resty.mysql")
local mysqlConfig  = require("config.mysql")

local _M = {}
_M._VERSION = '1.0'

--实例化mysql
function _M.new(self, database)
    local db,err  = mysql:new()

    if not db then
        ngx.say("Failed to instance mysql: ", err)
    end

    db:set_timeout(1000)

    local config = mysqlConfig[database]
    if config == nil then
        ngx.say("Missing Database Config")
    end

    local ok, err, errno, sqlstate = db:connect(config)
    if not ok then
        ngx.say("Fail to connect:", err, ":", errno, " ", sqlstate)
    end

    db.close = close

    return db
end

function close(self)
    local sock = self.sock
    if not sock then
        ngx.say("not initialized")
    end

    -- 连接池为50个，并且设置最大空闲时间为10秒
    return sock:setkeepalive(10000, 50)
end

return _M


