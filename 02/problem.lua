package.path = package.path .. ";../helpers/?.lua"
require('helpers')

local function solveFirst(input)
    -- do things here to solve problem
    total_area = 0
    for idx, line in pairs(input) do
        entry = split(line, "x")
        if #entry ~= 3 then
            print("Error parsing input!")
        end
        l = entry[1]
        w = entry[2]
        h = entry[3]
        
        small_side = min(min(l*w,w*h), h*l)
        surface_area = (2*l*w + 2*w*h + 2*h*l) + small_side
        total_area = surface_area + total_area
    end
    print("Total surface area for wrapping paper: ", total_area)
    -- do things above here to solve the problem
end

local function solveSecond(input)
    -- do things here to solve problem
    ribbon_total = 0
    for idx, line in pairs(input) do
        entry = split(line, "x")
        if #entry ~= 3 then
            print("Error parsing input!")
        end

        i_entry = map(entry, stoi)
        l = i_entry[1]
        w = i_entry[2]
        h = i_entry[3]

        table.sort(i_entry)
        
        min_1 = i_entry[1]
        min_2 = i_entry[2]

        ribbon_total = ribbon_total + (min_1 * 2 + min_2*2 + (l*w*h))
    end
    print("Total amount of ribbon needed: ", ribbon_total)
    -- do things above here to solve the problem
end

local input = getInput("./input")
solveFirst(input)
solveSecond(input)
