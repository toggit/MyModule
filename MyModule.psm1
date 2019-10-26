write-Verbose "Importing Functions"

# Import everything in these folders
foreach ($folder in @('private', 'public', 'classes')) {
    
    $root = Join-Path -Path $PSScriptRoot -ChildPath $folder
    if (Test-Path -Path $root) {
        Write-Verbose "processing folder $root"
        $files = Get-ChildItem -Path $root -Filter *.ps1

        # dot source each file
        $files | where-Object { $_.name -NotLike '*.Tests.ps1' } | 
        ForEach-Object { Write-Verbose $_.name; . $_.FullName }
}
}

# force you to put 1 function per file
Export-ModuleMember -Function (Get-ChildItem -Path "$PSScriptRoot\public\*.ps1").basename

#$module = @{
#    Author = 'Tomer test' 
#    Description = 'Test Helper Modules' 
#    RootModule = 'MyModule.psm1'
#    Path = 'MyModuke.psd1'
#    ModuleVersion = '1.0.0'
#}
#New-ModuleManifest @module