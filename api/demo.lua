--
-- Created by IntelliJ IDEA.
-- User: moxiaobai
-- Date: 2017/1/24  16:11
--

local res = ngx.location.capture("/api/mysql")
if res then
    --ngx.say("status: ", res.status)
    --ngx.say("body:")
    --ngx.print(res.body)
end



local logger = require( "resty.logger")
local log = logger:new('debug', '/tmp/logfile.log' )

log:info('I am info')
log:debug( 'I am debug' )
log:error( "I am error" )

ngx.say("Hello")