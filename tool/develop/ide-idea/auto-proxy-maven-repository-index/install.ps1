
#region 强迫以管理员权限运行
$currentWi = [Security.Principal.WindowsIdentity]::GetCurrent()
$currentWp = [Security.Principal.WindowsPrincipal]$currentWi

if( -not $currentWp.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    Write-Host '将请求管理员权限'
    $boundPara = ($MyInvocation.BoundParameters.Keys | foreach{
        '-{0} {1}' -f  $_ ,$MyInvocation.BoundParameters[$_]} ) -join ' '
    $currentFile = (Resolve-Path  $PSCommandPath).Path

    $fullPara = $boundPara + ' ' + $args -join ' '
    Start-Process "$psHome\powershell.exe"   -ArgumentList "$currentFile $fullPara"   -verb runas
    return
}
#endregion


#region定义变量
$Tip = @'
auto-proxy-maven-repository-index
xiaoyao9184




******************************
条件：
解锁PowerShell运行脚本限制
管理员权限
本机已经安装IIS

原理：
使用PowerShell模块Carbon改HOST重定向 远程官方 到 本地IIS
******************************

'@
$WaitTip = @'

******************************
现在可以使用IDE更新索引文件了！

注意：
1、IDEA可能在更新完毕后卡死，直接继续此脚本即可
******************************

跟新完毕请按任意键继续！

'@
#endregion


#region Tip
if($args.Count -eq 0)
{
    Write-Host $Tip
}
#endregion


#region 引入模块
Write-Host '引入Carbon模块...'
Install-Module -Name 'Carbon'
#endregion


#region 移除HOST
Write-Host '移除已经存在的HOST'
Remove-HostsEntry -HostName 'repo1.maven.org'
#endregion


#region 更新index
Write-Host '更新本地索引'
& $PSScriptRoot\update.ps1 "noexit"
#endregion


#region 复制到IIS
Write-Host '更新IIS索引'
& $PSScriptRoot\copy.ps1 "noexit"
#endregion


#region 添加HOST
Write-Host 'HOST重定向到本地 repo1.maven.org -> 127.0.0.1'
Set-HostsEntry -IPAddress 127.0.0.1 -HostName 'repo1.maven.org' -Description "maven index"
#endregion


#region显示网站
Start-Process "http://repo1.maven.org/maven2"
Write-Host $WaitTip
Read-Host
Remove-HostsEntry -HostName 'repo1.maven.org'
#endregion


#region Exit
if($args.Count -eq 0)
{
    Write-Host  '执行完毕,按任意键退出...'
    Read-Host
}
#endregion
