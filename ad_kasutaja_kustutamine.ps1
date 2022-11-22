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
#user principal name
$upname = $username + "@roland.is22.com"
#display  name - eesnimi + perenimi
$displayname = $user.FirstName + " " + $user.LastName
Remove-ADUser $username
if( $? ) {
	# True, last operation succeeded
echo "Kasutaja $username kustutatud"
}

if( !$? ) {
	# Not True, last operation failed
echo "Kasutajat $username pole olemas."
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