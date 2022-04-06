strComputer = "."
Set wbemServices = Getobject("winmgmts:\\" & strComputer)
Set wbemObjectSet = wbemServices.InstancesOf("Win32_OperatingSystem")
For Each wbemObject In wbemObjectSet
    msgbox "TotalVisibleMemorySize:" & wbemObject.TotalVisibleMemorySize/1024 & "MB", -1, "Win32_OperatingSystem"
Next