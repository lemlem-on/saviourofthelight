-- hud behavior

hudClockTime = 0
hudClockSeconds = 0
hudClockMinutes = 0

hudClockRightNumber0Y = 9
hudClockRightNumber1Y = 9
hudClockRightNumber2Y = 9
hudClockRightNumber3Y = 9
hudClockRightNumber4Y = 9
hudClockRightNumber5Y = 9
hudClockRightNumber6Y = 9
hudClockRightNumber7Y = 9
hudClockRightNumber8Y = 9
hudClockRightNumber9Y = 9

hudClockLeftNumber0Y = 9
hudClockLeftNumber1Y = 9
hudClockLeftNumber2Y = 9
hudClockLeftNumber3Y = 9
hudClockLeftNumber4Y = 9
hudClockLeftNumber5Y = 9
hudClockLeftNumber6Y = 9
hudClockLeftNumber7Y = 9
hudClockLeftNumber8Y = 9
hudClockLeftNumber9Y = 9

hudClockNumberOffset = 0
hudClockNumberSpeed = 0

function drawHud( dt )
    lg.draw( hud, 0, 0 )
    hudClock( dt )
    drawHudClock( dt )
end

function hudClock( dt )
    if hudClockTime >= 60 then
        hudClockTime = 0
        hudClockSeconds = hudClockSeconds + 1
        print( "current hud clock: " .. hudClockMinutes .. " minutes " .. hudClockSeconds .. " seconds" )
    end
    hudClockTime = hudClockTime + 1

    if hudClockSeconds >= 60 then
        hudClockSeconds = 0
        hudClockMinutes = hudClockMinutes + 1
        
    end
end

function drawHudClock( dt )
    -- left row of digits
    lg.draw( hudNumber5, 86, hudClockLeftNumber0Y )
    lg.draw( hudNumber5, 86, hudClockLeftNumber1Y )
    lg.draw( hudNumber5, 86, hudClockLeftNumber2Y )
    lg.draw( hudNumber5, 86, hudClockLeftNumber3Y )
    lg.draw( hudNumber5, 86, hudClockLeftNumber4Y )
    lg.draw( hudNumber5, 86, hudClockLeftNumber5Y )
    lg.draw( hudNumber5, 86, hudClockLeftNumber6Y )
    lg.draw( hudNumber5, 86, hudClockLeftNumber7Y )
    lg.draw( hudNumber5, 86, hudClockLeftNumber8Y )
    lg.draw( hudNumber5, 86, hudClockLeftNumber9Y )

    -- right row of digits
    lg.draw( hudNumber0, 86 + 9, hudClockRightNumber0Y )
    lg.draw( hudNumber1, 86 + 9, hudClockRightNumber1Y )
    lg.draw( hudNumber2, 86 + 9, hudClockRightNumber2Y )
    lg.draw( hudNumber3, 86 + 9, hudClockRightNumber3Y )
    lg.draw( hudNumber4, 86 + 9, hudClockRightNumber4Y )
    lg.draw( hudNumber5, 86 + 9, hudClockRightNumber5Y )
    lg.draw( hudNumber6, 86 + 9, hudClockRightNumber6Y )
    lg.draw( hudNumber7, 86 + 9, hudClockRightNumber7Y )
    lg.draw( hudNumber8, 86 + 9, hudClockRightNumber8Y )
    lg.draw( hudNumber9, 86 + 9, hudClockRightNumber9Y )
    
    if hudClockMinutes == 1 and hudClockSeconds < 2 then
        hudClockRightNumber9Y = hudClockRightNumber9Y - hudClockNumberOffset - hudClockNumberSpeed
        hudClockNumberOffset = hudClockNumberOffset + 0.5
        hudClockNumberSpeed = hudClockNumberSpeed + 0.5
        print("hud number position: " .. hudClockRightNumber9Y)
        if hudClockMinutes == 1 and hudClockSeconds == 1 then
            hudClockNumberOffset = 0
            hudClockNumberSpeed = 0
        end
    end

    if hudClockMinutes == 2 and hudClockSeconds < 2 then
        hudClockRightNumber8Y = hudClockRightNumber8Y - hudClockNumberOffset - hudClockNumberSpeed
        hudClockNumberOffset = hudClockNumberOffset + 0.5
        hudClockNumberSpeed = hudClockNumberSpeed + 0.5
        print("hud number position: " .. hudClockRightNumber8Y)
        if hudClockSeconds == 2 then
            hudClockNumberOffset = 0
            hudClockNumberSpeed = 0
        end
    end
end
