--
-- 模板渲染
-- User: Administrator
-- Date: 2017/7/4
-- Time: 14:18
-- To change this template use File | Settings | File Templates.
--

--{* var *}：变量输出；
--{{ var }}：变量转义输出；
--{% code %}：代码片段；
--{# comment #}：注释；
--{-raw-}：中间的内容不会解析，作为纯文本输出；

local template = require("resty.template")

--是否缓存解析后的模板，默认true
--template.caching(false)

--渲染模板需要的上下文(数据)
local content = {
    title = "测试",
    name = "张三",
    description = "<script>alert(1);</script>",
    age = 20,
    hobby = {"电影", "音乐", "阅读"},
    score2 = {
        {name = "语文", score = 90},
        {name = "数学", score = 80},
        {name = "英语", score = 70},
    }
}

--渲染模板
template.render("t1.html", content)

