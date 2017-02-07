--
-- Created by IntelliJ IDEA.
-- User: moxiaobai
-- Date: 2017/1/17
-- Time: 16:11
-- To change this template use File | Settings | File Templates.
--

local args = ngx.req.get_uri_args()
ngx.say(args.a + args.b)

--local data = ngx.req.get_body_data()
--ngx.say("Hello ", data)

--local res = ngx.location.capture('/api/addition',
--    {
--        method = ngx.HTTP_POST,
--        args   = ngx.encode_args({a = 1, b = '2&'}),
--        body   = ngx.encode_args({c = 3, d = '4&'})
--    }
--)
--ngx.say(res.body)
--
--ngx.log(ngx.ERR, "Hello")