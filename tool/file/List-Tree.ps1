
#region 
$Tip=@'

tree
xiaoyao9184

show a path like tree in some IDE

'@
$Path = ''
$PathLevel = 0
$PathLevelArray = New-Object System.Collections.ArrayList
$LevelString = ''
#endregion

#region 
function getpath($Path,$IsLast){

    #Write-Host $Path.gettype().name
    #Write-Host $IsLast.gettype().name

    $Level = ''
    for($i=1; $i -le $PathLevel; $i++){
        if( ($i -eq $PathLevel) -and $IsLast[-1] ){
            $Level = $Level + "`t└"
        }elseif( ($i -eq $PathLevel) -and !$IsLast[-1]){
            $Level = $Level + "`t├"
        }elseif(!$IsLast[$i-1]){
            $Level = $Level + "`t│"
        }else{
            $Level = $Level + "`t  "
        }
    }

    Write-Host $Level $Path.name

    if( $Path -is [System.IO.DirectoryInfo] ){
        $Child = Get-ChildItem -Path $Path.fullname
        $index = 1
        foreach($SubPath in $Child){
            $PathLevel++
            $t = $PathLevelArray.Add($index -eq $Child.count)
            getpath -Path $SubPath[0] -IsLast $PathLevelArray
            $PathLevel--
            $PathLevelArray.RemoveAt($PathLevel)
            $index++
        }
    }
}
#endregion


#region Do
Write-Host $Tip
if($args.Count -eq 0){
    while($Path -eq ''){
        Write-Host 'input path for tree:'
        $Path = Read-Host
        if( !(Test-Path $Path) ){
            $Path = ''
        }
    }
}
getpath(Get-Item $Path)
#endregion


#region Exit
Pause
#endregion