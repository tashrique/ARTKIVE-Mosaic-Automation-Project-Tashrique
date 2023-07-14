# Get the directory of the script location
$scriptDir = $PSScriptRoot

# Get the parent directory of the script location
$parentDir = Split-Path $PSScriptRoot -Parent

# Get the MOSAIC ORDERS SAMPLE directory
$outputDir = Join-Path $parentDir 'MOSAIC ORDERS SAMPLE'

# Check if the MOSAIC ORDERS SAMPLE directory exists
if (!(Test-Path -Path $outputDir)) {
    Write-Output "Directory $outputDir does not exist."
    return
}

# Get the subdirectories in the MOSAIC ORDERS SAMPLE directory
$subDirs = Get-ChildItem -Path $outputDir -Directory

# Get the BAT file path
$batFile = Join-Path $scriptDir 'RunForOneMosaic.bat'
Write-Output $batFile


# Check if the BAT file exists
if (!(Test-Path -Path $batFile)) {
    Write-Output "File $batFile does not exist."
    return
}

# For each subdirectory
foreach ($dir in $subDirs) {
    # Change directory to the subdirectory
    Set-Location -Path $dir.FullName

    # Run the BAT file
    cmd.exe /c $batFile
}
