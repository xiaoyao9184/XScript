#CODER BY xiaoyao9184 1.0
#TIME 2017-03-24
#FILE Get-LocalDB-PipeName
#DESC Get LocalDB PipeName by name

Function Get-LocalDB-PipeName($ldb_instance) {
    $get = $PSScriptRoot + "\Get-LocalDB.ps1"
    . $get

    if(!$ldb_instance){
        $ldb_instance = Get-LocalDB
    }
    if($ldb_instance.GetType().Name -eq 'String'){
        $ldb_instance = Get-LocalDB $ldb_instance
    }
    if(!$ldb_instance.InstancePipeName){
        $start = $PSScriptRoot + "\Start-LocalDB.ps1"
        . $start
        Start-LocalDB $ldb_instance.Name
        $ldb_instance = Get-LocalDB $ldb_instance.Name
    }
    return $ldb_instance.InstancePipeName
}

#Run alone by default
$CallStack = Get-PSCallStack | Where-Object  {$_.Command -ne "<ScriptBlock>"}
if($CallStack.Count -eq 1){
    $pipe = Get-LocalDB-PipeName
    $pipe | clip.exe
    Write-Host "Has been copied $pipe to the clipboard, any key to exit"
    Read-Host | Out-Null
    Exit
}