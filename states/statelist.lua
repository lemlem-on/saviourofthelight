---------------------------------------
--      list of game states
---------------------------------------

currentState = 5
loadProcedureFinished = false
levelIntroTimer = 0

-- 0 - logo scene
-- 1 - title screen
-- 2 - menu (from title)
-- 3 - menu (in game)
-- 4 - first cinematic (intro)
-- 5 - first level

function callStateManager( dt )

    if currentState == 0 then
        drawLogoScene()
    end

    if currentState == 5 then
        if loadProcedureFinished == false then
            if levelIntroTimer < 100 then
                lg.draw( levelIntro, 100, 100 )
                lg.draw( hudNumber1, 100 + 16, 100 + 32 )
            end
            levelIntroTimer = levelIntroTimer + 1

            if levelIntroTimer > 120 then
                initLevelOne()
            end
        end
        if loadProcedureFinished == true then
            renderLevelOne()
            spawnPlayer( dt )
            drawHud( dt )
            
            -- check cols for this level
            
        end
    end
end