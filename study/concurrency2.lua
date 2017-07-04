--
-- Created by IntelliJ IDEA.
-- User: moxiaobai
-- Date: 2017/7/4 17:47
-- To change this template use File | Settings | File Templates.
--

local t1 = ngx.now()
local function capture(uri, args)
   return ngx.location.capture(uri, args)
end

local thread1 = ngx.thread.spawn(capture, "/api1", {args = ngx.req.get_uri_args()})
local thread2 = ngx.thread.spawn(capture, "/api2", {args = ngx.req.get_uri_args()})
local ok1, res1 = ngx.thread.wait(thread1)
local ok2, res2 = ngx.thread.wait(thread2)

--local  ok, res = ngx.thread.wait(thread1, thread2)

local t2 = ngx.now()
ngx.print(res1.body, "<br/>", res2.body, "<br/>", tostring(t2-t1))