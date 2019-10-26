Function SearchByName {
    [cmdletbinding(
        DefaultParameterSetName = 'Group1'
    )]
    Param(
        [Parameter(mandatory = $true, Position = 0)]
        [System.Array]$Contents,
        [Parameter(mandatory = $true, Position = 1)]
        [String]$SearchItem
    )
    $results = $Contents | Select-Object Name, CreationTime, Extension | Where-Object { $_.Name -like $SearchItem }
    return $results
}