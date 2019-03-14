---------component-------
-- component 节点类
local component = {}

function component.new(self, opt)
    opt = opt or {}
    opt.name = opt.name or ""
    opt.children = opt.children or {}

    self.__index = self
    setmetatable(opt, self)
    return opt
end

-- 为此节点添加子节点
function component:add(node)
end

-- 遍历结构
function component:display(depth)
    -- for _, v in ipairs(self.children) do
    --     v:display()
    -- end
end

-- 定义好的一致性方法
function component:oneTask()
end


-- 为此节点删除一个节点
-- function component:remove(node)
--     table.insert(self.children, node)
-- end


---------component end-------

---------leaf-------
-- 叶子节点
local leaf = component:new()

-- 叶子节点不存在添加子节点
function leaf:add(node)
end


function leaf:display(depth)
    local text = ""

    for i = 1, depth do
        text = text .. "--"
    end
    print(text .. self.name)
end


-- 叶子节点都是单模块，单独卖出
function leaf:oneTask()
    print(self.name .. "is single selled")
end

---------leaf end-------

---------composite-------
local composite = component:new()

function composite:add(node)
    table.insert(self.children, node)
end

function composite:display(depth)
    local text = ""

    for i = 1, depth do
        text = text .. "--"
    end
    print(text .. self.name)

    for _, v in ipairs(self.children) do
        -- print("--")
        v:display(depth + 1)
    end
end

-- 非叶子节点都是多模块组合，整体卖出
function composite:oneTask()
    print(self.name .. "is whole selled")
end



---------composite end-------

---------单独卖-------
local single = leaf:new()

function single:oneTask()
    print(self.name .. "is single selled")
    -- for _, v in ipairs(self.children) do
    --     v:oneTask()
    -- end
end
---------单独卖 end-------

---------整体卖-------
local whole = composite:new()

function whole:oneTask()
    print(self.name .. "is whole selled")

    for _, v in ipairs(self.children) do
        v:oneTask()
    end
end
---------整体卖 end-------

---main--

local computer = whole:new({ name = "computer" })

local screen = single:new({ name = "screen" })
local zhuji = whole:new({ name = "zhuji" })
computer:add(screen)
computer:add(zhuji)

local cpu = single:new({ name = "cpu" })
local cache = single:new({ name = "cache" })
zhuji:add(cpu)
zhuji:add(cache)


computer:display(0)
computer:oneTask()







