local function split (inputstr, sep)
    if sep == nil then
       sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
       table.insert(t, str)
    end
    return t
 end

 local function getInput(fileName)
    local fileIn = io.open(fileName)

    -- check if file was read successfully
    if (fileIn == nil)
    then
        return
    end

    -- this has state, so can't use twice for each problem 
    local lines = fileIn:lines()
    local count = 1
    local returnLines = {}

    -- i want a stateless iterator, theres probably a better way to do this but it works
    for line in lines do
        returnLines[count] = line
        count = count + 1
    end

    return returnLines
end

function Set(str)
    local s = {}
    for char in str:gmatch"." do s[char] = true end
    return s
end

function IsUpper(char)
    return string.match(char, '%u')
end

local function solveFirst(input)
    -- do things here to solve problem
    local total_count = 0
    for idx, line in pairs(input) do
        for op in line:gmatch"." do
            if op == "(" then
                total_count = total_count + 1
            elseif op == ")" then
                total_count = total_count - 1
            end
        end
    end
    print("The floor value is: ", total_count)
    -- do things above here to solve the problem
end

local function solveSecond(input)
    local total_count = 0

    -- do things here to solve problem
    for idx, line in pairs(input) do
        idx_op = 0
        for op in line:gmatch"." do
            idx_op = idx_op + 1
            if op == "(" then
                total_count = total_count + 1
            elseif op == ")" then
                total_count = total_count - 1
            end

            if total_count == -1 then
                print("The position for the basement is: ", idx_op)
                return
            end
        end
    end
    -- do things above here to solve the problem
end

local input = getInput("./input")
solveFirst(input)
solveSecond(input)
