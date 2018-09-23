
Import-Module ActiveDirectory
$exit= ""
While ($exit -ne "q")
{   
    #input data
    $firstname= Read-Host -Prompt "input ur fname"
    $lastname = Read-Host -Prompt "input ur lastname"
    #create standard pass, users are forced to change when logging in
    $password = "Admin1234"

    echo "ur full name is $firstname $lastname . Yr password is $password"
    
    #define location 
    $OUpath = "OU=PowerShellUsers,DC=itflee,DC=com"
    
    #hash password
    $securePassord = ConvertTo-SecureString $password -AsPlainText -Force
    
    #create new AD user
    New-ADUser -Name "$firstname $lastname" -GivenName "$firstname" -Surname "$lastname" -UserPrincipalName "$firstname.$lastname" -Path $OUpath -AccountPassword $securePassord -ChangePasswordAtLogon $true -Enabled $true
    $exit = Read-Host -Prompt "type q to exit"
}