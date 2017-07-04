--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2017/7/3
-- Time: 16:16
-- To change this template use File | Settings | File Templates.
--

local mycache  = require("mycache")
local total1   = mycache.get("total1")
if not total1 then
    total1 = 1

    ngx.say("total=", total1)
end

 total1 = total1 + 1;
--过期时间10分钟
mycache.set("total1", total1, 10*60*60)
ngx.say(mycache.get("total1"))
