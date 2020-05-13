Set-Location $PSScriptRoot

if(Test-Path bin)
{
    Remove-Item -Recurse -Force bin
}

dotnet pack -c Release -p:PackageVersion=2.1.14.7

foreach($t in Get-ChildItem -Path .\bin\Release\*.nupkg)
{
    nuget push -source http://ubuntu.tsual.sf:7081/repository/nuget-hosted/ $t 
}

pause