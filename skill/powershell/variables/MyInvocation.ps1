Write-Output "list MyInvocation"
Write-Host ($MyInvocation | Format-List | Out-String)


Pause
Write-Output "list MyInvocation by PSobject"
Write-Host ($MyInvocation.PSobject.Properties | Format-List | Out-String)
