--
-- 同步执行多个接口
-- User: moxiaobai
-- Date: 2017/7/4 17:35
-- To change this template use File | Settings | File Templates.
--

local t1 = ngx.now()

local res1 = ngx.location.capture("/api1", {args = ngx.req.get_uri_args()})
local res2 = ngx.location.capture("/api2", {args = ngx.req.get_uri_args()})

local t2 = ngx.now()
ngx.print(res1.body, "<br/>", res2.body, "<br/>", tostring(t2-t1))
