VORP = exports.vorp_inventory:vorp_inventoryApi()

data = {}
TriggerEvent("vorp_inventory:getData",function(call)
    data = call
end)

RegisterNetEvent("drp_def_tren:startToRob")
AddEventHandler("drp_def_tren:startToRob", function()
    local _source = source
    TriggerEvent('vorp:getCharacter', _source, function(user)
        local count = VORP.getItemCount(_source, "orden_presidente")

        if count >= 1 then
         
            VORP.subItem(_source,"orden_presidente", 1)
            TriggerClientEvent('drp_def_tren:startTimer', _source)
            TriggerClientEvent('drp_def_tren:startAnimation', _source)
        else
            TriggerClientEvent("vorp:TipBottom", _source, "Necesitas la orden presidencial", 6000)
        end     
    end)
end)

RegisterNetEvent("drp_def_tren:payout")
AddEventHandler("drp_def_tren:payout", function()
    TriggerEvent('vorp:getCharacter', source, function(user)
        local _source = source
        local _user = user
           TriggerEvent("vorp:addMoney",source, 0, 100, _user)
    end)
    TriggerClientEvent("vorp:Tip",source, 'El Gobierno te ha enviado como recompensa: 100$', 5000)

end)
