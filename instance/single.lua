local single = {
    isNew = false
}




-- 获得实例
function single.getInstance(self, opt)

    -- 私有构造
    local function new(self, opt)
        opt = opt or {}

        self.__index = self
        setmetatable(opt, self)
        return opt
    end

    -- 如果已经实例化过 不返回一个实例
    if single.isNew then
        return nil
    else
        single.isNew = true
        return new(self, opt)
    end
end

function single:getIsNew()
    print(self.isNew)
end




-- local s = single:getInstance()
-- print(s:getIsNew())
-- local s1 = single:getInstance()
-- print(s1:getIsNew())
local win = single:getInstance()
-- print(win:getIsNew())
local win2 = single:getInstance()
if not win2 then
    print("win2 isnt instance")
end


