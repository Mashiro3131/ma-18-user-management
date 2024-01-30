# Gestion des utilisateurs 

# TODO
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
