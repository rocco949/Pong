-- require the push library
push = require 'push'

-- Window width and height constants
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

ballx = VIRTUAL_WIDTH / 2
bally = VIRTUAL_HEIGHT / 2
balldx = 0
balldy = 0
gameState = "start"

function love.load()
	-- Fonts being used
	smallFont = love.graphics.newFont('font.ttf', 8)
	xsmallFont = love.graphics.newFont('font.ttf', 8)
	scoreFont = love.graphics.newFont('font.ttf', 32)

	love.graphics.setDefaultFilter('nearest', 'nearest')
	love.graphics.setFont(smallFont)

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT , WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false
	})

	math.randomseed(os.time())
	balldx = math.random(2) == 1 and -100 or 100
	balldy = math.random(-50, 50)

end

function love.update(dt)
	if gameState == "play" then
		ballx = ballx + balldx * dt
		bally = bally + balldy * dt
	end


end

function love.keypressed(key) 
	if key == 'escape' then
		love.event.quit()
	end
	if gameState == 'start' then
		if key == 'enter' or key == "return" then
			gameState = 'play'
		end
end
end


function love.draw()
	push:start()
		if gameState == 'start' then
			
			love.graphics.setFont(smallFont)
			love.graphics.printf("Hello Start State (Press Enter)", 
			0,
			20, 
			VIRTUAL_WIDTH, 
			'center')
		end

		if gameState == 'play' then
			love.graphics.setFont(smallFont)
			love.graphics.printf("Hello Play State", 
			0,
			20, 
			VIRTUAL_WIDTH, 
			'center')

			--love.graphics.setFont(xsmallFont)
			love.graphics.printf("Restart: r", -10, -10, VIRTUAL_WIDTH, right)
		end

		-- ball
		love.graphics.rectangle('fill', ballx, bally, 4, 4)

	push:finish()
end