-- I Am Different!
displayMode(FULLSCREEN_NO_BUTTONS)
supportedOrientations(PORTRAIT_ANY)

READY = -1
START = 0
MOVE = 1
END = 2
SETTINGS = 3
INSTRUCTIONS = 4

-- Use this function to perform your initial setup
function setup()
    
    gameSetup()
    
end

-- This function gets called once every frame
function draw()

    background(colorsetup(chooseColor, 1))
    
    -- Always show the menu
    menu()
    
    if gaming == READY or gaming == INSTRUCTIONS then
        tint(255)
        sprite("Project:Instructions", 1/2 * WIDTH, 1/2 * HEIGHT, WIDTH, HEIGHT)
    end
    
    if gaming == MOVE then
        game()
    end
    
    if gaming == END then
        gameOver()
    end
    
    if gaming == SETTINGS then
        settings()
    end
    
end

function touched(myTouch)
    
    -- Click on buttons
    if gaming == MOVE and myTouch.state == ENDED then
        for i, j in ipairs(buttonList) do
            buttonList[i]:touched(myTouch)
        end
        return
    end
    
    -- Start the game or go to the settings
    s1 = math.sqrt((myTouch.x - 3/10 * WIDTH) ^ 2 + (myTouch.y - 510) ^ 2)
    s2 = math.sqrt((myTouch.x - 7/10 * WIDTH) ^ 2 + (myTouch.y - 510) ^ 2)
    if gaming == START and myTouch.state == ENDED and s1 <= 150 then
        gameSetup()
        gaming = MOVE
        musicsetup(chooseColor)
        return
    end
    if gaming == START and myTouch.state == ENDED and s2 <= 150 then
        settingsSetup()
        gaming = SETTINGS
        musicsetup(chooseColor)
        return
    end
    
    -- Back to the menu
    if gaming == END and myTouch.state == ENDED and myTouch.y >= HEIGHT - 200 then
        gaming = START
        gameSetup()
        return
    end
    
    -- In Settings
    if gaming == SETTINGS and myTouch.state == ENDED then
        for i, j in ipairs(settingButtonList) do
            settingButtonList[i]:touched(myTouch)
        end
        return
    end
    
    -- First time over
    if gaming == READY and myTouch.state == ENDED then
        gaming = START
        first = 0
        saveLocalData("first", 0)
        return
    end
    
    -- INSTRUCTIONS
    if gaming == INSTRUCTIONS and myTouch.state == ENDED then
        gaming = SETTINGS
        return
    end

end