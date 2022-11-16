Echo "Sisesta Eesnimi"
$eesnimi = Read-Host
Echo "Sisesta perenimi"
$perenimi = Read-Host
$kasutajanimi = $eesnimi.ToLower() + "." + $perenimi.ToLower()
$taisnimi = $eesnimi + "." + $perenimi
Echo "loodav kasutaja on $kasutajanimi"
Echo "Lisa kommentaar"
$kommentaar = Read-Host   
Echo "Sisesta password"
$password = Read-Host -AsSecureString
$ErrorActionPreference = "Silentlycontinue"
New-LocalUser -Name $kasutajanimi -Password $password -FullName $taisnimi -Description $kommentaar 
if(!$?) {
Echo "viga, tee õieti."
}
ErrorActionPreference = 'Stop'



