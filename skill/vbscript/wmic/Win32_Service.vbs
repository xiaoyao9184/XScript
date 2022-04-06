strComputer = "."
Set wbemServices = Getobject("winmgmts:\\" & strComputer)
Set wbemObjectSet = wbemServices.InstancesOf("Win32_Service")
For Each wbemObject In wbemObjectSet
    k = msgbox("DisplayName:" & wbemObject.DisplayName & vblf & "State:" & wbemObject.State & vblf & "StartMode: " & wbemObject.StartMode, vbOKCancel, "Win32_Service")
    if k = vbCancel then wscript.quit
Next