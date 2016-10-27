#条件
开启PowerShell脚本运行
安装IIS

#使用
运行install即可

#文件说明

###update.ps1
更新远程maven索引到当前目录

###copy.ps1
复制当前目录的maven索引到IIS目录

###install.ps1
修改HOST然后调用update.ps1和copy.ps1完成整个过程
