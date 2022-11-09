$KasutajaParool = convertto-securestring "Qweasdzxc1!" -asplaintext -force

New-LocalUser "Kasutaja1" -Password $KasutajaParool -fullname "roland" -Description "local account - kasutaja1"