local helpers = {}

function tablelength(tbl)
    local idx = 0
        for _, _ in pairs(tbl) do
            idx = idx + 1
        end
    return idx
end

function stringsep(string, n)
    local tbl = {}
    for i = 1, #string, n do
        table.insert(tbl, string:sub(i, i+n-1))
    end
    return tbl
end

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

function itos(innum)
    return tostring(innum)
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

function tableinstances(tbl)
    local t = {}
    for key, val in pairs(tbl) do
        t[val] = (t[val] or 0) + 1
    end
    return t
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

function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end