local facebookAnalytics = require "plugin.facebookAnalytics"
facebookAnalytics.init()
--facebookAnalytics.debug()


local widget = require("widget")

local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
bg:setFillColor( 0,0,.2 )

local titleFacebook = display.newImage( "facebook.jpeg" )
titleFacebook.width, titleFacebook.height = 300, 168
titleFacebook.x, titleFacebook.y = display.contentCenterX, 168*.5

local eventLog1
eventLog1 = widget.newButton( {
        x = display.contentCenterX,
        y = display.contentCenterY,
        id = "log1",
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        label = "logEvent Hello",
        onEvent = function ( e )
                if (e.phase == "ended") then
                        facebookAnalytics.logEvent("Hello")
                end
        end
} )
local eventLog2
eventLog2 = widget.newButton( {
        x = display.contentCenterX,
        y = display.contentCenterY+70,
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        id = "log2",
        label = "Log Purchase",
        onEvent = function ( e )
                if (e.phase == "ended") then
                        facebookAnalytics.logPurchase(4.38,"USD")
                end
        end
} )
eventLog2:setFillColor(1)
