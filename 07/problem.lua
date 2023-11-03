package.path = package.path .. ";../helpers/?.lua"
require('helpers')

local function parseinstr(input, emu)
    print(input)
    local left, right = table.unpack(split(input, "->"))
    right = trim(right)
    
    local op_split = split(left)
    local len_left = #op_split

    if len_left == 1 then
        emu[right] = tonumber(trim(op_split[1]))
    elseif len_left == 2 then
        op = trim(op_split[1])
        if op == "NOT" then
            emu[right] = ~(emu[trim(op_split[2])] or 0)
        end
    elseif len_left == 3 then
        op = trim(op_split[2])
        var1 = trim(op_split[1])
        var2 = trim(op_split[3])
        if op == "AND" then
            emu[right] = (emu[var1] or 0) & (emu[var2] or 0)
        elseif op == "OR" then
            emu[right] = (emu[var1] or 0) | (emu[var2] or 0)
        elseif op == "LSHIFT" then
            emu[right] = (emu[var1] or 0) << tonumber(var2)
        elseif op == "RSHIFT" then 
            emu[right] = (emu[var1] or 0) >> tonumber(var2)
        else
            print("Unknown operator: " .. op)
        end
    end
end

local function solveFirst(input)
    -- do things here to solve problem
    local emu = {}



    for idx, line in pairs(input) do
        parseinstr(line, emu)
    end

    for idx, val in pairs(emu) do
        if (val < 0) then
            val = val + 65535 + 1
        end
        print(idx, val)
    end
    -- do things above here to solve the problem
end

local function solveSecond(input)
    -- do things here to solve problem
    for idx, line in pairs(input) do
        print(line)
    end
    -- do things above here to solve the problem
end

local input = getInput("./input")
solveFirst(input)
-- solveSecond(input)
