Import-Module ActiveDirectory

#read from CSV file
$filepath = Read-Host -Prompt "Enter CSV path:"
$users = Import-Csv $filepath

#default password 
$securePassword= ConvertTo-SecureString "TestingPass123" -AsPlainText -Force

#Lop for each user in user list
foreach ($user in $users) 
{
    $fname= $user.'First Name'
    $lname = $user.'Last Name'
    $email = $user.'Email Address'
    $jtitle = $user.'Job Title'
    $officeCell= $user.'Office Phone'
    $description = $user.Description
    $OUpath= $user.'Organizational Unit'

    echo "Account created for $fname $lname in $OUpath"

    #create new AD User
    New-ADUser -Name "$fname $lname" -GivenName $fname -Surname $lname -UserPrincipalName "$fname.$lname" -Path $OUpath -AccountPassword $securePassword -ChangePasswordAtLogon $true -OfficePhone $officeCell -Description $description -Enabled $true -EmailAddress $email 
}
