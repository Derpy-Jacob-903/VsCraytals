function onCountdownTick(counter)
    if counter == 0 then -- three
        triggerEvent('Play Animation', 'three', 'boyfriend')
    end
    if counter == 1 then -- two
        triggerEvent('Play Animation', 'two', 'boyfriend')
    end
    if counter == 2 then -- one
        triggerEvent('Play Animation', 'one', 'boyfriend')
    end
    if counter == 3 then -- go
        triggerEvent('Play Animation', 'go', 'boyfriend')
    end
end