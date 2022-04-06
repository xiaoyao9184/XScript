
function List-PSCallStack($not) {
    $CallStacks = Get-PSCallStack | Where-Object  {$_.Command -ne $not}
    return $CallStacks
}

$CallStacks = List-PSCallStack("<ScriptBlock>")

Write-Host ($CallStacks | Format-Table | Out-String)

Write-Host CallStack ScriptName Count: $CallStacks.Count
foreach($CallStack in $CallStacks){
    Write-Host CallStack ScriptName: $CallStack.ScriptName
}

Write-Host MyCommand: $MyInvocation.MyCommand.Definition

if($CallStack[0].ScriptName -in $MyInvocation.MyCommand.Definition){
    Write-Host CallStack and MyInvocation in same file
    Pause
}