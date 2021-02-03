local core = {}
local key = {}
local buf = {}

function love.load()

    love.window.setMode(800, 600, flags)
    love.window.setTitle("Tic Tac Toe")
    core["wallpaper"] = love.graphics.newImage("wallpaper.jpg")
    core["scene"] = 0
    core["player"] = 1
    core["cross"] = love.graphics.newImage("cross1.png")
    core["circle"] = love.graphics.newImage("circle1.png")
    core["crossS"] = love.graphics.newImage("cross1S.png")
    core["circleS"] = love.graphics.newImage("circle1S.png")
    core["crossB"] = love.graphics.newImage("crossB.png")
    core["crossR"] = love.graphics.newImage("crossR.png")
    core["circleB"] = love.graphics.newImage("circleB.png")
    core["circleR"] = love.graphics.newImage("circleR.png")
    core["colorB"] = love.graphics.newImage("colorB.png")
    core["colorR"] = love.graphics.newImage("colorR.png")
    core["colorSB"] = love.graphics.newImage("colorSB.png")
    core["colorSR"] = love.graphics.newImage("colorSR.png")
    core["perso1"] = 0
    core["perso2"] = 0
    core["perso"] = core.perso1
    core["case"] = love.graphics.newImage("carre.png")
    core["case1"] = core.case
    core["case2"] = core.case
    core["case3"] = core.case
    core["case4"] = core.case
    core["case5"] = core.case
    core["case6"] = core.case
    core["case7"] = core.case
    core["case8"] = core.case
    core["case9"] = core.case
    core["case1S"] = 0
    core["case2S"] = 0
    core["case3S"] = 0
    core["case4S"] = 0
    core["case5S"] = 0
    core["case6S"] = 0
    core["case7S"] = 0
    core["case8S"] = 0
    core["case9S"] = 0
    core["caseS"] = 0
    core["win"] = 0
    mainFont = love.graphics.newFont("27thRPS-Regular.TTF", 50)
    love.graphics.setFont(mainFont)
    cursorClick = love.mouse.newCursor("handt8.PNG", 20, 20)
    cursor = love.mouse.newCursor("pointer1.PNG", 10, 0)
    love.mouse.setCursor(cursor)

end

function love.draw()

    if (core.scene == 0) then
        core.menu()
    end
    if (core.scene == 1) then
        core.selectPlayer()
    end
    if (core.scene == 2) then
        core.game()
    end
    if (core.scene == 3) then
        core.gameOver()
    end
    if (core.scene == 4) then
        core.gameNul()
    end

end

