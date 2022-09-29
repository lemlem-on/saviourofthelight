---------------------------------------
--    first game state (logos)
---------------------------------------

function drawLogoScene( dt )
    logoSpawnTimer = logoSpawnTimer + 1

    if logoSpawnTimer > 100 then
        --lg.draw( titleBackground, 0, 0 )
        lg.draw( playerSprite, 100, 100 )
        spawnTransitionOpen()
    end
end