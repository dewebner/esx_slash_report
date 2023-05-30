![https://raw.githubusercontent.com/dewebner/SlashReport/main/SlashReport.PNG]
![alt text]([https://github.com/dewebner/SlashReport/blob/main/SlashReport.PNG](https://raw.githubusercontent.com/dewebner/SlashReport/main/SlashReport.PNG)?raw=true)
[What is this](SlashReport.PNG)

Nom de la ressource : SlashReport

Auteur : DeWebNer

Version : 1.0.0

Description : Cette ressource permet aux joueurs d'utiliser la commande /report 
pour signaler des problèmes ou des comportements inappropriés. 
Seuls les administrateurs et modérateurs peuvent lire les rapports.

Instructions d'installation :

1. Copiez le dossier de la ressource dans le répertoire "resources" de votre serveur FiveM.
2. Ajoutez "start SlashReport" à votre fichier "server.cfg" 
3. Redémarrez votre serveur FiveM.

Structure des fichiers :

- server/
    - main.lua : Charge le fichier report.lua lors du démarrage de la ressource.
    - report.lua : Contient le code pour gérer la commande /report et vérifier si un joueur est administrateur ou modérateur.
    - fxmanifest.lua : Déclare les scripts serveur à charger pour cette ressource.

Configuration :

Pour configurer la vérification des administrateurs et modérateurs, modifiez la fonction "isAdminOrModerator" dans le fichier "server/report.lua". Ajoutez votre propre logique pour vérifier si un joueur est administrateur ou modérateur en fonction de votre système de permissions.

Utilisation :

Les joueurs peuvent utiliser la commande /report suivie d'un message pour signaler des problèmes ou des comportements inappropriés. Par exemple :

/report Un joueur utilise des cheats.

Seuls les administrateurs et modérateurs pourront lire les rapports.

Support :

Si vous avez des questions ou rencontrez des problèmes avec cette ressource, veuillez me contacter sur Twitter: @DeWebNer
