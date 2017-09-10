Enemy = class()

function Enemy:init(num1, num2, num3)
    
    self.num1 = num1
    self.num2 = num2
    self.num3 = num3
    
    self.x = WIDTH / 2
    self.y = 6/5 * HEIGHT
    
    self.status = START
    self.acceleration = (ElapsedTime - time) / 30
    self.index = enemyCount
    self.touched = 0
    
end

function Enemy:draw()
    
    -- Draw the background
    rectMode(CENTER)
    noStroke()
    if self.index % 2 == 0 then
        fill(colorsetup(chooseColor, 1))
    else
        fill(colorsetup(chooseColor, 0))
    end
    rect(self.x, self.y, WIDTH, 205)
    
    -- Set up font
    font("Optima-ExtraBlack")
    fill(colorsetup(chooseColor, 2))
    if chooseColor == 4 then
        if self.index % 2 == 0 then
            fill(colorsetup(chooseColor, 0))
        else
            fill(colorsetup(chooseColor, 1))
        end
    end
    fontSize(200)
    
    if self.touched == 1 then
        fill(colorsetup(chooseColor, 2).r, colorsetup(chooseColor, 2).g, 
        colorsetup(chooseColor, 2).b, 50)
    end
    if self.touched == 2 then
        fill(235, 66, 66, 255)
    end
    
    -- Draw the creatures
    if self.num2 == 0 then
        text(self.num1, self.x, self.y)
    elseif self.num3 == 0 then
        text(self.num1, self.x - 1/6 * WIDTH, self.y)
        text(self.num2, self.x + 1/6 * WIDTH, self.y)
    else
        text(self.num1, self.x - 1/4 * WIDTH, self.y)
        text(self.num2, self.x, self.y)
        text(self.num3, self.x + 1/4 * WIDTH, self.y)
    end
    
    -- Draw the index
    fill(colorsetup(chooseColor, 2))
    if chooseColor == 4 then
        if self.index % 2 == 0 then
            fill(colorsetup(chooseColor, 0))
        else
            fill(colorsetup(chooseColor, 1))
        end
    end
    fontSize(30)
    font("AmericanTypewriter")
    
    if self.index == highscore then
        text("Best", WIDTH - 50, self.y)
    else
        text(self.index, WIDTH - 50, self.y)
    end
    
end

function Enemy:fall()
    
    self.status = MOVE
    
    -- Refresh the acceleration
    self.acceleration = (ElapsedTime - time) / 30
    
    self.y = self.y - 3 - self.acceleration
    
end
