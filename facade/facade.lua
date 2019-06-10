
-- 数据层下的数据库模块
local data = {}

function data:new( o )
    o = o or {}

    setmetatable(o, self)
    self.__index = self

    return o
end

-- 设置数据库 mysql mongo ..
function data:setDatabase(db)
    self.db = db
    print("set " .. db)
end

-- 连接数据库
function data:connectDb( info )
    -- body
    -- 在这里连接数据库会根据连接的数据库不同而不同，这里应该是要有进一步抽象，但是本次例子中忽略。
    print("connect to " .. self.db .. " to " .. info)
end

function data:exe( query )
    -- body
    -- 这里执行数据库语句也是会有所不同，但是本次例子忽略
    print(self.db .. "执行 " .. query)
end

-- 数据层下的 log 日志系统模块
local log = {}
function log:new( o )
    o = o or {}

    setmetatable(o, self)
    self.__index = self

    return o
end

function log:locate( path )
    -- body
    self.path = path
    print("设置日志输出位置 " .. path)
end

function log:writeToFile( info )
    print("将 " .. info .. " 写入日志文件")
end

function log:setLevel( lev )
    print("等级为 " .. lev)
end


-- facade 外观层
local facade = {}

function facade:new( o )
    o = o or {}

    setmetatable(o, self)
    self.__index = self

    return o
end

-- 随着子系统的增加或者拓展，一些逻辑需要的执行方法会越来越复杂，如果把这些逻辑放到业务层，增加了开发和阅读难度
function facade:init()
    -- 数据层 数据库模块
    self.data = data:new()
    self.data:setDatabase("msyql")
    self.data:connectDb("12.12.12.12")

    -- 数据层 日志模块
    self.log = log:new()
    self.log:locate("./")
    self.log:setLevel("warning")

end

-- 更新对应表
function facade:update( tbl )
    self.data:exe("update ...")
    self.log:writeToFile("update " .. tbl)
end

-- 插入对应表
function facade:insert( tbl )
    self.data:exe("insert ...")
    self.log:writeToFile("insert " .. tbl)
end

-- 业务层
local ser = {}

function ser:new( o )
    o = o or {}

    setmetatable(o, self)
    self.__index = self

    return o
end

function ser:init()
    self.facade = facade:new()
    self.facade:init()
end

function ser:setUser()
    self.facade:insert("tbl_user")
end

function ser:chgUser()
    self.facade:update("tbl_user")
end


-- 实际调用
local s = ser:new()
print("-----init")
ser:init()

print("-----start")
ser:setUser()