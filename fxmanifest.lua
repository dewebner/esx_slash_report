fx_version 'cerulean'
game 'gta5'

author 'DeWebNer'
description 'ajout une simple commande /report'
version '1.0.0'

server_scripts {
    'server/main.lua',
    'report.lua'
}



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
        TriggerClientEvent("chat:addMessage", source, { args = { "[Report]", "Veuillez entrer un message de report." } })
        return
    end

    for _, playerId in ipairs(GetPlayers()) do
        if isAdminOrModerator(playerId) then
            TriggerClientEvent("chat:addMessage", playerId, { args = { "[Report] " .. playerName, reportMessage } })
        end
    end
end, false)
