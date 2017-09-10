function settingsSetup()
    
    settingButtonList = {}
    
    table.insert(settingButtonList, SettingButtons(1, 1, 1/5 * WIDTH, HEIGHT - 250))
    table.insert(settingButtonList, SettingButtons(1, 2, 2/5 * WIDTH, HEIGHT - 250))
    table.insert(settingButtonList, SettingButtons(1, 3, 3/5 * WIDTH, HEIGHT - 250))
    table.insert(settingButtonList, SettingButtons(1, 4, 4/5 * WIDTH, HEIGHT - 250))
    table.insert(settingButtonList, SettingButtons(1, 5, 1/5 * WIDTH, HEIGHT - 400))
    table.insert(settingButtonList, SettingButtons(1, 6, 2/5 * WIDTH, HEIGHT - 400))
    table.insert(settingButtonList, SettingButtons(2, 1, 2/7 * WIDTH, HEIGHT - 650))
    table.insert(settingButtonList, SettingButtons(2, 2, 5/7 * WIDTH, HEIGHT - 650))
    table.insert(settingButtonList, SettingButtons(3, 1, 1/2 * WIDTH, 240))
    table.insert(settingButtonList, SettingButtons(5, 1, 1/2 * WIDTH, 160))
    table.insert(settingButtonList, SettingButtons(4, 1, 1/2 * WIDTH, 80))
    
end
    
function settings()
      
    -- Draw the titles
    font("Optima-ExtraBlack")
    fill(colorsetup(chooseColor, 2))
    if chooseColor == 4 then
        fill(255)
    end

    fontSize(70)
    text("► Colors", 1/4 * WIDTH, HEIGHT - 100)
    text("► Sound", 1/4 * WIDTH, HEIGHT - 550)

    -- Draw the buttons
    for i = 1, table.maxn(settingButtonList) do
        settingButtonList[i]:draw()
    end
    
end
