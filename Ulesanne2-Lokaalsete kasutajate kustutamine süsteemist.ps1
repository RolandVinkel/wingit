Echo "Sisesta Eesnimi"
$eesnimi = Read-Host
Echo "Sisesta perenimi"
$perenimi = Read-Host
$kasutajanimi = $eesnimi.ToLower() + "." + $perenimi.ToLower()
Echo "kustutav kasutaja on $kasutajanimi"
$ErrorActionPreference = "Silentlycontinue"
Remove-LocalUser -Name $kasutajanimi
if(!$?) {
Echo "Tekkinud probleem kasutaja kustutamisega"
}else{
Echo "kasutaja kustutatud"
}
ErrorActionPreference = 'Stop'