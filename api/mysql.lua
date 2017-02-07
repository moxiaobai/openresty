--
-- Mysql Demo
-- User: moxiaobai
-- Date: 2017/1/22
-- Time: 14:47
--

local cjson   = require("cjson")
local mysql   = require("libaray.mysql")
local db      = mysql:new("task_www")

local userid = 'manager5078'
res, err, errno, sqlstate = db:query(string.format([[select * from t_company_user where cu_userid = '%s' limit 1]], userid))
db:close()

ngx.say(cjson.encode(res[1]))



