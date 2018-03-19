--Title: TouchAndDrag
-- Name: Sasha Malko
-- Course: ICS2O/3C
-- This program displays images that can be dragged around on the screen.

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--local variables 
local backgroundImage = display.newImageRect("Images/maxresdefault.jpg", 2048, 1536)
local pinkGirl = display.newImageRect("Images/Girl1.png", 150, 150)
local pinkGirlWidth = pinkGirl.Width
local pinkGirlHeight = pinkGirl.height

local blueGirl = display.newImageRect("Images/Girl2.png", 150, 150)
local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.height

--my boolean variables to keep track of which object i touched first
local alreadyTouchedPinkGirl = false
local alreadyTouchedBlueGirl = false

--create local variables for sound
local funkyElement = audio.loadSound("Sounds/funkyelement.mp3")
local funkyElementChannel

--play the background music
funkyElementChannel = audio.play (funkyElement)
--set the initial x and y position of myImage
pinkGirl.x = 400
pinkGirl.y = 500

blueGirl.x = 300
blueGirl.y = 200

--Function: BlueGirlListener
--Input: touch listener
--Output: none
--Description: when blue girl is touched, move her
local function BlueGirlListener(touch)

	if(touch.phase == "began") then 
		if (alreadyTouchedPinkGirl == false) then
			alreadyTouchedBlueGirl = true
		end
	end

	if ((touch.phase == "moved") and (alreadyTouchedBlueGirl == true)) then
		blueGirl.x = touch.x
		blueGirl.y = touch.y
	end 

	if (touch.phase == "ended") then
	alreadyTouchedBlueGirl = false
	alreadyTouchedPinkGirl = false
end
end

--add the respective listeners to each project
blueGirl: addEventListener("touch", BlueGirlListener)

--Function: PinkGirlListener
--Input: touch listener
--Output: none
--Description: when pink girl is touched, move her
local function PinkGirlListener(touch)

	if(touch.phase == "began") then 
		if (alreadyTouchedBlueGirl == false) then
			alreadyTouchedPinkGirl = true
		end
	end

	if ((touch.phase == "moved") and (alreadyTouchedPinkGirl == true)) then
		pinkGirl.x = touch.x
		pinkGirl.y = touch.y
	end 

	if (touch.phase == "ended") then
	alreadyTouchedPinkGirl = false
	alreadyTouchedBlueGirl = false
end
end

--add the respective listeners to each project
pinkGirl: addEventListener("touch", PinkGirlListener)