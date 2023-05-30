-- Fonction pour vérifier si un joueur est administrateur ou modérateur
local function isAdminOrModerator(source)
    -- Ici, vous pouvez ajouter votre propre logique pour vérifier si un joueur est administrateur ou modérateur
    -- Par exemple, vous pouvez vérifier les groupes d'utilisateurs ou les permissions spécifiques
    return true -- Retournez true si le joueur est administrateur ou modérateur, sinon retournez false
end

-- Gère la commande /report
RegisterCommand("report", function(source, args, rawCommand)
    local reportMessage = table.concat(args, " ")
    local playerName = GetPlayerName(source)

    if reportMessage == "" then
        --TriggerClientEvent("chat:addMessage", source, { args = { "[Report]", "Veuillez entrer un message de report." } })
        TriggerClientEvent("chat:addMessage", source, { args = { "[Report]", "Utilisation: /report message" }, color = { 255, 0, 0 } })
        return
    end

    for _, playerId in ipairs(GetPlayers()) do
        if isAdminOrModerator(playerId) then
            TriggerClientEvent("chat:addMessage", playerId, { args = { "[Report] " .. playerName, reportMessage }, color = { 255, 0, 0 } })
        end
    end

    for _, playerId in ipairs(GetPlayers()) do
        if isAdminOrModerator(playerId) then
            TriggerClientEvent("chat:addMessage", playerId, { args = { "[Report] " .. playerName .. " (" .. playerId .. ")", reportMessage }, color = { 255, 0, 0 } })
        end
    end
end, false)

-- Gère la commande de réponse /r id
RegisterCommand("r", function(source, args, rawCommand)
    local playerId = tonumber(args[1])
    local responseMessage = table.concat(args, " ", 2)
    local adminName = GetPlayerName(source)

    if playerId == nil or responseMessage == "" then
        TriggerClientEvent("chat:addMessage", source, { args = { "[Report]", "Utilisation: /r id message" }, color = { 255, 0, 0 } })
        return
    end

    if GetPlayerName(playerId) == nil then
        TriggerClientEvent("chat:addMessage", source, { args = { "[Report]", "Le joueur n'est pas connecté." }, color = { 255, 0, 0 } })
        return
    end

    if isAdminOrModerator(source) then
        TriggerClientEvent("chat:addMessage", playerId, { args = { "[Réponse Report] " .. adminName .. " (" .. source .. ")", responseMessage }, color = { 0, 0, 255 } })
        TriggerClientEvent("chat:addMessage", source, { args = { "[Report]", "Votre réponse a été envoyée." }, color = { 0, 255, 0 } })
    else
        TriggerClientEvent("chat:addMessage", source, { args = { "[Report]", "Vous n'êtes pas autorisé à utiliser cette commande." }, color = { 255, 0, 0 } })
    end
end, false)