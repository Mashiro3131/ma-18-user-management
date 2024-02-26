# Gestion des utilisateurs 

# Exercices

## Exercice 1: Création d'un Utilisateur dans Active Directory

### Objectif
Apprendre à créer un nouvel utilisateur dans Active Directory, en spécifiant les informations de base et en activant le compte.

### Consigne
- Utilisez PowerShell pour créer un nouvel utilisateur nommé Nico Mengisen. L'identifiant de l'utilisateur (SamAccountName) doit être nico.mengisen, et son mot de passe initial doit être Start1234!. Le compte utilisateur doit être activé dès sa création.

### Solution
```powershell
New-ADUser -Name "Nico Mengisen" -GivenName "Nico" -Surname "Mengisen" -SamAccountName "nico.mengisen" -UserPrincipalName "nico.mengisen@leDomaine.ch" -AccountPassword (ConvertTo-SecureString -AsPlainText "Start1234!" -Force) -Enabled $true -PasswordNeverExpires $false
```
## Exercice 2: Modification d'Attributs d'un Utilisateur

### Objectif
Maîtriser la modification d'attributs pour un utilisateur existant dans Active Directory.

### Consigne
- Modifiez l'adresse e-mail et le titre de l'emploi de l'utilisateur nico.mengisen. La nouvelle adresse e-mail doit être a.mengisen@votreDomaine.ch et le titre Ingénieur Système.

### Solution
```powershell
Set-ADUser -Identity "nico.mengisen" -EmailAddress "n.mengisen@votreDomaine.ch" -Title "Ingénieur Système"
```
## Exercice 3: Réinitialisation du Mot de Passe d'un Utilisateur
### Objectif
- Apprendre à réinitialiser et à imposer le changement de mot de passe à la prochaine connexion de l'utilisateur.

### Consigne
- Écrivez un script PowerShell pour réinitialiser le mot de passe de l'utilisateur nico.mengisen à NewPa$$w0rd2024!. L'utilisateur doit être contraint de changer ce mot de passe lors de sa prochaine connexion.

### Solution
```powershell
Set-ADAccountPassword -Identity "nico.mengisen" -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "NewPassword2024!" -Force) -PassThru | Set-ADUser -ChangePasswordAtLogon $true
```

# TODO (En cours)
- Créer une VM avec Windows Server 2022 (MA18-SRV1)
Ajouter un utilisateur

# Finalisation
## Créer script python avec les option utilisateurs (Y/n) main.py
Dans le main.py on va venir chercher les scripts powershell dans le dossier src puis en fonction des options choisies on va venir executer les scripts powershell puis créer les options choisies.

### Option à intégrer

1. Demander le nom du domaine


# Active Directory

## SRV1
### Configuration

1. Sur le SRV181, utilisez la zone libre de votre disque pour y créer un disque D:\ nommé DATA.
Revoyez les droits pour en laisser le moins possible à la racine du disque D

2. Créer la structure de dossier pour correspondre aux informations à votre disposition.

3. Chaque département et sous-département aura son propre dossier de service.

4. Préparez dans votre structure de dossier un dossier "Profils" et un dossier "Utilisateurs".

5. Le dossier "Profils" contiendra les profils itinérants de vos utilisateurs
    * Créer un dossier "Profils" dans D:\DATA
    * Ajouter les profils itinérants
        * Script Standard:
        ```powershell
        # Recupère tous les utilisateurs de l'AD (excluant l'administrateur)
        $Utilisateurs = Get-ADUser -Filter {(SamAccountName -ne "Administrateur")}
        foreach ($Utilisateur in $Utilisateurs) {
            $ProfilePath = "\\MA18\Profils$\$($Utilisateur.SamAccountName)"
        ```    

6. Le dossier "Utilisateurs" contiendra les données personelles de chaque utilisateur et sera accessible uniquement par l'utilisateur. Il sera mappé plus tard dans la session de l'utilisateur sous la lettre P:\
    * Créer un dossier "Utilisateurs" dans D:\DATA
    * Créer un lecteur mappé P:\




## SRV2


