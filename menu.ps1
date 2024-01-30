$MyMenu = $true
while ($MyMenu) {
    write-host "--------------------What would you like to do ?-------------------"
    write-host "#                        1: Partition Disk                     #"
    write-host "#               2: Create OU            #"
    write-host "#               3: Create Sub OU            #"
    write-host "#                              x: exit                           #"
    write-host "------------------------------------------------------------------"
    $MenuChoice = Read-Host "Choose an option:"
    switch ($MenuChoice) {
        
        # Partition Disk
        1 { 


        # export data
        }

        'x'{$MyMenu = $false}
        
        default {
            Write-Host "Invalid choice"-ForegroundColor Red
        }

}
