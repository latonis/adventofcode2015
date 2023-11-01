local helpers = {}

function split(inputstr, sep)
    if sep == nil then
       sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
       table.insert(t, str)
    end
    return t
 end

function stoi(instr)
    return tonumber(instr)
end

function min(x, y)
    if x < y then
        return x
    end
    
    return y
end

function max(x,y)
    if x > y then
        return x
    end

    return y
end

function getInput(fileName)
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

function map(in_table, f)
    local t = {}
    for idx, x in pairs(in_table) do
        t[idx] = f(x)
    end
    return t
end

function IsUpper(char)
    return string.match(char, '%u')
end