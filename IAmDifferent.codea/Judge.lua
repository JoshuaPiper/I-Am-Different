function judge()
    
    for i, j in ipairs(enemyList) do
        if enemyList[i].touched == 0 then
            aim = enemyList[i]
            break
        end
    end
    
    if aim.y <= -100 and aim.touched == 0  then
        music.stop()
        soundsetup(chooseSound, 2)
        gaming = END
    end
    
end

function check(num)
    
    for i, j in ipairs(enemyList) do
        if enemyList[i].touched == 0 then
            aim = enemyList[i]
            break
        end
    end
    
    if num ~= aim.num1 and num ~= aim.num2 and num ~= aim.num3 and aim.y <= HEIGHT then
        aim.touched = 1
        soundsetup(chooseSound, 1)
    elseif aim.y <=  HEIGHT then
        aim.touched = 2
        music.stop()
        soundsetup(chooseSound, 2)
        gaming = END
    end
    
end
