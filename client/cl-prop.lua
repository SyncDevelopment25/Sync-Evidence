local stashObjects = {}
findableObjects = {}

Wait(100)

function loadModel(propName)
    local model = propName
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end 
    return model
end


for _, v in pairs(Config.EvidenceLocations) do
    local lockerModel = loadModel("sync_evidence_lockers")
    local lockers = CreateObject(lockerModel, v.coords.x, v.coords.y, v.coords.z, true, true, true)

    SetEntityHeading(lockers, v.coords.w  )
    PlaceObjectOnGroundProperly(lockers)
    FreezeEntityPosition(lockers, true)
    CreateBaseTarget(lockers, v)
    if v.personalLockers then
      CreatePersonalLocker(lockers)
    end
    stashObjects[#stashObjects + 1] = lockers
    findableObjects[lockers] = v.stashAccess
end

AddEventHandler('onResourceStop', function(resource)
   if resource == GetCurrentResourceName() then
      for _,v in pairs(stashObjects) do
         if DoesEntityExist(v) then
            DeleteEntity(v)
         end
      end
   end
end)