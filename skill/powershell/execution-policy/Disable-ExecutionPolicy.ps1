function Disable-ExecutionPolicy {
    $obj = (New-Object Management.Automation.AuthorizationManager 'Microsoft.PowerShell')
    $field = $ExecutionContext.GetType().GetField("_context","nonpublic,instance")
    $context = $field.GetValue($ExecutionContext)
    $field = $context.GetType().GetField('_authorizationManager','nonpublic,instance')
    $field.SetValue($context,$obj)
}
Disable-ExecutionPolicy

Write-Host Disable ExecutionPolicy in this session