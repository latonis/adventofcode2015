Node = {adjacent = {}}

function Node:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return or
end

function Node:addedge(Node, Node)
    print("connect the nodes pls")
end
