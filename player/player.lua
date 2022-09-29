-- player script

areControlsActive = false
rightWasPressed = true
leftWasPressed = false

playerX = 20
playerY = 161

playerIdleAnimationTimer = 0
playerIdleAnimationState = 0
playerIdleAnimationSpeed = 5

doAnimationDown = true

playerIsColliding = false
playerSpeed = 0
playerMomentum = 0

function spawnPlayer( dt ) 
    if rightWasPressed == true then
        if playerIdleAnimationState == 0 then
            lg.draw( playerIdle0, playerX, playerY )
        end
        if playerIdleAnimationState == 1 then
            lg.draw( playerIdle1, playerX, playerY )
        end
        if playerIdleAnimationState >= 2 then
            lg.draw( playerIdle2, playerX, playerY )
        end
    end

    if leftWasPressed == true then
        if playerIdleAnimationState == 0 then
            lg.draw( playerIdle0, playerX + 27, playerY, 0, -1, 1 )
        end
        if playerIdleAnimationState == 1 then
            lg.draw( playerIdle1, playerX + 27, playerY, 0, -1, 1 )
        end
        if playerIdleAnimationState >= 2 then
            lg.draw( playerIdle2, playerX + 27, playerY, 0, -1, 1 )
        end
    end

    if doAnimationDown == true then
        playerIdleAnimationTimer = playerIdleAnimationTimer + playerIdleAnimationSpeed

        if playerIdleAnimationTimer > 30 then
            playerIdleAnimationState = playerIdleAnimationState + 1
            playerIdleAnimationTimer = 0
        end

        if playerIdleAnimationState > 2 then
            doAnimationDown = false
        end
    end

    if doAnimationDown == false then
        playerIdleAnimationTimer = playerIdleAnimationTimer + playerIdleAnimationSpeed

        if playerIdleAnimationTimer > 30 then
            playerIdleAnimationState = playerIdleAnimationState - 1
            playerIdleAnimationTimer = 0
        end

        if playerIdleAnimationState < 1 then
            doAnimationDown = true
        end
    end

    if playerY > 270 then
        playerY = 20
        --playerX = 20
    end
    executePlayerGravity( dt )
    executePlayerMovement( dt )
end

function executePlayerGravity( dt )
    if playerIsColliding == false then
        playerY = playerY + playerSpeed
        if playerSpeed < 8 then
            playerSpeed = playerSpeed + 0.5
        end
    end
    if checkPlayerCollision(playerX, playerY, 20, 32, firstFloorPieceX, firstFloorPieceY, firstFloorPieceWidth, firstFloorPieceHeight) == true then
        playerIsColliding = true
    end
    if checkPlayerCollision(playerX, playerY, 20, 32, firstFloorPieceX, firstFloorPieceY, firstFloorPieceWidth, firstFloorPieceHeight) == false then
        playerIsColliding = false
    end
    
    if playerIsColliding == true then
        playerSpeed = 0

    end
end

function executePlayerMovement( dt )

    areControlsActive = false
    if love.keyboard.isDown( 'd' ) then
        leftWasPressed = false
        rightWasPressed = true
        areControlsActive = true
        print( "playerMomentum: " .. playerMomentum )
        
        if playerMomentum < 3 then
            playerMomentum = playerMomentum + 0.3
        end

        if playerIdleAnimationSpeed < 15 then
            playerIdleAnimationSpeed = playerIdleAnimationSpeed + 1
        end
    end
    
    if areControlsActive == false and rightWasPressed == true then
        if playerMomentum > 0 then
            playerMomentum = playerMomentum - 0.2
        end

        if playerMomentum < 0 then
            playerMomentum = 0
        end
    end

    if love.keyboard.isDown( 'a' ) then
        leftWasPressed = true
        rightWasPressed = false
        areControlsActive = true
        print( "playerMomentum: " .. playerMomentum )
        
        if playerMomentum > -3 then
            playerMomentum = playerMomentum - 0.3
        end

        if playerIdleAnimationSpeed < 15 then
            playerIdleAnimationSpeed = playerIdleAnimationSpeed + 1
        end
    end

    if areControlsActive == false and leftWasPressed == true then
        if playerMomentum < 0 then
            playerMomentum = playerMomentum + 0.2
        end

        if playerMomentum > 0 then
            playerMomentum = 0
        end
    end

    if areControlsActive == false then
        playerIdleAnimationSpeed = 1
    end

    playerX = playerX + playerMomentum
end

function checkPlayerCollision( playerFunctionX, playerFunctionY, playerFunctionW, playerFunctionH, objectFunctionX, objectFunctionY, objectFunctionW, objectFunctionH )
    return playerFunctionX < objectFunctionX + objectFunctionW and
           objectFunctionX < playerFunctionX + playerFunctionW and
           playerFunctionY < objectFunctionY + objectFunctionH and
           objectFunctionY < playerFunctionY + playerFunctionH
end