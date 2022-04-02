
Set script_file = CreateObject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName)

script_path = script_file.ParentFolder.Path
Wscript.echo "The script path is:" + script_path

script_name = script_file.Name
index = InstrRev(script_name,".")
script_name = Mid(script_name,1,index-1)
Wscript.echo "The script name is:" + script_name


Wscript.echo "Run same name batch script :" + script_name + ".bat"
Set ws = CreateObject("Wscript.Shell")
ws.run "cmd /c " + script_path  + "\" + script_name + ".bat",4