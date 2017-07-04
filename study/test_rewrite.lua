--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2017/6/30
-- Time: 17:35
-- To change this template use File | Settings | File Templates.
--


if ngx.req.get_uri_args()["jump"] == "1" then
    return ngx.redirect("http://www.jd.com?jump=1", 302)
end
