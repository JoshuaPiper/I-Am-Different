function menu()
    
    --Draw the background
    
    if gaming == START then
        
        noStroke()
        rectMode(CENTER)
        fill(colorsetup(chooseColor, 0))
        rect(WIDTH / 2, 250, WIDTH, 150)
        rect(WIDTH / 2, 770, WIDTH, 170)
        
        font("Optima-ExtraBlack")
        fill(colorsetup(chooseColor, 2))
        fontSize(70)
        text("I AM DIFFERENT!", WIDTH / 2, 770)
        
        tint(250, 250, 250, 200)
        if chooseColor == 4 then
            tint(255, 255)
        end
        sprite("Project:Play", 3/10 * WIDTH, 510, 300)
        sprite("Project:Settings", 7/10 * WIDTH, 510, 300)
        
        fontSize(50)
        text("Made By", 2/5 * WIDTH + 20, 250)
        sprite("Cargo Bot:Codea Icon", 3/5 * WIDTH + 40, 250, 100)
        sprite("Project:Developer", 3/5 * WIDTH + 80, 225, 180)
        
        fontSize(40)
        text("High Score: "..math.floor(highscore), WIDTH / 2, 60)
        
    end
    
end
