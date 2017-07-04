--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2017/7/3
-- Time: 11:53
-- To change this template use File | Settings | File Templates.
--

local cjson = require 'cjson'


local function close_db(db)
    if not db then
        return
    end

    local ok, err = db:set_keeplive(10000, 100)
    if not ok then
        ngx.say("faild to set keeplive: ", err)
    end
    --db:close()
end

local mysql  = require("resty.mysql")
local db,err = mysql:new()
if not db then
    ngx.say("new mysql error : ", err)
    return
end

db:set_timeout(1000)
local props = {
    host     = "127.0.0.1",
    port     = 3306,
    database = "demo",
    user     = "root",
    password = "123456"
}

local res, err, errno, sqlstate = db:connect(props)
if not res then
    ngx.say("connect to mysql error :" , err, " , errno :" , errno, " , sqlstate :", sqlstate)
    return close_db(db)
end

----更新
--local update_sql = "update t_banner set b_order = 1 where b_id = 4"
--res, err, errno, sqlstate = db:query(update_sql)
--if not res then
--    ngx.say("Update error : ", err)
--    return close_db(db)
-- end

--查询数据,使用ngx.quote_sql_str进行字符串转义，防止sql注入；
local status = ngx.req.get_uri_args()["status"] or ''
local query_sql = "select * from t_news_meta where nm_status = " .. ngx.quote_sql_str(status)
res, err, errno, sqlstate = db:query(query_sql)
if not res then
   ngx.say("select error : ", err, " , errno : ", errno, " , sqlstate : ", sqlstate)
   return close_db(db)
end

ngx.say(cjson.encode(res))

for i, row in ipairs(res) do
    ngx.say("row : ", cjson.encode(row))
--   for name, value in pairs(row) do
--     ngx.say("select row ", i, " : ", name, " = ", value, "<br/>")
--   end
end

close_db()




