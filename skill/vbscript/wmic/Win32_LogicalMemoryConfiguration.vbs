strComputer = "."
Set wbemServices = Getobject("winmgmts:\\" & strComputer)
Set wbemObjectSet = wbemServices.InstancesOf("Win32_LogicalMemoryConfiguration")
For Each wbemObject In wbemObjectSet
    msgbox "TotalPhysicalMemory:" & wbemObject.TotalPhysicalMemory/1024 & "MB", -1, "Win32_LogicalMemoryConfiguration"
Next