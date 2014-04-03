param([string]$task, [string]$version="unset")


.\nuget.exe install psake -ExcludeVersion -OutputDirectory "temp"


$packageName = (Get-Item .).name	#use the folder name as the package name (overrride if relevant)
$id = "$packageName"			 
$title = "$packageName"			#Add more here 
$authors = "owain perry"    	#Set this 
$summary = "$packageName"		#Set this. 
$tags 	= "$packageName"		#Set this. 	 

Import-Module '.\temp\psake\tools\psake.psm1'; 
Invoke-psake  .\default.ps1 -t $task -parameters @{"packageName"=$packageName;"id"=$id;"title"=$title;"authors"=$authors;"summary"=$summary;"tags"=$tags;"version"=$version}
