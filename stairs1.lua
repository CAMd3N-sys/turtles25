local function refuel()
    if turtle.getFuelLevel() < 64 then
        for i=1,16 do
            turtle.select(i)
            if turtle.refuel(1) then
                return true
            end
        end
        error("Out of fuel")
    end
    return true
end

local function selectBlock(name)
    for i=1,16 do
        turtle.select(i)
        local data = turtle.getItemDetail()
        if data and data.name:find(name:lower()) then
            return true
        end
    end
    error("No "..name.." blocks found")
end

local function turnAround()
    turtle.turnLeft()
    turtle.turnLeft()
end

function buildStairs(stairs)
    for i=1,stairs do
        refuel()
        selectBlock("stairs")
        
        -- Move forward and place below
        turtle.forward()
        turtle.placeDown()
        
        -- Move up for next step
        turtle.up()
        
        -- Turn spiral direction every 4 steps
        if i % 4 == 0 then
            turtle.turnLeft()
        end
    end
    turnAround()
end 
