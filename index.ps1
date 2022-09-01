# Copyright (c) 2022 SurrealDB Ltd.

# This is a simple script that can be downloaded and run from
# https://windows.surrealdb.com in order to install the SurrealDB
# command-line tools and database server. It automatically detects
# the host operating platform, and cpu architecture type, and
# downloads the latest binary for the relevant platform.

# This install script attempts to install the SurrealDB binary
# automatically, or otherwise it will prompt the user to specify 
# the desired install location.

function Install {
    
    Write-Output ""
    Write-Output " .d8888b.                                             888 8888888b.  888888b."
    Write-Output "d88P  Y88b                                            888 888  'Y88b 888  '88b"
    Write-Output "Y88b.                                                 888 888    888 888  .88P"
    Write-Output " 'Y888b.   888  888 888d888 888d888  .d88b.   8888b.  888 888    888 8888888K."
    Write-Output "    'Y88b. 888  888 888P'   888P'   d8P  Y8b     '88b 888 888    888 888  'Y88b"
    Write-Output "      '888 888  888 888     888     88888888 .d888888 888 888    888 888    888"
    Write-Output "Y88b  d88P Y88b 888 888     888     Y8b.     888  888 888 888  .d88P 888   d88P"
    Write-Output " 'Y8888P'   'Y88888 888     888      'Y8888  'Y888888 888 8888888P'  8888888P'"
    Write-Output ""
    
    # Bail immediately on any error.
    $ErrorActionPreference = 'Stop'

    # Prevent the pointless progress overlay produced by iwr.
    $ProgressPreference = 'SilentlyContinue'
    
    # Specify the base url for binary files
    $BaseUrl = "https://download.surrealdb.com"
    
    # Specify the base url for version info
    $VersUrl = "https://version.surrealdb.com"

    # Ensure proper transport layer security
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    
    # Fetch the latest SurrealDB version
    Write-Output "Fetching the latest database version..."
    $Version = (Invoke-WebRequest $VersUrl -UseBasicParsing).Content.trim()
    
    # Compute the current system architecture
    Write-Output "Fetching the host system architecture..."
    $Arch = "windows-" + "amd64"

    # Define the latest SurrealDB download url
    $DownloadUrl = "$BaseUrl/${Version}/surreal-${Version}.${Arch}.exe"

    # Download and unarchive the latest SurrealDB binary
    Write-Output "Installing surreal-$Version for $Arch..."
    $Directory = Join-Path $HOME "surrealdb"
    $Executable = Join-Path $Directory "surrealdb.exe"
    New-Item $Directory -Force -ItemType Directory | Out-Null
    Invoke-WebRequest $DownloadUrl -OutFile $Executable -UseBasicParsing
    
    Write-Output ""
    Write-Output "SurrealDB successfully installed in:"
    Write-Output "  $Executable"
    Write-Output ""

    Write-Output "To see the command-line options run:"
    Write-Output "  $Executable help"
    Write-Output "To start an in-memory database server run:"
    Write-Output "  $Executable start --log debug --user root --pass root memory"
    Write-Output "For help with getting started visit:"
    Write-Output "  https://surrealdb.com/docs"
    Write-Output ""

}

Install