function GetAllHistory {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [String]
        $Search = $null
    )
    $History = Get-Content ((Get-PSReadlineOption).HistorySavePath) -ReadCount 10000
    if ($Search) {
        $History | Select-String -Pattern $Search | Sort-Object -Unique
    }
    else {
        $History | Sort-Object -Unique
    }
    
}