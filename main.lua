--Title: TouchAndDrag
-- Name: Sasha Malko
-- Course: ICS2O/3C
-- This program displays images that can be dragged around on the screen.

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--local variables. 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local pinkGirl = display.newImageRect("Images/Girl1.png", 150, 150)
local pinkGirlWidth = pinkGirl.Width
local pinkGirlHeight = pinkGirl.height

local blueGirl = display.newImageRect("Images/Girl2.png", 150, 150)
local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.height

--my boolean variables to keep track of which object i touched first
local alreadyTouchedPinkGirl = false
local alreadyTouchedBlueGirl = false

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