
function Select-Path ($tip,$autoCreate) {
    do{
        Write-Host $tip
        $path = Read-Host

        $exist = Test-Path -LiteralPath $path
        if(!$exist){
            $tip = "Not exist try again!"
            
            if($autoCreate){
                New-Item $path -type Directory | Out-Null 
                $exist = $true
                $path = Get-Item -LiteralPath $path
                return $path.FullName
            }

        }
    }while(!$exist)

    $path = Get-Item -LiteralPath $path
    return $path.FullName
}

function Search-Files ($srcPath,$regex,$count) {
    Write-Progress -Activity "Search in Progress" -CurrentOperation "Enum file " $count
    $files=@()

    $ds = Get-ChildItem -LiteralPath $srcPath -Directory
    foreach ($d in $ds){
        $subf = Search-Files $d.FullName $regex $count
        $files+=$subf
        $count = $count + $subf.Count
    }

    $fs = Get-ChildItem -LiteralPath $srcPath -File 
    foreach ($f in $fs){
        if($f.Name -match $regex){
            $files+=$f
        }
    }
    $count = $count + $files.Count
    Write-Progress -Activity "Search in Progress" -CurrentOperation "Enum file " $count
    return $files
}

function Move-Files ($files,$srcPath,$tarPath) {
    if($files.Count -eq 0){
        return
    }
    $srcFile = Get-Item -LiteralPath $srcPath
    $tarFile = Get-Item -LiteralPath $tarPath

    $index = 0
    foreach ($f in $files){
        $p = ($index / $files.Count) * 100
        $newF = $f.FullName.Replace($srcFile.FullName,$tarFile.FullName)
        $newD = $newF.Replace($f.Name,"")

        if(!(Test-Path -LiteralPath $newD)){
            New-Item -Path $newD -type Directory | Out-Null
        }

        Move-Item -LiteralPath $f.FullName -Destination $newF
        $cp = "" + $index + "/" + $files.Count + " file:" + $f.FullName
        Write-Progress -Activity "Move in Progress" -PercentComplete $p -CurrentOperation $cp
        $index++
    }
}


$srcPath = Select-Path "Enter source path!" $false
$tarPath = Select-Path "Enter target path!" $true
$regex = Read-Host "Enter Regex for file to move!"

Write-Host $srcPath " -> " $tarPath

$files = Search-Files $srcPath $regex 0
Write-Host $files.Count " file to move!"

Move-Files $files $srcPath $tarPath

Read-Host "Move done!"


