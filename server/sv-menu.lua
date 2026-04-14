lib.callback.register('sync_evidence:sv-menu:getCreatedInv', function(source, invData)
    local inv = exports.ox_inventory:GetInventory(invData, false)

    return inv
end)