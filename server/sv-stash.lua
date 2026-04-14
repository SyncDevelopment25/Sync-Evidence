Wait(100)

function ForceOpenInventory(src, stashId)
    if not src then return end
    exports.ox_inventory:forceOpenInventory(src, 'stash', stashId)
end
-- Register Stashes
for id, v in pairs(Config.EvidenceStashes) do
    exports.ox_inventory:RegisterStash(id, id, 5000, 500000, v, vec4(257.01, -277.45, 67.83, 246.55))
end

RegisterNetEvent("sync_evidence:sv-stash:openLocker", function (stashId)
    local src = source
    if not source then return end
    exports.ox_inventory:forceOpenInventory(src, 'stash', stashId)
end)

RegisterNetEvent("sync_evidence:sv-stash:registerStash", function (stashId, label)
    local src = source
    if not source then return end
   exports.ox_inventory:RegisterStash(stashId, "Evidence Locker: " .. label, 5000, 500000, nil,{}, vec3(0,0,0))
   Wait(100)
   ForceOpenInventory(src, stashId)
end)


RegisterNetEvent("sync_evidence:sv-stash:registerLocker", function (stashId, label)
    local src = source
    if not source then return end
   exports.ox_inventory:RegisterStash(stashId,label, 5000, 500000, nil,{}, vec3(0,0,0))
   Wait(100)
   ForceOpenInventory(src, stashId)
end)
