-- transitions

transitionPiece1PosX = 0
transitionPiece1PosY = 0

transitionPiece2PosX = 128
transitionPiece2PosY = 0

transitionSpeed = 0

doTransition = true

function spawnTransitionOpen()
    if doTransition then
        lg.draw(transition, transitionPiece1PosX, transitionPiece1PosY)
        lg.draw(transition, transitionPiece2PosX, transitionPiece2PosY)
        transitionPiece1PosX = transitionPiece1PosX - transitionSpeed
        transitionPiece2PosX = transitionPiece2PosX + transitionSpeed
        
        transitionSpeed = transitionSpeed + 1

        if transitionSpeed > 40 then doTransition = false end
        print( "Current transition speed:" .. transitionSpeed )
    end

    if transitionSpeed == 40 then
        print( "Transition ended" )
    end
end

function resetTransitionValues()
    transitionPiece1PosX = 0
    transitionPiece1PosY = 0
    transitionPiece2PosX = 128
    transitionPiece2PosY = 0
    transitionSpeed = 0
    doTransition = true
end