--[[
    1.有table a，b，将其合并并生成c数组
    2.有table a，把它所有的key串起来变成一个新的字符串。
    3.有table a，b，将a b里面都不存在的元素找出来，并生成c数组。
--]]


-- 1.有table a，b，将其合并并生成c数组

function copyTab(a,b)
    for k,v in pairs(a) do 
        if type(v) ~= "table" then
            table.insert(b,v)
        else
            table.insert(b,{})
            copyTab(v,b[#b])
        end
    end
end

do  --  1
    local a = {}
    local b = {}
    local c = {}
    copyTab(a,c)
    copyTab(b,c)
end


--  2.有table a，把它所有的key串起来变成一个新的字符串。
function getTableKeys(a)
    local keys = {}
    local tablesQueue = {}
    tablesQueue.count = 0
    --  把 table 放进队列
    for k,v in pairs(a) do
        if type(v) ~= "talbe" then 
            table.insert(keys, k)
        else
            table.insert(tablesQueue, v)
            tablesQueue.count = tablesQueue.count + 1
        end
    end
    --  遍历队列里面的 table
    while tablesQueue.count > 0 do
        --  pop the table of head
        local t = tablesQueue[tablesQueue.count]
        tablesQueue[tablesQueue.count] = nil
        tablesQueue.count = tablesQueue.count - 1
        --  遍历 table 获取 key
        for k,v in pairs(t) do
            if type(v) ~= "table" then
                table.insert(keys, v)
            else
                --  add table to queue
                table.insert(tablesQueue, v)
                tablesQueue.count = tablesQueue.count + 1
            end
        end
    end 
    return keys
end

do  --  2
    local t = {}
    print (table.concat(getTableKeys(t)))
end


--  3.有table a，b，将a b里面都不存在的元素找出来，并生成c数组。
do  --  3
    local a = {}
    local b = {}
    local c = {}
    local readed = {}
    local function copy(a,b)
        for k,v in pairs(a) do
            if not b[k] then 
                table.insert(c,v)
            end
        end
        for k,v in pairs(b) do
            if type(v) ~= "table" then 
                if not a[k] then 
                    table.insert(c,v)
                end
            else
                
            end
        end
    end
end