## Utilisateurs
- Marc Muller
- Valérie Vincent
- Murielle Jaton
- Marianne Hasler
- José Dorthe
- Jürg Häfeli
- Jean-Michel Blaser
- Blaise Simon
- Jaques Yerly
- Marel Wächter
- Roland During
- AdminIT
- Anner Blaser
- Isabelle CRAUSAZ

## Unité d'organisation

- DG
- DÉVELOPPEMENT / CONTRÔLE QUALITÉ
- RH
- APPROVISIONNEMENT
- PRODUCTION
- VENTE / MARKETING
    - SUISSE LATINE
    - SUISSE ALÉMANIQUE / BONVITA AG
    - INDUSTRIE / STEINER MÜHLE AG
- LOGISTIQUE
- FINANCES / SERVICES DE SUPPORT
    - Informatique
    - Back-Office
    - Compatbilité



## Utilisateurs par unité d'organisation
```
├── DG :
│   └── Marc Muller
│
├── DÉVELOPPEMENT / CONTRÔLE QUALITÉ :
│   └── Valérie Vincent
│
├── RH : 
│   ├── Murielle Jaton
│   └── Marianne Hasler
│
├── APPROVISIONNEMENT
│   └── José Dorthe
│
├── PRODUCTION
│   └── Jürg Häfeli
│
├── VENTE / MARKETING
│   └── SUISSE LATINE
│       └── Jaques Yerly
│
├── SUISSE ALÉMANIQUE / BONVITA AG
│   └── Marcel Wächter
│
├── INDUSTRIE / STEINER MÜHLE AG
│   └── Roland Dürring
│
├── LOGISTIQUE
│   └── Jean-Michel Blaser
│
└── FINANCES / SERVICES DE SUPPORT
    ├── Blaise Simon
    |
    └── Informatique:
    │   └── AdminIT
    ├── Back-Office: 
    │   └── Anne Blaser
    └── Compatbilité
        └── Isabelle Crausaz
```

# Option du menu powershell


# Créer un nouveau disque D: nommé DATA
New-Partition -DiskNumber 0 -UseMaximumSize -AssignDriveLetter -DriveLetter D
Format-Volume -DriveLetter D -FileSystem NTFS -NewFileSystemLabel "DATA"


Write-Host "Menu d'options:"
Write-Host "1. Créer un disque D:\ nommé DATA sur le SRV181"
Write-Host "2. Créer la structure de dossiers correspondante"
Write-Host "3. Créer les dossiers de service pour chaque département et sous-département"
Write-Host "4. Préparer les dossiers 'Profils' et 'Utilisateurs' dans la structure"
Write-Host "5. Ajouter les profils itinérants dans le dossier 'Profils'"
Write-Host "6. Créer le dossier 'Utilisateurs' et mapper le lecteur P:\"

$option = Read-Host "Sélectionnez une option (1-6)"

switch ($option) {
    1 {
        # Option 1: Créer un disque D:\ nommé DATA sur le SRV181
        New-Partition -DiskNumber 0 -UseMaximumSize -AssignDriveLetter -DriveLetter D
        Format-Volume -DriveLetter D -FileSystem NTFS -NewFileSystemLabel "DATA"
        break
    }
    2 {
        # Option 2: Créer la structure de dossiers correspondante
        # Code pour créer la structure de dossiers ici
        break
    }
    3 {
        # Option 3: Créer les dossiers de service pour chaque département et sous-département
        # Code pour créer les dossiers de service ici
        break
    }
    4 {
        # Option 4: Préparer les dossiers 'Profils' et 'Utilisateurs' dans la structure
        # Code pour préparer les dossiers 'Profils' et 'Utilisateurs' ici
        break
    }
    5 {
        # Option 5: Ajouter les profils itinérants dans le dossier 'Profils'
        # Code pour ajouter les profils itinérants ici
        break
    }
    6 {
        # Option 6: Créer le dossier 'Utilisateurs' et mapper le lecteur P:\
        # Code pour créer le dossier 'Utilisateurs' et mapper le lecteur P:\ ici
        break
    }
    default {
        Write-Host "Option invalide. Veuillez sélectionner une option valide."
        break
    }
}
