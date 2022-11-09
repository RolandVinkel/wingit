$Fail = "C:\Users\Administrator\Desktop\kasutajad.csv"
$Kasutajad = Import-Csv $Fail -Encoding Default -Delimiter ";"
foreach ($kasutaja in $kasutajad)
{
$Kasutajanimi = $kasutaja.Kasutajanimi
$Taisnimi = $kasutaja.Taisnimi
$Kontokirjeldus = $kasutaja.KontoKirjeldus
$Parool = $kasutaja.Parool | ConvertTo-SecureString -AsPlainText -Force
New-LocalUser "$Kasutajanimi" -Password $Parool -Fullname "$Taisnimi" -Description "$Kontokirjeldus"
}


