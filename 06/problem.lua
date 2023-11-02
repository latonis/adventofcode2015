package.path = package.path .. ";../helpers/?.lua"
require('helpers')

local function handlecoords(start, finish)
    sx, sy = table.unpack(map(split(start, ","), tonumber))
    fx, fy = table.unpack(map(split(finish, ","), tonumber))
    return {sx+1, sy+1, fx+1, fy+1}
end

local function handleinstruction(line)
    instruction = split(line, " ")
    local op, sx, sy, fx, fy = "", 0, 0, 0, 0
    if #instruction == 4 then
        op = instruction[1]
        sx, sy, fx, fy = table.unpack(handlecoords(instruction[2], instruction[4]))
    elseif #instruction == 5 then
        op = instruction[2]
        sx, sy, fx, fy = table.unpack(handlecoords(instruction[3], instruction[5]))
    else
        print("invalid instruction on line " .. idx .. ": " .. line)
    end

    return {op, sx, sy, fx, fy}
end

local function handleop(grid, op, sx, sy, fx, fy)
    for i = sx, fx do
        for j = sy, fy do
            if op == "toggle" then
                grid[i][j] = 1 - grid[i][j]
            elseif op == "on" then
                grid[i][j] = 1
            elseif op == "off"  then
                grid[i][j] = 0
            else
                print("invalid op: " .. op)
            end
        end
    end
end

local function countlit(grid)
    local lit = 0
    for i = 1, #grid do
        for j = 1, #grid[i] do
            if grid[i][j] == 1 then
            lit = lit + 1
            end
        end
    end
    return lit
end

local function solveFirst(input)
    -- do things here to solve problem
    lightgrid = {}
    for i = 1,1000 do
        lightgrid[i] = {}
        for j = 1,1000 do
            lightgrid[i][j] = 0
        end
    end

    for idx, line in pairs(input) do
        handleop(lightgrid, table.unpack(handleinstruction(line)))
    end

    print("Number of lit lights: " .. countlit(lightgrid))
    -- do things above here to solve the problem
end

local function handleopbrightness(grid, op, sx, sy, fx, fy)
    for i = sx, fx do
        for j = sy, fy do
            if op == "toggle" then
                grid[i][j] = grid[i][j] + 2
            elseif op == "on" then
                grid[i][j] = grid[i][j] + 1
            elseif op == "off"  then
                grid[i][j] = grid[i][j] - 1
                if grid[i][j] < 0 then
                    grid[i][j] = 0
                end
            else
                print("invalid op: " .. op)
            end
        end
    end
end

local function countbrightness(grid)
    local brightness = 0
    for i = 1, #grid do
        for j = 1, #grid[i] do
            brightness = brightness + grid[i][j]
        end
    end
    return brightness
end
local function solveSecond(input)
    -- do things here to solve problem
    lightgrid = {}
    for i = 1,1000 do
        lightgrid[i] = {}
        for j = 1,1000 do
            lightgrid[i][j] = 0
        end
    end

    for idx, line in pairs(input) do
        handleopbrightness(lightgrid, table.unpack(handleinstruction(line)))
    end

    print("Total brightness of lit lights: " .. countbrightness(lightgrid))

    -- do things above here to solve the problem
end

local input = getInput("./input")
solveFirst(input)
solveSecond(input)
