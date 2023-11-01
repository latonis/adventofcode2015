package.path = package.path .. ";../helpers/?.lua"
require('helpers')

local function solveFirst(input)
    -- do things here to solve problem
    for idx, line in pairs(input) do
        print(line)
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
solveSecond(input)
