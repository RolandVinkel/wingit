#location of AD users file
$file = "C:\Users\Administrator\Desktop\adkasutajad.csv"
#import file content
$users = Import-Csv $file -Encoding Default -Delimiter ";"
#foreach user data row in file
foreach ($user in $users){
#username is fristname.lastname
$username = $user.FirstName + "." + $user.LastName
$username = $username.ToLower()
$username = Translit($username)
$passwd = Get-Passwd($passwd)
#user principal name
$upname = $username + "@roland.is22.com"
#display  name - eesnimi + perenimi
$displayname = $user.FirstName + " " + $user.LastName
New-ADUser -Name $username `
    -DisplayName $displayname `
    -Givenname $user.FirstName `
    -Surname $user.LastName `
    -Department $user.Department `
    -Title $user.Role `
    -UserPrincipalName $upname `
    -AccountPassword (ConvertTo-SecureString $passwd -AsPlainText -Force)
if( $? ) {
	# True, last operation succeeded
echo "Kasutaja $username loodud"
 $username + ";" + $passwd | Out-File -Append -FilePath '.\Desktop\ADkausutajad with random passwd.txt'
}

if( !$? ) {
	# Not True, last operation failed
echo "kasutaja $username on juba kasutuses"
}
}

#function translit UTF-8 characters to LATIN
function Translit {
param(
[string] $inputstring
)
#define the caracters wich have to be translited
$Translit = @{
[char]'ä' = "a"
[char]'ö' = "o"
[char]'ü' = "u"
[char]'õ' = "o"
}
#create translited output
$outputstring=""
#transfer string to array of caracters and by characters
foreach ($character in $inputCharacter = $inputstring.ToCharArray())
{
#if character is exsists in line of characters for
if ($Translit[$character] -cne $null ){
#add to output translited character
$outputstring += $Translit[$character]
} else {
#otherwise add the initial character
$outputstring += $character
}
}
Write-Output $outputstring
}
function Get-Passwd{
# Import System.Web assembly
Add-Type -AssemblyName System.Web
# Generate random password
[System.Web.Security.Membership]::GeneratePassword(14,2)
}
