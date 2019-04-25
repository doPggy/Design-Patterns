-- 原先的面向对象方式节省空间，但是没有 super 这个功能
-- 所以还是写一个拓展，参考了岩哥、云风代码

-- 用于生成一个类
function class( super )
    -- 一个类
    local cls = {}

    if super then
        -- 子类在高层，找不到再往元表
        setmetatable(cls, {__index = super})
        cls.super = super
    end

    -- 父类也要生成实例
    -- 生成实例
    function cls.new(self, ... )
        -- 同理，实例在高层，找不到再往元表走
        local instance = setmetatable({}, {__index = cls})

        -- 实例化过程
        local create
        create = function ( c, ... )
            -- 获得 super 但是为了不触发元表，使用 rawget
            local superCls = rawget(c, "super")
            if superCls then
                create(superCls, ...)
            end

            -- 获得构造函数
            local ctor = rawget(c, "ctor")
            if ctor then
                ctor(c, ...)
            end
        end
        create(cls, ...)

        return instance
    end

    -- cls 自带 cls.new。所以 new 函数中，需要传入 cls 作为 self
    return cls
end

function new(cls, ...)
    return cls.new( ... )
end



