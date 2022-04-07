#CODER BY xiaoyao9184 1.0
#TIME 2017-03-24
#FILE Set-LocalDB-Timeout
#DESC Set LocalDB Timeout by name

$sqlFile = "$PSScriptRoot\Set-LocalDB-Timeout.sql"

Function Set-LocalDB-Timeout($ldb_instance,[string]$username,[string]$password) {
    $pipname = $PSScriptRoot + "\Get-LocalDB-PipeName.ps1"
    . $pipname
    $pipe = Get-LocalDB-PipeName $ldb_instance
    
    while(!$username){
        Write-Host "Need input username for connect:"
        $username = Read-Host
    }
    while(!$password){
        Write-Host "Need input password for connect:"
        $password = Read-Host
    }
    

    # exec sql
    $ldb_sqlcmd_result = Invoke-Expression "sqlcmd -S '$pipe' -U '$username' -P '$password' -i '$sqlFile'"
    Write-Host $ldb_sqlcmd_result

    return $pipe
}

#Run alone by default
$CallStack = Get-PSCallStack | Where-Object  {$_.Command -ne "<ScriptBlock>"}
if($CallStack.Count -eq 1){
    $pipe = @()
    $pipe = Set-LocalDB-Timeout
    Write-Host "Set done in $pipe, any key to exit"
    Read-Host | Out-Null
    Exit
}