--
-- mysql 辅助类
-- User: moxiaobai
-- Date: 2017/1/22 15:13
--

local mysql        = require("resty.mysql")
local mysqlConfig  = require("config.mysql")

local _M = {
    _VERSION = '1.0'
}

local mt = { __index = _M }

--实例化mysql
function _M.new(self, database)
    local db,err  = mysql:new()
    if not db then
        ngx.log(ngx.ERR, err)
        return
    end

    db:set_timeout(1000)

    local config = mysqlConfig[database]
    if config == nil then
        ngx.log(ngx.ERR, "Missing Database Config")
        return
    end

    local ok, err, errno, sqlstate = db:connect(config)
    if not ok then
        ngx.log(ngx.ERR, "Fail to connect:", err, ":", errno, " ", sqlstate)
        return
    end

    return db
end

-- 关闭连接
function _M.close(self)
    local sock = self.sock
    if not sock then
        return nil, "not initialized"
    end

    --释放连接(连接池实现)
    local pool_max_idle_time = 10000 --毫秒
    local pool_size = 100 --连接池大小
    local ok, err = sock:set_keepalive(pool_max_idle_time, pool_size)
    if not ok then
       return nil, err
    end
end

return _M


