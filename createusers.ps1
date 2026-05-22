$users = Import-Csv "C:\users.csv"

foreach ($user in $users) {
    $username = ($user.FirstName[0] + $user.LastName).ToLower()
    $password = ConvertTo-SecureString "Welcome1!" -AsPlainText -Force
    $ou = "OU=$($user.OU),DC=lab,DC=local"

    New-ADUser `
        -GivenName $user.FirstName `
        -Surname $user.LastName `
        -Name "$($user.FirstName) $($user.LastName)" `
        -SamAccountName $username `
        -UserPrincipalName "$username@lab.local" `
        -Path $ou `
        -Department $user.Department `
        -AccountPassword $password `
        -Enabled $true

    Write-Host "Created user: $username in $ou"
}