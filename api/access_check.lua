--
-- 访问权限处理（IP准入，接口权限等等）
-- User: moxiaobai
-- Date: 2017/1/17 16:10
--

-- IP限制
local whiteIps = {["192.168.6.21"]=true, ["192.168.1.31"]=true }
local ip = ngx.var.remote_addr

if true ~= whiteIps[ip] then
    ngx.exit(ngx.HTTP_FORBIDDEN)
end

-- 检查参数
--ngx.req.read_body()
--local args, err = ngx.req.get_post_args()
--if not args then
--    ngx.say("failed to get post args: ", err)
--    return
--end

--local req = require "req"
--local args = req.getArgs()

--ngx.say(table.getn(args))
--table.sort(args);

--local authKey = 'Comylife*^@#%^'
--for key, val in pairs(args) do
--    if key ~= "sign" then
--        authKey = authKey .. val
--    end
--end

--ngx.say(authKey)

--local param = require("comm.param")
--local args = ngx.req.get_uri_args()
--
--if not args.a or not args.b or not param.is_number(args.a, args.b) then
--    ngx.exit(ngx.HTTP_BAD_REQUEST)
--    return
--end

