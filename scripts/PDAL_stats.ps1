$files = Get-ChildItem -Path ".\MDS_final"

foreach ($f in $files) {
    if (Test-Path -path $(".\MDS_pdal_stats\stats_" + $f.BaseName + ".json")) {
        Write-Host $("Arquivo" + $f.FullName + " existente!")
        continue
    } else {
        Write-Host $("Gerando PDAL Stats de " + $f.Name)
        pdal.exe info --stats $f.FullName > $(".\MDS_pdal_stats\stats_" + $f.BaseName + ".json")
    }
}