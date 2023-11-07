package.path = package.path .. ";../helpers/?.lua"
require('helpers')




local function solveFirst(input)
    -- do things here to solve problem
    local count = 40
    local string_builder = ""
    for idx, line in pairs(input) do
        local char_count = 1
        for times = 1, count do 
            string_builder = ""
            for i = 1, #line do
                if (line:sub(i,i) == line:sub(i+1,i+1)) then
                    char_count = char_count + 1
                else
                    string_builder = string_builder .. char_count .. line:sub(i,i)
                    char_count = 1
                end
            end
            line = string_builder
        end
        print("Length of final result: " .. #string_builder)
    end
    -- do things above here to solve the problem
end

local function solveSecond(input)
    local count = 50
    local string_builder = ""
    for idx, line in pairs(input) do
        local char_count = 1
        for times = 1, count do 
            string_builder = ""
            for i = 1, #line do
                if (line:sub(i,i) == line:sub(i+1,i+1)) then
                    char_count = char_count + 1
                else
                    string_builder = string_builder .. char_count .. line:sub(i,i)
                    char_count = 1
                end
            end
            line = string_builder
        end
        print("Length of final result: " .. #string_builder)
    end
end

local input = getInput("./input")
solveFirst(input)
solveSecond(input)
