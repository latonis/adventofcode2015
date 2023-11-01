package.path = package.path .. ";../helpers/?.lua"
require('helpers')

local function addlocation(tbl, x, y)
    tbl[itos(x) .. "+" .. itos(y)] = true
end

local function detlocation(c, entry)
    if c == '^' then
        entry.y = entry.y + 1
    elseif c == "v" then
        entry.y = entry.y - 1
    elseif c == ">" then
        entry.x = entry.x + 1
    elseif c == "<" then
        entry.x = entry.x - 1
    end
end

local function solveFirst(input)
    -- do things here to solve problem
    local santa = {x = 0, y = 0}
    local locations = {}
    addlocation(locations, santa.x, santa.y)
    for idx, line in pairs(input) do
        for c in line:gmatch"." do
            detlocation(c, santa)
            addlocation(locations, santa.x, santa.y)
        end
    end

    print("Unique locations for presents: ", tablelength(locations))
    -- do things above here to solve the problem
end

local function solveSecond(input)
    -- do things here to solve problem
    local santa = {x = 0, y = 0}
    local robosanta = {x = 0, y = 0}
    local houses = {}
    santa_instructions = ""
    for idx, line in pairs(input) do
        pos = 1
        for c in line:gmatch"." do
            if pos % 2 == 0 then
                detlocation(c, robosanta)
                addlocation(houses, robosanta.x, robosanta.y)
            elseif pos % 2 == 1 then
                detlocation(c, santa)
                addlocation(houses, santa.x, santa.y)
            end
            pos = pos + 1
        end
    end
    print("Unique locations for presents with two santas: ", tablelength(houses))

    -- do things above here to solve the problem
end

local input = getInput("./input")
solveFirst(input)
solveSecond(input)
