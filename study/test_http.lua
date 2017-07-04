--
--  Http客户端
-- User: Administrator
-- Date: 2017/7/3
-- Time: 14:29
-- 记得要配置DNS解析器resolver 8.8.8.8，否则域名是无法解析的。
--

local http = require("resty.http")

local httpc = http:new()

local resp, err = httpc:request_uri("http://192.168.1.80:9999/user.php", {
    method = "POST",
    body = "username=mlkom&age=28",
    --path = "/user.php",
    headers = {
        ["Content-Type"] = "application/x-www-form-urlencoded",
    }
})

if not resp then
    ngx.say("failed to request:", err)
    return
end

--获取状态码
ngx.status = resp.status

--获取响应头
--for k, v in pairs(resp.headers) do
--    if k ~= "Transfer-Encoding" and k ~= "Connection" then
--        ngx.header[k] = v
--    end
--end
--响应体
ngx.say(resp.body)

httpc:close()