function CheckLoadedModule {
    Param( [parameter(Mandatory = $true)][alias("Module")][string]$ModuleName)
    $LoadedModules = Get-Module | Select-Object Name
    if (!$LoadedModules -like "*$ModuleName*") { Import-Module -Name $ModuleName -Force }
}