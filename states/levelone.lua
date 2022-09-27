-- first level script

levelInitTimer = 0
enroque = -256

-- load map
levelOne = cartographer.load 'levels/levelOne/levelOne.lua'

function initLevelOne()
    lg.push()
    love.graphics.translate(0, -256)
    levelOne:draw()
    lg.pop()
    spawnTransitionOpen()
    levelInitTimer = levelInitTimer + 1
    print( "current level init timer:" .. levelInitTimer )
    drawHud( dt )
    spawnPlayer( dt, 60, 158 )
    if levelInitTimer == 50 then
        resetTransitionValues()
        levelInitTimer = 0
        print( "level finished initializing" )
        levelIntroTimer = 0
        loadProcedureFinished = true
    end
end


function renderLevelOne()
    lg.push()
    love.graphics.translate(0, enroque)
    levelOne:draw()
    lg.pop()
    --levelOne:getTileProperty(1, "Solid")
    levelOne:setTileProperty (1, "SolidUp", 0)

    --enroque = enroque + 1
end

-- level collisions

firstFloorPieceWidth = 144
firstFloorPieceHeight = 64
firstFloorPieceX = 0
firstFloorPieceY = 192