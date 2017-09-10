function colorsetup(xcolor, xpreference)
    if xpreference == 1 then
        if xcolor == 1 then
            return color(222, 225, 191, 255)
        elseif xcolor == 2 then
            return color(118, 194, 226, 255)
        elseif xcolor == 3 then
            return color(183, 223, 154, 255)
        elseif xcolor == 4 then
            return color(23, 23, 23, 255)
        elseif xcolor == 5 then
            return color(227, 192, 106, 255)
        elseif xcolor == 6 then
            return color(229, 97, 127, 255)
        end
    elseif xpreference == 0 then
        if xcolor == 1 then
            return color(185, 223, 179, 255)
        elseif xcolor == 2 then
            return color(14, 149, 206, 255)
        elseif xcolor == 3 then
            return color(137, 194, 87, 255)
        elseif xcolor == 4 then
            return color(236, 236, 236, 255)
        elseif xcolor == 5 then
            return color(233, 168, 6, 255)
        elseif xcolor == 6 then
            return color(213, 130, 176, 255)
        end
    elseif xpreference == 2 then
        if xcolor == 1 then
            return color(74, 74, 74, 222)
        elseif xcolor == 2 then
            return color(232, 235, 238, 255)
        elseif xcolor == 3 then
            return color(62, 98, 31, 255)
        elseif xcolor == 4 then
            return color(69, 69, 69, 255)
        elseif xcolor == 5 then
            return color(135, 104, 29, 255)
        elseif xcolor == 6 then
            return color(234, 224, 228, 255)
        end
    end
end

function musicsetup(xcolor)
    if xcolor == 1 or xcolor == 2 then
        music("Game Music One:Electrik", true)
        music.volume = 0.1
    elseif xcolor == 5 or xcolor == 3 or xcolor == 6 then
        music("Game Music One:Toy Land", true)
        music.volume = 0.2
    elseif xcolor == 4 then
        music("Game Music One:Zero", true)
        music.volume = 0.2
    end
end

function soundsetup(xsound, xtype)
    if xsound == 1 then
        if xtype == 1 then
            sound(SOUND_PICKUP, 26123)
        elseif xtype == 2 then
            sound("Game Sounds One:Wrong")
        end
    end
end