function love.update(dt)

    positionx = love.mouse.getX()
    positiony = love.mouse.getY()
    if (core.scene == 0) then
        if (positionx > 600 and positionx < 750 and positiony > 550 and positiony < 600) then
            love.mouse.setCursor(cursorClick)
            if love.mouse.isDown(1) then core.scene = 1
            end
        else
            love.mouse.setCursor(cursor)
        end
        if (positionx > 740 and positionx < 780 and positiony > 10 and positiony < 50 and love.mouse.isDown(1)) then
            love.event.quit()
        end
    end

    if (core.scene == 1) then
        if (positionx > 650 and positionx < 800 and positiony > 10 and positiony < 60) then
            love.mouse.setCursor(cursorClick)
            if(core.perso1 == core.circleB or core.perso1 == core.circleR or core.perso1 == core.crossB or core.perso1 == core.crossR) then
                if love.mouse.isDown(1) then
                    core.scene = 2
                end
            end
        else
            love.mouse.setCursor(cursor)
        end

        if (positionx > 190 and positionx < 300 and positiony > 170 and positiony < 220) then
            love.mouse.setCursor(cursorClick)
            if love.mouse.isDown(1) then
                if (core.perso1 == core.cross or 0) then
                    core.cross = love.graphics.newImage("cross1.png")
                    core.circle = core.circleS
                    core.perso1 = core.circle
                end
                if (core.perso1 == core.crossB) then
                    core.cross = love.graphics.newImage("cross1.png")
                    core.circle = core.circleS
                    core.perso1 = core.circleB
                end
                if (core.perso1 == core.crossR) then
                    core.cross = love.graphics.newImage("cross1.png")
                    core.circle = core.circleS
                    core.perso1 = core.circleR
                end
                
            end
        else
            love.mouse.setCursor(cursor)
        end
        if (positionx > 450 and positionx < 550 and positiony > 170 and positiony < 220) then
            love.mouse.setCursor(cursorClick)
            if love.mouse.isDown(1) then
                if (core.perso1 == core.circle or 0) then
                    core.circle = love.graphics.newImage("circle1.png")
                    core.cross = core.crossS
                    core.perso1 = core.cross
                end
                if (core.perso1 == core.circleB) then
                    core.circle = love.graphics.newImage("circle1.png")
                    core.cross = core.crossS
                    core.perso1 = core.crossB
                end
                if (core.perso1 == core.circleR) then
                    core.circle = love.graphics.newImage("circle1.png")
                    core.cross = core.crossS
                    core.perso1 = core.crossR
                end
                
            end
        else
            love.mouse.setCursor(cursor)
        end

        if (positionx > 190 and positionx < 300 and positiony > 400 and positiony < 550) then
            love.mouse.setCursor(cursorClick)
            if love.mouse.isDown(1) then
                core.colorB = core.colorSB
                if (core.colorR == core.colorSR) then
                    core.colorR = love.graphics.newImage("colorR.png")
                end
                if (core.perso1 == core.cross) then
                    core.perso1 = core.crossB
                    core.perso2 = core.circleR
                end
                if (core.perso1 == core.circle) then
                    core.perso1 = core.circleB
                    core.perso2 = core.crossR
                end

            end
        else
            love.mouse.setCursor(cursor)
        end
        if (positionx > 440 and positionx < 550 and positiony > 400 and positiony < 550) then
            love.mouse.setCursor(cursorClick)
            if love.mouse.isDown(1) then
                core.colorR = core.colorSR
                if (core.colorB == core.colorSB) then
                    core.colorB = love.graphics.newImage("colorB.png")
                end
                if (core.perso1 == core.cross) then
                    core.perso1 = core.crossR
                    core.perso2 = core.circleB
                end
                if (core.perso1 == core.circle) then
                    core.perso1 = core.circleR
                    core.perso2 = core.crossB
                end

            end
        else
            love.mouse.setCursor(cursor)
        end
    end

    if (core.scene == 2) then
        
        if (positionx > 95 and positionx < 281 and positiony > 20 and positiony < 206 and core.case1 == core.case) then
            if love.mouse.isDown(1) then
                core.caseS = core.case1
                core.play()
                core.case1 = core.caseS
                core.case1S = core.caseP
            end
        end
        if (positionx > 308 and positionx < 494 and positiony > 20 and positiony < 206 and core.case2 == core.case) then
            if love.mouse.isDown(1) then
                core.caseS = core.case2
                core.play()
                core.case2 = core.caseS
                core.case2S = core.caseP
            end
        end
        if (positionx > 520 and positionx < 650 and positiony > 20 and positiony < 206 and core.case3 == core.case) then
            if love.mouse.isDown(1) then
                core.caseS = core.case3
                core.play()
                core.case3 = core.caseS
                core.case3S = core.caseP
            end
        end
        if (positionx > 95 and positionx < 281 and positiony > 215 and positiony < 301 and core.case4 == core.case) then
            if love.mouse.isDown(1) then
                core.caseS = core.case4
                core.play()
                core.case4 = core.caseS
                core.case4S = core.caseP
            end
        end
        if (positionx > 308 and positionx < 494 and positiony > 215 and positiony < 301 and core.case5 == core.case) then
            if love.mouse.isDown(1) then
                core.caseS = core.case5
                core.play()
                core.case5 = core.caseS
                core.case5S = core.caseP
            end
        end
        if (positionx > 520 and positionx < 706 and positiony > 215 and positiony < 301 and core.case6 == core.case) then
            if love.mouse.isDown(1) then
                core.caseS = core.case6
                core.play()
                core.case6 = core.caseS
                core.case6S = core.caseP
            end
        end
        if (positionx > 95 and positionx < 281 and positiony > 415 and positiony < 501 and core.case7 == core.case) then
            if love.mouse.isDown(1) then
                core.caseS = core.case7
                core.play()
                core.case7 = core.caseS
                core.case7S = core.caseP
            end
        end
        if (positionx > 308 and positionx < 494 and positiony > 415 and positiony < 501 and core.case8 == core.case) then
            if love.mouse.isDown(1) then
                core.caseS = core.case8
                core.play()
                core.case8 = core.caseS
                core.case8S = core.caseP
            end
        end
        if (positionx > 520 and positionx < 706 and positiony > 415 and positiony < 501 and core.case9 == core.case) then
            if love.mouse.isDown(1) then
                core.caseS = core.case9
                core.play()
                core.case9 = core.caseS
                core.case9S = core.caseP
            end
        end

        if (core.case1S == 1 and core.case2S == 1 and core.case3S == 1 or 
        core.case4S == 1 and core.case5S == 1 and core.case6S == 1 or
        core.case7S == 1 and core.case8S == 1 and core.case9S == 1 or
        core.case1S == 1 and core.case4S == 1 and core.case7S == 1 or
        core.case2S == 1 and core.case5S == 1 and core.case8S == 1 or
        core.case3S == 1 and core.case6S == 1 and core.case9S == 1 or
        core.case1S == 1 and core.case5S == 1 and core.case9S == 1 or
        core.case3S == 1 and core.case5S == 1 and core.case7S == 1) then
            core.scene = 3
            core.win = 1
        end
        if (core.case1S == 12 and core.case2S == 2 and core.case3S == 2 or 
        core.case4S == 2 and core.case5S == 2 and core.case6S == 2 or
        core.case7S == 2 and core.case8S == 2 and core.case9S == 2 or
        core.case1S == 2 and core.case4S == 2 and core.case7S == 2 or
        core.case2S == 2 and core.case5S == 2 and core.case8S == 2 or
        core.case3S == 2 and core.case6S == 2 and core.case9S == 2 or
        core.case1S == 2 and core.case5S == 2 and core.case9S == 2 or
        core.case3S == 2 and core.case5S == 2 and core.case7S == 2) then
            core.scene = 3
            core.win = 2
        end       
        if(core.case1S == 1 or core.case1S == 2) then
            if(core.case2S == 1 or core.case2S == 2) then
                if(core.case3S == 1 or core.case3S == 2) then
                    if(core.case4S == 1 or core.case4S == 2) then
                        if(core.case5S == 1 or core.case5S == 2) then
                            if(core.case6S == 1 or core.case6S == 2) then
                                if(core.case7S == 1 or core.case7S == 2) then
                                    if(core.case8S == 1 or core.case8S == 2) then
                                        if(core.case9S == 1 or core.case9S == 2) then
                                            core.scene = 4
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end 

    if(core.scene == 3) then
        if (positionx > 740 and positionx < 780 and positiony > 10 and positiony < 50 and love.mouse.isDown(1)) then
            love.event.quit()
        end
        if (positionx > 600 and positionx < 730 and positiony > 530 and positiony < 570 and love.mouse.isDown(1)) then
            core.restart()
        end
    end

    if (core.scene == 4) then
        if (positionx > 740 and positionx < 780 and positiony > 10 and positiony < 50 and love.mouse.isDown(1)) then
            love.event.quit()
        end
        if (positionx > 600 and positionx < 730 and positiony > 530 and positiony < 570 and love.mouse.isDown(1)) then
            core.restart()
        end
    end

