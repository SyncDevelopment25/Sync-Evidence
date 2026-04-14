function LoadAnimationDictionary(animationD)
    RequestAnimDict(animationD)
    local timeout   = 0
    while not HasAnimDictLoaded(animationD) do
        Wait(1)
        timeout = timeout + 1
        if timeout > 60 then 
            print("DEBUG ERROR: Anim Dict failed to load! Check filename and fxmanifest.")
            return 
        end
    end
end
    

function PlayModelAnimation(objId, clip, dict)
    LoadAnimationDictionary(dict)
        PlayEntityAnim(objId,clip,dict,1.0,false,true,false,0,0)
end

function CreateBaseTarget(entId, data)
    exports.ox_target:addLocalEntity(entId, {
        label = "Access " .. data.targetLabel,
        icon = "fa-solid fa-toolbox",
        onSelect = function (data)
        CreateInputMenu(findableObjects[data.entity])
        PlayModelAnimation(entId, "sync_open_locker", "anim@sync_lockers")

            CreateThread(function()
                Wait(500)
                while LocalPlayer.state.invOpen do
                    Wait(100)
                end
                PlayModelAnimation(entId, "sync_close_locker", "anim@sync_lockers")
            end)

        end
    })
end

function CreatePersonalLocker(entId)
    exports.ox_target:addLocalEntity(entId, {
        label = "Access Personal Locker",
        icon = "fa-solid fa-person",
        onSelect = function ()
        TriggerServerEvent("sync_evidence:sv-stash:registerLocker", string.format("personal_stash_%s", Framework.GetCID()), "Personal Locker " .. Framework.GetCID())
        PlayModelAnimation(entId, "sync_open_locker", "anim@sync_lockers")
        
            CreateThread(function()
                Wait(500)
                while LocalPlayer.state.invOpen do
                    Wait(100)
                end
                PlayModelAnimation(entId, "sync_close_locker", "anim@sync_lockers")
            end)

        end
    })
end