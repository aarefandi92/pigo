scores = Core.class(Sprite)

local world

function scores:initScores()
	score = 0
	scoreText = TextField.new(nil, "Score: " .. score)
	scoreText:setPosition(10,10)
	stage:addChild(scoreText)
	hiScoreText = TextField.new(nil, "Hi Score: " .. hiScore)
	hiScoreText:setPosition(200,10)
	stage:addChild(hiScoreText)
end

-- Update all scores
function scores:scoresUpdate()
	score = score + 1
	scoreText:setText("Score: " .. score)
	if score > hiScore then
		hiScore = score
		hiScoreText:setText("Hi Score: " .. hiScore)	
	end
end

function scores:setWorld(worldRef)
	world = worldRef
end