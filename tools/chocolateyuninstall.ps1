$name = "eventstore"
try {
  $install_path = "$env:ProgramFiles\eventstore"
  rmdir -force -recurse  "$install_path\eventstore-net-v3.0.0rc2"
  IF ($LASTEXITCODE -ne 0)
  {
    Write-ChocolateyFailure $name "Failed to uninstall with exit code: $LASTEXITCODE"
    throw  
  }
  Write-ChocolateySuccess $name
} catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw
}  