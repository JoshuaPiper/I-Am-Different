SettingButtons = class()

function SettingButtons:init(kind, num, x, y)
    self.kind = kind
    self.num = num
    self.x = x
    self.y = y
    self.click = 0
end

function SettingButtons:draw()
    if self.kind == 1 then
        if self.num ~= chooseColor then
            tint(214, 214, 214, 185)
            if self.num == 1 then
                sprite("Project:Color1", self.x, self.y)
            elseif self.num == 2 then
                sprite("Project:Color2", self.x, self.y)
            elseif self.num == 3 then
                sprite("Project:Color3", self.x, self.y)
            elseif self.num == 4 then
                sprite("Project:Color4", self.x, self.y)
            elseif self.num == 5 then
                sprite("Project:Color5", self.x, self.y)
            elseif self.num == 6 then
                sprite("Project:Color6", self.x, self.y)
            end
        elseif self.num == chooseColor then
            tint(233, 233, 233, 255)
            if self.num == 1 then
                sprite("Project:Color1", self.x, self.y, 200)
            elseif self.num == 2 then
                sprite("Project:Color2", self.x, self.y, 200)
            elseif self.num == 3 then
                sprite("Project:Color3", self.x, self.y, 200)
            elseif self.num == 4 then
                sprite("Project:Color4", self.x, self.y, 200)
            elseif self.num == 5 then
                sprite("Project:Color5", self.x, self.y, 200)
            elseif self.num == 6 then
                sprite("Project:Color6", self.x, self.y, 200)
            end            
        end
    end
    
    if self.kind == 2 then
        fill(255, 0)
        paint = colorsetup(chooseColor, 2)
        if chooseColor == 4 then
            paint = color(255)
        end
        if chooseSound ~= 2 - self.num then
            paint.alpha = 50
        end
        strokeWidth(7)
        stroke(paint)
        rect(self.x, self.y, 250, 75)
        
        if self.num == 1 then
            paint = colorsetup(chooseColor, 2)
            if chooseColor == 4 then
                paint = color(255)
            end
            if chooseSound ~= 2 - self.num then
                paint.alpha = 50
            end
            fill(paint)
            fontSize(50)
            text("Enable", self.x, self.y)
        end
        if self.num == 2 then
            paint = colorsetup(chooseColor, 2)
            if chooseColor == 4 then
                paint = color(255)
            end
            if chooseSound ~= 2 - self.num then
                paint.alpha = 50
            end
            fill(paint)
            fontSize(50)
            text("Disable", self.x, self.y)
        end
    end
    
    if self.kind == 3 then
        if self.click == 0 then
            paint = colorsetup(chooseColor, 2)
            if chooseColor == 4 then
                paint = color(255)
            end
            if highscore == 0 then
                paint.alpha = 50
            end
            fill(paint)
            fontSize(50)
            text("► Reset Data ◄", self.x, self.y)
        elseif self.click == 1 then
            paint = color(120, 30, 30, 255)
            fill(paint)
            fontSize(50)
            text("► Sure ? ◄", self.x, self.y)
        end
    end
    
    if self.kind == 4 then
        paint = colorsetup(chooseColor, 2)
        if chooseColor == 4 then
            paint = color(255)
        end
        fill(paint)
        fontSize(50)
        text("► Back to Menu ◄", self.x, self.y)
    end
    
    if self.kind == 5 then
        paint = colorsetup(chooseColor, 2)
        if chooseColor == 4 then
            paint = color(255)
        end
        fill(paint)
        fontSize(50)
        text("► Instructions ◄", self.x, self.y)
    end
    
end

function SettingButtons:touched(touch)
    if touch.x < self.x + 75 and touch.x > self.x - 75 and
    touch.y < self.y + 75 and touch.y > self.y - 75 and self.kind == 1 then
        chooseColor = self.num
        saveLocalData("chooseColor", self.num)
        music.stop()
        musicsetup(chooseColor)
        settingButtonList[9].click = 0
    end
    
    if touch.x < self.x + 125 and touch.x > self.x - 125 and
    touch.y < self.y + 37.5 and touch.y > self.y - 37.5 and self.kind == 2 then
        if self.num ~= 2 - chooseSound then
            chooseSound = 1 - chooseSound
            saveLocalData("chooseSound", chooseSound)
        end
        settingButtonList[9].click = 0
    end
    
    if touch.x < self.x + 150 and touch.x > self.x - 150 and
    touch.y < self.y + 37.5 and touch.y > self.y - 37.5 and self.kind == 3 then
        if self.click == 0 and highscore ~= 0 then
            self.click = self.click + 1
        elseif self.click == 1 then
            highscore = 0
            self.click = 0
            saveLocalData("highscore", 0)
        end
    end
    
    if touch.x < self.x + 180 and touch.x > self.x - 180 and
    touch.y < self.y + 37.5 and touch.y > self.y - 37.5 and self.kind == 4 then
        gaming = START
        noStroke()
        music.stop()
        settingButtonList[9].click = 0
    end
    
    if touch.x < self.x + 160 and touch.x > self.x - 160 and
    touch.y < self.y + 37.5 and touch.y > self.y - 37.5 and self.kind == 5 then
        gaming = INSTRUCTIONS
        settingButtonList[9].click = 0
    end
    
end
