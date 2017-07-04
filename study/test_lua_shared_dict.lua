--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2017/6/30
-- Time: 16:46
-- To change this template use File | Settings | File Templates.
--

local shared_data = ngx.shared.shared_data

local stat = shared_data:get("stat")
if not stat then
    stat = 1

    shared_data:set("stat", stat);
end

stat = shared_data:incr("stat", 1)
ngx.say("stat=", stat)
