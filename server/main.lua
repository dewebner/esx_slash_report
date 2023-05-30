-- Charger le fichier report.lua
AddEventHandler("onResourceStart", function(resourceName)
    if GetCurrentResourceName() == resourceName then
        print("Chargement du fichier report.lua...")
        local reportFile = LoadResourceFile(GetCurrentResourceName(), "report.lua")
        if reportFile then
            assert(load(reportFile))()
            print("Fichier report.lua chargé avec succès.")
        else
            print("Erreur lors du chargement du fichier report.lua.")
        end
    end
end)
