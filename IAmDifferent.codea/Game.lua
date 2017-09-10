function gameSetup()
    
    -- First time
    -- saveLocalData("first", READY) -- Delete this line to see instructions
    first = readLocalData("first", READY)
    gaming = first
    
    -- Player reference
    chooseColor = readLocalData("chooseColor", 1)
    chooseSound = readLocalData("chooseSound", 1)
    
    -- High Score
    -- clearLocalData() -- Delete this line to reset
    highscore = readLocalData("highscore", 0)
    
    -- Start time
    time = ElapsedTime
    
    math.randomseed(math.random(1, 1000))
    
    -- Enemy Database
    enemyList = {}
    
    -- Enemy that has been set up
    enemyCount = 0
    
    -- Add the first 10 creatures
    for i = 1, 10 do
        enemyCount = enemyCount + 1 
        table.insert(enemyList, Enemy(math.floor(math.random(1, 4)), 0, 0))
    end
    
    -- Button Database
    buttonList = {}
    
    -- Add the Buttons
    table.insert(buttonList, Button(1, 1/5 * WIDTH, 100))
    table.insert(buttonList, Button(2, 2/5 * WIDTH, 100))
    table.insert(buttonList, Button(3, 3/5 * WIDTH, 100))
    table.insert(buttonList, Button(4, 4/5 * WIDTH, 100))
end

function game()
    
    -- When to fall
    for i, j in ipairs(enemyList) do
        if enemyList[i].status == MOVE then
            enemyList[i]:fall()
        end
        if enemyList[i].status == START then
            if i == 1 or enemyList[i].y - enemyList[i - 1].y >= 200 then
                enemyList[i]:fall()
            end
        end
    end
    
    -- Judge if cannot finish the game
    judge()
    
    -- Delete the finished creature
    if enemyList[1].y <= -1/5 * HEIGHT then
        table.remove(enemyList, 1)
    end
    
    -- Add new creature (use table.maxn() to get the length of enemyList)
    if 6/5 * HEIGHT - enemyList[table.maxn(enemyList)].y >= 200 then
        enemyCount = enemyCount + 1
        if enemyCount < 50 then
            table.insert(enemyList, Enemy(math.floor(math.random(1, 4)), math.floor(math.random(0, 4)), 0))
        elseif enemyCount < 100 and enemyCount >= 50 then
            table.insert(enemyList, Enemy(math.floor(math.random(1, 4)), math.floor(math.random(1, 4)), 
            math.floor(math.random(0, 4))))
        else
            table.insert(enemyList, Enemy(math.floor(math.random(1, 4)), math.floor(math.random(1, 4)), 
            math.floor(math.random(1, 4))))
        end
    end
    
    -- Draw the creatures
    for i, j in ipairs(enemyList) do
        enemyList[i]:draw()
    end
    
    -- Draw the buttons
    for i, j in ipairs(buttonList) do
        buttonList[i]:draw()
    end
    
end

function gameOver()
    for i, j in ipairs(enemyList) do
        enemyList[i]:draw()
    end
    
    fill(26, 49, 30, 180)
    rect(WIDTH / 2, 50, WIDTH + 10, 103)
    fill(255, 0, 0, 160)
    rect(WIDTH / 2, HEIGHT - 50, WIDTH + 10, 103)
    
    for i, j in ipairs(enemyList) do
        if enemyList[i].touched == 0 or enemyList[i].touched == 2 then
            aim = enemyList[i]
            break
        end
    end
    
    -- Display the score and menu button
    
    font("Optima-ExtraBlack")
    fill(240, 240, 240, 222)
    fontSize(50)
    text("Back to the menu", WIDTH / 2 + 40, HEIGHT - 50)
    fontSize(100)
    text("↺", WIDTH / 2 - 230, HEIGHT - 50)
    fontSize(50)
    
    if aim.index - 1 > highscore then
        text("New Best ! "..aim.index - 1, WIDTH / 2, 50)
        saveLocalData("highscore", aim.index - 1)
    else
        text("Final Score : "..aim.index - 1, WIDTH / 2, 50)
    end
    
end
