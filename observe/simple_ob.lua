-- 公众号类
local publish = {}

function publish:new( o )
    -- body
    o = o or {}
    o.followers = o.followers or {}
    o.article = o.article or ""
    setmetatable(o, self)
    self.__index = self

    return o
end

-- 被关注
function publish:beFollow( follower )
    table.insert(self.followers, follower)
end


-- 被取关
function publish:beCancelFollow()
end

-- 写一个推文
function publish:wirte(name)
    self.article = name
end

-- 发送推文
function publish:sendMsg()
    for _, v in ipairs(self.followers) do
        -- 这里使用了 粉丝类 的方法
        v:react()
    end
end



-- 黑粉
local blackFans = {}
function blackFans:new( o )
    o = o or {}
    -- 关注的公众号
    o.pub = o.pub or {}
    setmetatable(o, self)
    self.__index = self
    
    return o
end

-- 收到推文的反应
function blackFans:react()
    print("辣鸡文章！" .. self.pub.article)
end

-- 忠实粉
local goodFans = {}
function goodFans:new( o )
    o = o or {}
    -- 关注的公众号
    o.pub = o.pub or {}
    setmetatable(o, self)
    self.__index = self
    
    return o
end

-- 收到推文的反应
function goodFans:react()
    print("点赞，转发，打赏!" .. self.pub.article)
end

--  路人
local notFans = {}
function notFans:new( o )
    o = o or {}
    -- 关注的公众号
    o.pub = o.pub or {}
    setmetatable(o, self)
    self.__index = self
    
    return o
end

-- 收到推文的反应
function notFans:react()
    print("没意思，" .. self.pub.article)
end


local p = publish:new()
local bf = blackFans:new({pub = p})
local gf = goodFans:new({pub = p})
local nf = notFans:new({pub = p})

p:beFollow(bf)
p:beFollow(nf)
p:beFollow(gf)

p:wirte("核心对撞 | 伍壹玖原子对撞机")
p:sendMsg()
print('---------')
p:wirte("核心对撞 | 伍壹玖原子对撞机金色天际线")
p:sendMsg()
