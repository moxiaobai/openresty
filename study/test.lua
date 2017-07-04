--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2017/6/30
-- Time: 16:58
-- To change this template use File | Settings | File Templates.
--

--count = count + 1
--ngx.say("global variable : ", count)
--local shared_data = ngx.shared.shared_data
--ngx.say(", shared memory : ", shared_data:get("count"))
--shared_data:incr("count", 1)
--ngx.say("hello world")

local module1 = require("test_module")

module1.hello()