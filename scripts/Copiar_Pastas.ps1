$las_infos = Get-ChildItem -Path ".\MDS_lasinfo"
$pdal_infos = Get-ChildItem -Path ".\MDS_pdal_info"
$pdal_stats = Get-ChildItem -Path ".\MDS_pdal_stats"

foreach ($files in @($las_infos, $pdal_infos, $pdal_stats)) {
    foreach ($f in $files) {
        $scm = $f.BaseName.Substring($f.BaseName.Length - 8, 8)
        Write-Host $scm
        if (!(Test-Path -Path $('.\MDS\' + $scm))) {
            New-Item -ItemType directory -Path $('.\MDS\' + $scm)
        }
        Copy-Item -Path $li.FullName -Destination $('.\MDS\' + $scm + '\' + $f.Name)
    }
}
