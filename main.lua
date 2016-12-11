local facebookAnalytics = require "plugin.facebookAnalytics"
facebookAnalytics.init()
--facebookAnalytics.debug()
math.randomseed( os.time() )
local udid = ""
if system.getPreference( "app", "udid", "string" ) and system.getPreference( "app", "udid", "string" ) ~= "udid" then
        udid = system.getPreference( "app", "udid", "string" )
else
        for i=1,20 do
                local tempNum = math.floor( math.random()*10 ) -- 0-9
                udid = udid..i
        end
        system.setPreferences( "app", {udid= udid} )
end
facebookAnalytics.setUserID(udid)

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
local eventLog3
eventLog3 = widget.newButton( {
        x = display.contentCenterX,
        y = display.contentCenterY+140,
        labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
        id = "log3",
        label = "Set User Properties",
        onEvent = function ( e )
                if (e.phase == "ended") then
                        facebookAnalytics.setUserProperties({gender = "f"--[[f == female, m = male]], shoeSize = 9})
                end
        end
} )