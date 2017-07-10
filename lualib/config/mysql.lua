--
-- Mysql数据库配置
-- User: moxiaobai
-- Date: 2017/1/23 11:15
--

local config  = {}

-- 任务系统
config["task"] = {
    host     = "127.0.0.1",
    port     = 3306,
    database = 'oa_www',
    user     = 'root',
    password = "123456",
    max_packet_size = 1024 * 1024
}

return config

