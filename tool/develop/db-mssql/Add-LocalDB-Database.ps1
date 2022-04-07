#CODER BY xiaoyao9184 1.0
#TIME 2017-03-24
#FILE Add-LocalDB-Database
#DESC Add LocalDB Database by name

$sqlFile = "$PSScriptRoot\Add-LocalDB-Database.sql"

Function Add-LocalDB-Database($ldb_instance,$db_name,$db_username,$db_password) {
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

    while(!$db_name){
        Write-Host "Need input database name for create:"
        $db_name = Read-Host
    }

    $template = (Get-Content "$sqlFile") | Out-String
    $data = Invoke-Expression "`"$template`""
    $tempsql = New-TemporaryFile
    $data | Out-File $tempsql
    Write-Host "sql file is: $tempsql"

    # exec sql
    $ldb_sqlcmd_result = Invoke-Expression "sqlcmd -S '$pipe' -U '$username' -P '$password' -i '$sqlFile'"
    Write-Host $ldb_sqlcmd_result

    return $pipe, $db_name
}

#Run alone by default
$CallStack = Get-PSCallStack | Where-Object  {$_.Command -ne "<ScriptBlock>"}
if($CallStack.Count -eq 1){
    $pipe = @()
    $db_name = @()
    $pipe,$db_name = Add-LocalDB-Database
    Write-Host "create $db_name in $pipe"
    Read-Host | Out-Null
    Exit
}