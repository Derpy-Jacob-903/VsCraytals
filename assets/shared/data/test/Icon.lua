-- gf icon script by Misha21220 [GD] (artycity21), GF icons by ꧁sʜ†ᴢᴀ꧂: https://www.youtube.com/@SHllZA
local gfCryMiss = false
function onCreate()

		        makeAnimatedLuaSprite('gficon', 'icons/gfIcon', 0, 0)
				addAnimationByPrefix('gficon', 'gf','neutral', 1, false)
				addAnimationByPrefix('gficon', 'cry','miss', 1, false)
				addAnimationByPrefix('gficon', 'sad','sad', 1, false)
				addAnimationByPrefix('gficon', 'happy','smile', 1, false)				
                setObjectCamera('gficon', 'HUD')
                scaleObject('gficon', 1, 1)
                addLuaSprite('gficon', true)
                objectPlayAnimation('gficon', 'gf', false)					
end

function onUpdate()
  setObjectOrder('gficon', getObjectOrder('healthBar')+ 1) -- change 4 to 1 if you want to make gf icon behind bf and dad icons
  setProperty('gficon.x', getProperty('healthBar.x')+ 225)
  setProperty('gficon.y', getProperty('healthBar.y')- 100)  
	if getProperty('healthBar.percent') > 51 then
                setProperty('gficon.flipX', true)
        else
                setProperty('gficon.flipX', false)
    end

	if getProperty('healthBar.percent') > 80 and gfCryMiss == false then
       objectPlayAnimation('gficon', 'happy', false)  
	end   
    if getProperty('healthBar.percent') < 80 and getProperty('healthBar.percent') > 25 and gfCryMiss == false then
       objectPlayAnimation('gficon', 'gf', false)	
	end	
    if getProperty('healthBar.percent') < 25 and gfCryMiss == false then
       objectPlayAnimation('gficon', 'sad', false)	
	end

    if gfCryMiss == true then
       objectPlayAnimation('gficon', 'cry', false)  
	end

	setProperty('gficon.scale.x', getProperty('iconP1.scale.x'))
	setProperty('gficon.scale.y', getProperty('iconP1.scale.y'))
	setProperty('gficon.alpha', getProperty('healthBar.alpha'))
end 
function noteMiss(id, direction, noteType, isSustainNote)
  if not isSustainNote then
   gfCryMiss = true
   runTimer('gfStopCrying', 0.45, 1)	    
  end 
end
function onTimerCompleted(tag)
   if tag == 'gfStopCrying' then
      gfCryMiss = false
   end
end