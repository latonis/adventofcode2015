package.path = package.path .. ";../helpers/?.lua"
require('helpers')

function countvowels(string)
    local count = 0
    vowels = {"a", "e", "i", "o", "u"}
    for c in string:gmatch"." do
        for idx, vowel in pairs(vowels) do
            if c == vowel then
                count = count + 1
            end
        end
    end

    return count
end

function doubleletter(string)
    for i = 1, #string - 1 do
        if string:sub(i,i) == string:sub(i+1, i+1) then
            return true
        end
    end
    return false
end

function checkstring(string)
    badstrings = {"ab", "cd", "pq", "xy"}
    for idx, val in pairs(badstrings) do
        if string.find(string, val) then
            return false
        end
    end

    if countvowels(string) < 3 then
        return false
    end

    if not doubleletter(string) then
        return false
    end

    return true
end

local function solveFirst(input)
    -- do things here to solve problem
    nice = 0
    for idx, line in pairs(input) do
        if checkstring(line) then
            nice = nice + 1
        end
    end

    print("Total nice strings: ", nice)
    -- do things above here to solve the problem
end

function doubleletterspace(string)
    for i = 1, #string do
        if string:sub(i,i) == string:sub(i+2, i+2) then
            return true
        end
    end
    return false
end

function doublerepeat(string)
    local n = 2
    for i = 1, #string do
        current = string:sub(i,i+n-1)
        for j = i + n, #string do
            next_sub = string:sub(j, j+n-1)
            if current == next_sub then
                return true
            end
        end
    end
    return false
end

local function solveSecond(input)
    -- do things here to solve problem
    nice = 0
    for idx, line in pairs(input) do
        if doubleletterspace(line) then
            if doublerepeat(line) then
                nice = nice + 1
            end
        end
    end
    print("Total nicer strings: ", nice)
    -- do things above here to solve the problem
end

local input = getInput("./input")
solveFirst(input)
solveSecond(input)
