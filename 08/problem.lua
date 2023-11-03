package.path = package.path .. ";../helpers/?.lua"
require('helpers')


local function countcoderepresentation(string)
    return (#string)
end

local function fromhex(s)
    return string.char(tonumber(s, 16))
end

local function countstringrepresentation(string)
    string = replace(string, "\"(.*)\"", "%1")
    string = replace(string, "\\\"", "\"")
    string = replace(string, "\\\\", "\\")
    string = string:gsub("\\x([A-Fa-f0-9][A-Fa-f0-9])", fromhex)
    return (#string)
end

local function solveFirst(input)
    -- do things here to solve problem
    local totalcoderep = 0
    local totalstringrep = 0
    for idx, line in pairs(input) do
        totalcoderep = totalcoderep + countcoderepresentation(line)
        totalstringrep = totalstringrep + countstringrepresentation(line)
    end

    print("Total character difference: " .. totalcoderep - totalstringrep)
    -- do things above here to solve the problem
end

local function encodecoderep(string)
    string = replace(string, "\\", "\\\\")
    string = replace(string, "\"", "\\\"")
    string = "\"" .. string .. "\""
    return #string
end

local function solveSecond(input)
    -- do things here to solve problem
    local newrepcount = 0
    local oldrepcount = 0
    for idx, line in pairs(input) do
        newrepcount = newrepcount + encodecoderep(line)
        oldrepcount = oldrepcount + countcoderepresentation(line)
    end
    print("Total character difference for new code rep: " .. newrepcount - oldrepcount)
    -- do things above here to solve the problem
end

local input = getInput("./input")
solveFirst(input)
solveSecond(input)