end

function core.play()

    if (core.perso == core.perso1) then
        core.caseS = core.perso2
        core.caseP = 2
        core.perso = core.perso2
    else
        core.caseS = core.perso1
        core.caseP = 1
        core.perso = core.perso1
    end

end

function core.restart()

    core.scene = 0
    core.case1 = core.case
    core.case2 = core.case
    core.case3 = core.case
    core.case4 = core.case
    core.case5 = core.case
    core.case6 = core.case
    core.case7 = core.case
    core.case8 = core.case
    core.case9 = core.case
    core.case1S = 0
    core.case2S = 0
    core.case3S = 0
    core.case4S = 0
    core.case5S = 0
    core.case6S = 0
    core.case7S = 0
    core.case8S = 0
    core.case9S = 0
    core.caseS = 0
    core.cross = love.graphics.newImage("cross1.png")
    core.circle = love.graphics.newImage("circle1.png")
    core.colorB = love.graphics.newImage("colorB.png")
    core.colorR = love.graphics.newImage("colorR.png")
    core.perso1 = 0
    core.perso2 = 0
    core.win = 0

end

function core.menu()

    love.graphics.draw(core.wallpaper, 0, 0)
    love.graphics.print("Tic Tac Toe", 275, 300, 0, 1.3, 1.3)
    love.graphics.print("Play", 600, 550, 0, 1, 1)
    love.graphics.print("Quit", 740, 10, 0, 0.7, 0.7)

