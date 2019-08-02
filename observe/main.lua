local fan       = require "fan"
local publish   = require "publish"
-- 为了文件不太多，就这样

-- 写文章公众号
local articlePub = publish:new()

-- 制作推文
-- 一种状态改变
function articlePub:produceContent(content)
    print("制作一篇文章")
    self.content = content
end


-- 主攻视频的公众号
local videoPub = publish:new()

function videoPub:produceContent(content)
    print("制作一个视频")
    self.content = content
end

--------------------

-- 黑粉
local blackFans = fan:new()

-- 接收到推文的反应
function blackFans:update()
    print("辣鸡 " .. self.subject.content)
end


-- 忠实粉
local goodFans = fan:new()

-- 接收到推文的反应
function goodFans:update()
    print("打赏，转发 " .. self.subject.content)
end

--------------------

-- 文章公众号
local articlePubish = articlePub:new()
-- 视频公众号
local videoPubish   = videoPub:new()

-- 关注文章公号的黑粉
local blackFanTom4article = blackFans:new {subject = articlePubish}
local blackFanAmy4video = blackFans:new {subject = videoPubish}

-- 关注文章公号的忠实粉丝
local goodFanZyt4article = goodFans:new {subject = articlePubish}
-- 关注视频公号的忠实粉丝
local goodFanZz4video = goodFans:new {subject = videoPubish}
local goodFanFz4video = goodFans:new {subject = videoPubish}

articlePubish:attach(blackFanTom4article)
articlePubish:attach(goodFanZyt4article)
videoPubish:attach(blackFanAmy4video)
videoPubish:attach(goodFanZz4video)
videoPubish:attach(goodFanFz4video)

articlePubish:produceContent("核心对撞 | 金色天际线")
videoPubish:produceContent("金色的一天 | 金色天际线")
print("发布文章------------------")
articlePubish:notify()
videoPubish:notify()

