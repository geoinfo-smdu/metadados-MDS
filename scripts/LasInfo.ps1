$lastools_path = "C:\LasTools\LAStools\bin\"

$files = Get-ChildItem -Path ".\MDS_final"

foreach ($f in $files) {
    if (Test-Path -path $(".\MDS_lasinfo\lasinfo_" + $f.BaseName + ".txt")) {
        Write-Host $("Arquivo" + $f.FullName + " existente!")
        continue
    } else {
        Write-Host $("Gerando LasInfo de " + $f.Name)
        & $($lastools_path +  "lasinfo.exe") $f.FullName -stdout > $(".\MDS_lasinfo\lasinfo_" + $f.BaseName + ".txt")
    }
}