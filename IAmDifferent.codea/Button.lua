Button = class()

function Button:init(num, x, y)
    self.num = num
    self.x = x
    self.y = y
end

function Button:draw()
    -- Draw the background
    rectMode(CENTER)
    stroke(151, 151, 151, 77)
    strokeWidth(3)

    fill(28, 28, 28, 140)
    ellipse(self.x, self.y, 101)
    
    -- Draw the buttons
    font("Copperplate-Bold")
    fill(244, 244, 244, 201)
    fontSize(60)
    text(self.num, self.x, self.y)
    
end

function Button:touched(touch)
    if touch.x < self.x + 50 and touch.x > self.x - 50 and
    touch.y < self.y + 50 and touch.y > self.y - 50 then
        check(self.num)
    end
end
