#CODER BY xiaoyao9184 1.0
#TIME 2017-03-24
#FILE Get-LocalDB
#DESC Get LocalDB

[regex]$dbName = "^Name:.*|^名称:.*"
[regex]$dbVersion = "^Version:.*|^版本:.*"
[regex]$dbSharedName = "^Shared name:.*|^共享名称:.*"
[regex]$dbOwner = "^Owner:.*|^所有者:.*"
[regex]$dbAutoCreate = "^Auto-create:.*|^自动创建:.*"
[regex]$dbState = "^State:.*|^状态:.*"
[regex]$dbLastStartTime= "^Last start time:.*|^上次启动时间:.*"
[regex]$dbInstancePipeName = "^Instance pipe name:.*|^实例管道名称:.*"


Function DEBUG-Write-Array($msg,$array) {
    if ($host.name -match 'ISE'){
        if($array -is [system.array]){
            Write-Host $msg $array.Count
        }else{
            Write-Host $msg
        }
        Write-Host ($array | Out-String)
    }
}

Function Get-LocalDB-Version {
    [array]$result = Invoke-Expression "sqllocaldb v"
    DEBUG-Write-Array "SqlLocalDB count is" $result
    return $result
}

Function Get-LocalDB-Info {
    [array]$result = Invoke-Expression "sqllocaldb i"
    DEBUG-Write-Array "SqlLocalDB count is" $result
    return $result
}

Function Get-LocalDB-Details {
    Param()
    $ldb_instances=@()
    [array]$ldb_versions = Get-LocalDB-Version
    [array]$ldb_instance_names = Get-LocalDB-Info
    foreach ($ldb_instance_name in $ldb_instance_names) {
        try {
            $ErrorActionPreference = 'Stop'
            $ldb_instance_details = Invoke-Expression "sqllocaldb i '$ldb_instance_name'"
        }
        catch {
            #Write-Warning "Oops: $_"
        }
        
        $obj = New-Object Object
        foreach ($line in $ldb_instance_details) {
            switch -regex ($line) {
                $dbName                {$obj | Add-Member Noteproperty Name -value $line.Substring($line.IndexOf(":")+1).Trim()}
                $dbVersion             {$obj | Add-Member Noteproperty Version -value $line.Substring($line.IndexOf(":")+1).Trim()}
                $dbSharedName          {$obj | Add-Member Noteproperty SharedName -value $line.Substring($line.IndexOf(":")+1).Trim()}
                $dbOwner               {$obj | Add-Member Noteproperty Owner -value $line.Substring($line.IndexOf(":")+1).Trim()}
                $dbAutoCreate          {$obj | Add-Member Noteproperty AutoCreate -value $line.Substring($line.IndexOf(":")+1).Trim()}
                $dbState               {$obj | Add-Member Noteproperty State -value $line.Substring($line.IndexOf(":")+1).Trim()}
                $dbLastStarTime        {$obj | Add-Member Noteproperty LastStartTime -value $line.Substring($line.IndexOf(":")+1).Trim()}
                $dbInstancePipeName    {$obj | Add-Member Noteproperty InstancePipeName -value $line.Substring($line.IndexOf(":")+1).Trim()}
                Default                {}
            }
        }
        if([bool]($obj.PSobject.Properties.name -match "Name")){
            $obj | Add-Member Noteproperty FullName -value $ldb_versions[$ldb_instances.Count]
            $ldb_instances+=$obj
        }
    }
    return $ldb_instances
}

Function Get-LocalDB([string]$name){
    $ldb_instances = Get-LocalDB-Details
    $ldb_instance = $ldb_instances
    while($ldb_instance.Count -ne 1){
        if(!$name){
            Write-Host ($ldb_instances | Out-String)
        }
        while(!$name){
            Write-Host Enter LocalDB instance name
            $name = Read-Host
        }
        $ldb_instance = $ldb_instances | Where-Object {$_.Name -eq $name}
        Remove-Variable name
    }
    return $ldb_instance
}


#Run alone by default
$CallStack = Get-PSCallStack | Where-Object  {$_.Command -ne "<ScriptBlock>"}
if($CallStack.Count -eq 1){
    Get-LocalDB-Details
    Write-Host "Any key to exit"
    Read-Host | Out-Null
    Exit
}