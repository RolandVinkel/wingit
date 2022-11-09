#defineerime vajaliku käsurea parameetrid
param(
$Kasutajanimi,
$Taisnimi,
$KontoKirjeldus
)
#loome kasutajale parooli
$KasutajaParool = ConvertTo-SecureString "Qweasdzxc1!" -AsPlainText -Force
#lisame kasutaja vastavate andmetega
New-LocalUser "$Kasutajanimi" -Password $KasutajaParool -FullName "$Taisnimi" -Description "$KontoKirjeldus"
#.\kasutaja_loomine_1.ps1 kasutaja2 "esimene kasutaja" "Konto lokaalseks kasutamiseks"