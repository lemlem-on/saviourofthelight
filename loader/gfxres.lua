---------------------------------------
--       gfx res include file
---------------------------------------

function loadBasicRes()
    -- basic resources, such as icons, titles, logos...
    canvasTest = lg.newImage( "images/canvasTest.png" )
    logo = lg.newImage( "images/icon.png" )
    title = lg.newImage( "images/hud/title.png" )
    titleBackground = lg.newImage( "images/hud/titleBackground.png" )
    transition = lg.newImage( "images/hud/transition.png" )
    hud = lg.newImage( "images/hud/hud.png" )
    levelIntro = lg.newImage( "levels/intro/levelIntro.png" )

    -- hud numbers
    hudNumber0 = lg.newImage( "images/hud/numbers/0.png" )
    hudNumber1 = lg.newImage( "images/hud/numbers/1.png" )
    hudNumber2 = lg.newImage( "images/hud/numbers/2.png" )
    hudNumber3 = lg.newImage( "images/hud/numbers/3.png" )
    hudNumber4 = lg.newImage( "images/hud/numbers/4.png" )
    hudNumber5 = lg.newImage( "images/hud/numbers/5.png" )
    hudNumber6 = lg.newImage( "images/hud/numbers/6.png" )
    hudNumber7 = lg.newImage( "images/hud/numbers/7.png" )
    hudNumber8 = lg.newImage( "images/hud/numbers/8.png" )
    hudNumber9 = lg.newImage( "images/hud/numbers/9.png" )
end

function loadPlayerRes()
    -- player sprites, effects and such
    playerIdle0 = lg.newImage( "images/sprites/player0.png" )
    playerIdle1 = lg.newImage( "images/sprites/player1.png" )
    playerIdle2 = lg.newImage( "images/sprites/player2.png" )
end