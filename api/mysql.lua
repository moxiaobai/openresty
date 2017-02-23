--
-- Mysql Demo
-- User: moxiaobai
-- Date: 2017/1/22
-- Time: 14:47
--

local cjson    = require("cjson")
local lrucache = require("resty.lrucache")
local mysql   = require("libaray.mysql")
local db      = mysql:new("task_www")

local c,err = lrucache.new(200)
if not c then
    return error("failed to create the cache: " .. (err or "unknown"))
end

--local userInfo = c:get("userInfo")
--if not userInfo then
--    local userid = 'manager5078'
--    res, err, errno, sqlstate = db:query(string.format([[select * from t_company_user where cu_userid = '%s' limit 1]], userid))
--
--
--    userInfo = res[1]
--
--    c:set("userInfo", userInfo)
--    db:close()
--end


--ngx.say(cjson.encode(userInfo))

--c:set("dog", 32, 1000)
ngx.say("dog: ", c:get("dog"))



