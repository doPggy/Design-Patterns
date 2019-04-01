local context = require "context"
local strategyReturn = require "strategy_return"
local strategyOff = require "strategy_off"

-- 策略模式
-- 封装的变化点是算法的不一致,将他们封装起来，互不影响，但求得结果的目的是一致的
-- 也就是公共算法结果
-- 比如商场优惠策略是不同的，但是最后都是要求出优惠价
-- 像满100 送20 200送30 打八折 三折
-- 就可以抽象为满减，正常收费，打折三种算法
-- 这个想法很重要



-- 满200送20
local sr = strategyReturn:new({ l = 200, off = 20 })
local ctxtR = context:new({ strategy = sr })
print(ctxtR:interface(300))
print(ctxtR:interface(100))

-- 打三折
local ctxtO = context:new({ strategy = strategyOff:new({ off = 0.3 }) })
print(ctxtO:interface(300))
print(ctxtO:interface(100))

-- 这样可以看出，context只需要传入具体的策略，统一调用interface接口即可
-- 现在我需要根据一个值来切换不同的优惠策略,那么我就需要使用if-elseif-else分支进行判断
-- 如果要将这种逻辑转移，可以利用之前学习的简单工厂模式
-- 但是我不太清楚是否违背开放-封闭原则
local contextFac = require "context_factory"

-- 这样只需要一个判断值，连具体策略也进行屏蔽，做到了更深层解耦
-- 但是这样在contextfac中就需要不断地增加分支判断,仍然不够通用，依旧存在缺点
local ctxtFac = contextFac:new({ t = 2 }) -- 打折策略
print(ctxtFac:interface(400))


