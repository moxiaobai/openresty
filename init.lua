--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2017/6/30
-- Time: 16:53
-- To change this template use File | Settings | File Templates.
--

local redis = require 'resty.redis'
local cjson = require 'cjson'

----全局变量，不推荐
--count = 1
--
----共享全局内存
--local shared_data = ngx.shared.shared_data
--shared_data:set("count", 1)