end

function core.selectPlayer()

    love.graphics.draw(core.colorB, 190, 400)
    love.graphics.draw(core.colorR, 440, 400)
    love.graphics.draw(core.circle, 200, 170)
    love.graphics.draw(core.cross, 450, 170)
    love.graphics.print("Continue", 650, 10, 0, 1, 1)

end

function core.game()

    love.graphics.print("player", 10, 5, 0, 0.8, 0.8)
    love.graphics.print(core.player, 105, 7, 0, 0.8, 0.8)
    love.graphics.rectangle("fill", 100, 190, 600, 30)
    love.graphics.rectangle("fill", 100, 390, 600, 30)
    love.graphics.rectangle("fill", 275, 60, 30, 490)
    love.graphics.rectangle("fill", 485, 60, 30, 490)

    love.graphics.draw(core.case1, 115, 40)
    love.graphics.draw(core.case2, 328, 40)
    love.graphics.draw(core.case3, 540, 40)
    love.graphics.draw(core.case4, 115, 235)
    love.graphics.draw(core.case5, 328, 235)
    love.graphics.draw(core.case6, 540, 235)
    love.graphics.draw(core.case7, 115, 435)
    love.graphics.draw(core.case8, 328, 435)
    love.graphics.draw(core.case9, 540, 435)

    --love.graphics.print(core.case1S, 10, 100)
    --love.graphics.print(core.case2S, 10, 150)
    --love.graphics.print(core.case3S, 10, 200)
    --love.graphics.print(core.player, 10, 250)

end

function core.gameOver()

    love.graphics.print("player", 330, 160, 0, 1.5, 1.5)
    love.graphics.print(core.win, 370, 245, 0, 1.5, 1.5)
    love.graphics.print("Win", 330, 300, 0, 1.5, 1.5)
    love.graphics.print("Restart", 600, 530, 0, 0.8, 0.8)
    love.graphics.print("Quit", 740, 10, 0, 0.7, 0.7)

end

function core.gameNul()

    love.graphics.print("Nobody", 315, 160, 0, 1.5, 1.5)
    love.graphics.print("Win", 330, 300, 0, 1.5, 1.5)
    love.graphics.print("Restart", 600, 530, 0, 0.8, 0.8)
    love.graphics.print("Quit", 740, 10, 0, 0.7, 0.7)

end