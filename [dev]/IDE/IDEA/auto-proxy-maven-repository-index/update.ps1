
#region定义变量
$Tip = @'
auto-proxy-maven-repository-index
update
xiaoyao9184

更新本地索引文件

'@
$IndexVersionURL = 'http://repo1.maven.org/maven2/.index/nexus-maven-repository-index.properties'
$IndexVersionFile = "$PSScriptRoot\maven2\.index\nexus-maven-repository-index.properties"
$TempIVF = "$env:temp\nexus-maven-repository-index.properties"
$IndexURL = 'http://repo1.maven.org/maven2/.index/nexus-maven-repository-index.gz'
$IndexFile = "$PSScriptRoot\maven2\.index\nexus-maven-repository-index.gz"
$TempIF = "$env:temp\nexus-maven-repository-index.gz"
$IndexVersionRegex = [regex]"\d+.\d+"
$WebConfigFile = "$PSScriptRoot\maven2\web.config"
$WebConfig = @'
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <system.webServer>
        <directoryBrowse enabled="true" />
        <staticContent>
            <mimeMap fileExtension=".properties" mimeType="application/octet-stream" />
        </staticContent>
    </system.webServer>
</configuration>
'@
#本地版本
$LocalIndexVersionDate = [decimal]1

#endregion


#region Tip
if($args.Count -eq 0)
{
    Write-Host $Tip
}
#endregion


#region 获取本地版本
if( (Test-Path $IndexVersionFile) -and (Test-Path $IndexFile) )
{
    #解析旧版本日期
    $LocalIndexProps = ConvertFrom-StringData(Get-Content $IndexVersionFile -raw)
    $LocalIndexVersion = $LocalIndexProps.'nexus.index.timestamp'
    $LocalIndexVersionDate = [decimal]$IndexVersionRegex.Matches($LocalIndexVersion)[0].Value
    Write-Host "本地版本：$LocalIndexVersion"
}
else
{
    Write-Host "本地版本：不存在"
}
#endregion


#region 获取最新版本
Invoke-WebRequest -Uri $IndexVersionURL -OutFile $TempIVF -UseBasicParsing
$IndexProps = ConvertFrom-StringData(Get-Content $TempIVF -raw)
$IndexVersion = $IndexProps.'nexus.index.timestamp'
$IndexVersionDate = [decimal]$IndexVersionRegex.Matches($IndexVersion)[0].Value
Write-Host "最新版本：$IndexVersion"
#endregion


#region 处理更新
if( $IndexVersionDate -gt $LocalIndexVersionDate)
{
    Write-Host "本地版本更新：$LocalIndexVersion -> $IndexVersion"
    New-Item "$PSScriptRoot\maven2\.index\" -Type Directory -ErrorAction SilentlyContinue
    #更新文件
    $RetryCount=0
    do {
        Invoke-WebRequest -Uri $IndexURL -OutFile $IndexFile -UseBasicParsing
        $RetryCount=$RetryCount+1
        if($RetryCount -eq 10){
             Write-Host "更新出现错误已经重试10次仍无法正常更新，将退出整个程序！"
             Read-Host
             exit
        }
    } while (!$?)
    Invoke-WebRequest -Uri $IndexVersionURL -OutFile $IndexVersionFile -UseBasicParsing
    Write-Host "更新完毕"
}
else
{
    Write-Host "本地版本已经是最新版本"
}
#endregion


#region 添加web.config
if(!(Test-Path $WebConfigFile))
{
    $WebConfig | Set-Content $WebConfigFile
}
#endregion


#region Exit
if($args.Count -eq 0)
{
    Write-Host  '执行完毕,按任意键退出...'
    Read-Host
}
#endregion