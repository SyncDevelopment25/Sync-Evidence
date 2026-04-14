function CreateInputMenu(currentStashOverView)
    local evidenceLocker = lib.inputDialog("Choosing Evidence Locker", {{type = "input", label = "Evidence Case Locker", description = "Please, choose a case file either text and number", required = true, step = 1}}, {allowCancel = true, size ='sm'})


    if evidenceLocker then
        local labelText = evidenceLocker[1]
        local textInput = labelText:gsub(' ', '_')
        local stashId = string.format("%s_%s", currentStashOverView, textInput):gsub(' ', '_')
        local callback = lib.callback.await('sync_evidence:sv-menu:getCreatedInv', false, stashId)
        local callbackType = type(callback)
                
            if callbackType == 'boolean' then
                TriggerServerEvent('sync_evidence:sv-stash:registerStash', stashId, labelText)
            elseif callbackType == "table" then
                TriggerServerEvent('sync_evidence:sv-stash:openLocker', stashId)
            end
    end
end