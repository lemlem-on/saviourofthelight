-----------------------------------------------------
--        Saviour of the Light
--     Main program - by Izu/Lemon
-----------------------------------------------------

-- shorten calls
q = love
lg = love.graphics

-- add modules
Gamestate = require "libs.gamestate"
cartographer = require 'libs.cartographer'

-- add support files
require "loader/gfxres"
require "states/statelist"
require "states/logoscene"
require "states/transitions"
require "states/levelone"
require "states/hudScript"
require "player/player"

function q.load()
    -- debug banner
    print( "------------------------------" )
    print( " Saviour of the Light started" )
    print( "          game by izu" )
    print( "------------------------------" )
    print( "this is a debug window" )
    -- set filter
    lg.setDefaultFilter('nearest', 'nearest')
    -- set canvas
    canvas = lg.newCanvas( 256, 256 ) 
    -- load image resources
    loadBasicRes()
    loadPlayerRes()
end

function q.update( dt )
    
end

function q.draw( dt )
    --draw to canvas
    lg.setCanvas( canvas )
        lg.clear( 0, 0, 0, 0 )
        lg.setBlendMode( "alpha" )
        callStateManager( dt )
		
    lg.setCanvas()  
    -- draw actual canvas 
    lg.setBlendMode( "alpha", "premultiplied" )
    lg.draw( canvas, 0, 0, 0, 3, 3 )
end


function enum(names, offset)
	offset=offset or 1
	local objects = {}
	local size=0
	for idr,name in pairs(names) do
		local id = idr + offset - 1
		local obj = {
			id=id,       -- id
			idr=idr,     -- 1-based relative id, without offset being added
			name=name    -- name of the object
		}
		objects[name] = obj
		objects[id] = obj
		size=size+1
	end
	objects.idstart = offset        -- start of the id range being used
	objects.idend = offset+size-1   -- end of the id range being used
	objects.size=size
	objects.all = function()
		local list = {}
		for _,name in pairs(names) do
			add(list,objects[name])
		end
		local i=0
		return function() i=i+1 if i<=#list then return list[i] end end
	end
	return objects
end
