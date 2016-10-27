
#region定义变量
$Tip = @'
auto-proxy-maven-repository-index
copy
xiaoyao9184

加载索引文件到IIS

'@
$IndexVersionFile = "$PSScriptRoot\maven2\.index\nexus-maven-repository-index.properties"
$IndexFile = "$PSScriptRoot\maven2\.index\nexus-maven-repository-index.gz"
$IISRoot = "C:\inetpub\wwwroot\"
$IISIndexVersionFile = "$IISRoot\maven2\.index\nexus-maven-repository-index.properties"
$IISIndexFile = "$IISRoot\maven2\.index\nexus-maven-repository-index.gz"
$IISWebConfigFile = "$IISRoot\maven2\web.config"
$LocalMaven = "$PSScriptRoot\maven2"
$IndexVersionRegex = [regex]"\d+.\d+"
#本地版本
$IISIndexVersionDate = [decimal]1
#endregion


#region Tip
if($args.Count -eq 0)
{
    Write-Host $Tip
}
#endregion


#region 引入模块
Write-Host '引入WebAdministration模块...'
Import-Module WebAdministration
#endregion


#region 检查IIS服务
Write-Host '检查IIS...'
if (!(Get-Service "W3SVC" -ErrorAction SilentlyContinue))
{
    Write-Host "W3SVC 服务不存在，IIS未安装！"
    return
}
if( !(Test-Path "IIS:\AppPools\DefaultAppPool"))
{
    Write-Host "IIS DefaultAppPool默认程序池不存在！"
    Start-Process -file $env:windir\System32\mmc.exe -workingdirectory $PSHOME -ArgumentList $env:windir\system32\inetsrv\iis.msc -verb runas
    return
}
#endregion


#region 更新IIS版本
Write-Host '更新IIS版本...'
if( (Test-Path $IISRoot\maven2) -and (Test-Path $IISWebConfigFile) -and (Test-Path $IISIndexVersionFile) -and (Test-Path $IISIndexFile))
{
    $LocalIndexProps = ConvertFrom-StringData(Get-Content $IndexVersionFile -raw)
    $LocalIndexVersion = $LocalIndexProps.'nexus.index.timestamp'
    $LocalIndexVersionDate = [decimal]$IndexVersionRegex.Matches($LocalIndexVersion)[0].Value

    $IISIndexProps = ConvertFrom-StringData(Get-Content $IndexVersionFile -raw)
    $IISIndexVersion = $IISIndexProps.'nexus.index.timestamp'
    $IISIndexVersionDate = [decimal]$IndexVersionRegex.Matches($IISIndexVersion)[0].Value   

    if( $LocalIndexVersionDate -gt $IISIndexVersionDate)
    {
        Write-Host "IIS版本更新：$IISIndexVersion -> $LocalIndexVersion"
        Copy-Item $PSScriptRoot\maven2 $IISRoot -recurse
        Write-Host "更新完毕"
    }
    else
    {
        Write-Host "IIS版本已经是最新版本"
    }
}
else
{
    Write-Host "IIS版本更新：$IISIndexVersion -> $LocalIndexVersion"
    Copy-Item $PSScriptRoot\maven2 $IISRoot -recurse
    Write-Host "更新完毕"
}



#endregion


#region 重启程序池
Write-Host "重启IIS：DefaultAppPool..."
$targetpool = Get-item "IIS:\AppPools\DefaultAppPool"
if( $targetpool.state.Equals("Stopped"))
{
    $targetpool.Start() 
}else
{
    Restart-WebAppPool DefaultAppPool
    <#
    #同理
    $targetpool.Stop()
    $targetpool.Start()
    #>
}
#endregion


#region 重启IIS
Write-Host "重启IIS..."
iisreset

<#
$iis = Get-WmiObject Win32_Service -ComputerName $vm -Filter "name='IISADMIN'"
if($iis.State -eq "Running")
{
    Write-Host "IIS is running on $vm"
}
else
{
    Write-Host "IIS is not running on $vm"
    Write-Host "IIS不存在"
    return
}
#>

#endregion


#region Exit
if($args.Count -eq 0)
{
    #显示网站
    Start-Process "http://localhost/maven2"
    Write-Host  '执行完毕,按任意键退出...'
    Read-Host
}
#endregion







