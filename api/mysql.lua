--
-- Mysql Demo
-- User: moxiaobai
-- Date: 2017/1/22 14:47
--

local cjson       = require("cjson")

local mysql       = require("libaray.mysql")
local db          = mysql:new("task")

local userid = 'manager7118'
res, err, errno, sqlstate = db:query(string.format([[select * from t_company_user where cu_userid = '%s' limit 1]], userid))
userInfo = res[1]

db:close()


ngx.say(cjson.encode(userInfo))



