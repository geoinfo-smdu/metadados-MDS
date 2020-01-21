$files = Get-ChildItem -Path ".\MDS_final"

foreach ($f in $files) {
    if (Test-Path -Path $(".\MDS_pdal_info\metadata_" + $f.BaseName + ".json")) {
        Write-Host $("Arquivo " + ".\MDS_pdal_info\metadata_" + $f.BaseName + ".json já existe!")
        Continue
    } else {
        Write-Host $("Gerando PDAL Info de " + $f.Name)
        pdal.exe info --metadata $f.FullName > $(".\MDS_pdal_info\metadata_" + $f.BaseName + ".json")    
    }
}