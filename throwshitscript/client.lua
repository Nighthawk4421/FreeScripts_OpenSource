local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('throwdookie', function()
    local player = PlayerPedId()
    if player then
        local ped = PlayerPedId()
        local hash = 'prop_big_shit_02'
        local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped,0.0,1.0,-1.0))
        QBCore.Functions.LoadModel(hash)
        turdObj = CreateObjectNoOffset(hash, x, y, z, true, false)
        SetModelAsNoLongerNeeded(hash)
        AttachEntityToEntity(turdObj, ped, GetPedBoneIndex(ped, 57005), 0.15, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- object is attached to right hand 
        local forwardVector = GetEntityForwardVector(ped)
        local force = 50.0
        local animDict = "melee@unarmed@streamed_variations"
        local anim = "plyr_takedown_front_slap"
        ClearPedTasks(ped)
        QBCore.Functions.RequestAnimDict(animDict)
        TaskPlayAnim(ped, animDict, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
        Wait(500)
        DetachEntity(turdObj)
        ApplyForceToEntity(turdObj,1,forwardVector.x*force,forwardVector.y*force + 5.0,forwardVector.z,0,0,0,0,false,true,true,false,true)
        turdID = ObjToNet(turdObj)
        SetNetworkIdExistsOnAllMachines(turdObj,true)
        curPet = GetGameTimer()
        local doSomeMath = lastPet - curPet + 120000
        if lastPet == 0 or doSomeMath < 0 then
            lastPet = GetGameTimer()
            petLoyalty = petLoyalty + 5
        end
    end

end)

RegisterNetEvent('ownablePets:throwDookie',function()
    local player = PlayerPedId()
    if player then
        local ped = PlayerPedId()
        local hash = 'prop_big_shit_02'
        local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped,0.0,1.0,-1.0))
        QBCore.Functions.LoadModel(hash)
        turdObj = CreateObjectNoOffset(hash, x, y, z, true, false)
        SetModelAsNoLongerNeeded(hash)
        AttachEntityToEntity(turdObj, ped, GetPedBoneIndex(ped, 57005), 0.15, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- object is attached to right hand 
        local forwardVector = GetEntityForwardVector(ped)
        local force = 50.0
        local animDict = "melee@unarmed@streamed_variations"
        local anim = "plyr_takedown_front_slap"
        ClearPedTasks(ped)
        QBCore.Functions.RequestAnimDict(animDict)
        TaskPlayAnim(ped, animDict, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
        Wait(500)
        DetachEntity(turdObj)
        ApplyForceToEntity(turdObj,1,forwardVector.x*force,forwardVector.y*force + 5.0,forwardVector.z,0,0,0,0,false,true,true,false,true)
        turdID = ObjToNet(turdObj)
        SetNetworkIdExistsOnAllMachines(turdObj,true)
        curPet = GetGameTimer()
        local doSomeMath = lastPet - curPet + 120000
        if lastPet == 0 or doSomeMath < 0 then
            lastPet = GetGameTimer()
            petLoyalty = petLoyalty + 5
        end
    end
end)