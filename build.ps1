param([string]$task, [string]$version="unset")


if ((Test-Path ".\nuget.exe") -eq $false)
{
    $webClient = new-object net.webclient
    $webClient.DownloadFile('https://github.com/OwainPerry/nuget.commandline/raw/master/NuGet.exe','nuget.exe')
}

.\nuget.exe install psake  -ExcludeVersion -OutputDirectory "packages"


$packageName = (Get-Item .).name	#use the folder name as the package name (overrride if relevant)
$id = "$packageName"			 
$title = "$packageName"			#Add more here 
$authors = "owain perry"    	#Set this 
$summary = "$packageName"		#Set this. 
$tags 	= "$packageName"		#Set this. 	 

Import-Module '.\packages\psake\tools\psake.psm1'; 
Invoke-psake  .\default.ps1 -t $task -parameters @{"packageName"=$packageName;"id"=$id;"title"=$title;"authors"=$authors;"summary"=$summary;"tags"=$tags;"version"=$version}
