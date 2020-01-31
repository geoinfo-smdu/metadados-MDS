$pdal_infos = Get-ChildItem -Path ".\MDS_pdal_info"
$json_out = @()

foreach ($p in $pdal_infos) {
    $json_in = Get-Content $p.FullName | Out-String | ConvertFrom-Json
    $bbMinMax = @{
        $p.BaseName.Substring(13, 8) = @{
            'minx' = $json.metadata.minx;
            'miny' = $json.metadata.miny;
            'minz' = $json.metadata.minz;
            'maxx' = $json.metadata.maxx;
            'maxy' = $json.metadata.maxy;
            'maxz' = $json.metadata.maxz
        }
    }
    $json_out += $bbMinMax
}

ConvertTo-Json -InputObject $json_out > bb_min_max.json