#CODER BY xiaoyao9184 1.0
#TIME 2017-03-24
#FILE Start-LocalDB
#DESC Start-LocalDB by name

Function Start-LocalDB([string]$name) {
    if(!$name){
        $get = $PSScriptRoot + "\Get-LocalDB.ps1"
        . $get
        $ldb_instance = Get-LocalDB
        $name = $ldb_instance.Name
    }
    $msg = Invoke-Expression "sqllocaldb s '$name'"
    Write-Host $msg
}

#Run alone by default
$CallStack = Get-PSCallStack | Where-Object  {$_.Command -ne "<ScriptBlock>"}
if($CallStack.Count -eq 1){
    Start-LocalDB
    Write-Host "Any key to exit"
    Read-Host | Out-Null
    Exit
}