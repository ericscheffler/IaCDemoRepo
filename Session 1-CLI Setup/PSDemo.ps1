<# Starting with a brand new VM #>

# Install Winget from MS App Store (recommended way to install PS7, and it's awesome)
# "App Installer"

# Install Powershell 7.2 or greater
winget search Microsoft.PowerShell # Agree to source agreements
winget install Microsoft.PowerShell

# Install VS Code
winget install Microsoft.VisualStudioCode

# Install Powershell extension in Extensions pane

# Set default shell in VS Code
<#
In VS Code Terminal pane, click the down-arrow next to "PowerShell Extension +";
Choose "Select Default Profile"; in selection box, choose "PowerShell"; this will be the "pwsh.exe" executable.
#>

# Open new PowerShell 7 terminal session in VS Code; click the "+" button next to "PowerShell Extension" in the Terminal pane

# View Powershell profile location
$profile

# Add check to the profile to make sure it loaded
code $profile # Opens Powershell profile in VS Code; leave tab open for the duration of the demo
Write-Host "Profile was loaded" -ForegroundColor Green # Add this line to the profile

# Install Powershell extension
code --install-extension ms-vscode.powershell

# Install PSReadline
# https://learn.microsoft.com/en-us/powershell/module/psreadline/about/about_psreadline?view=powershell-7.3
Install-Module -Name PSReadLine -AllowClobber -Force #Accept if prompted to install NuGet provider 
# ** Ignore warning about module being in use
Import-Module PSReadLine # if necessary

# Add to Powershell profile we opened previously
Import-Module -Name PSReadline
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# Refresh Powershell profile
&$profile

# Install Az.Tools.Predictor
# https://techcommunity.microsoft.com/t5/azure-tools-blog/announcing-general-availability-of-az-tools-predictor/ba-p/3297956
# Install Az.Accounts module; prerequisite, Az.Tools.Predictor won't install/run without it
Install-Module Az.Accounts # Accept untrusted repo warning
Install-Module -name Az.Tools.Predictor -Force
Import-Module Az.Tools.Predictor

# Install Git for Windows
winget install --id Git.Git -e --source winget

# Install posh-git
Install-Module posh-git

# Add to profile
Import-Module posh-git

<#Additionally run the following apps from the Start menu (then simply close), or you will get an error upon profile reload
  -Git GUI
  -Git BASH
  -Git CMD
This completes the last-minute installation steps and adds Git to the PATH
#>
# Close and re-open VS Code

# Install terminal-icons
Install-Module -Name Terminal-Icons

# Add to profile
Import-Module -Name Terminal-Icons

# AND FINALLY.... let's install Oh-My-Posh; silly name, awesome tool
# https://www.hanselman.com/blog/my-ultimate-powershell-prompt-with-oh-my-posh-and-the-windows-terminal
# Install OhMyPosh
winget install JanDeDobbeleer.OhMyPosh -s winget # Close and reopen VS Code after installation

# Add to Powershell profile
oh-my-posh init pwsh | Invoke-Expression

# Install a "nerd" font
oh-my-posh font install # Select Hack NF (or other)
# Change Terminal profile to use new font
# -Settings-> Profiles/Powershell -> Appearance -> Font Face
# Change VS Code to use new font
# -Preferences -> Settings -> "integrated: font family"

# Reload profile
&$profile

# And BAM! Should be working; how to see additional themes:
Get-PoshThemes

# Documentation to make a custom theme/configuration
# https://ohmyposh.dev/docs/configuration/overview

# Update theme in profile for demo purposes
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/lambdageneration.omp.json' | Invoke-Expression

# Install common VS Code extensions
code --install-extension ms-azuretools.vscode-bicep
code --install-extension ms-dotnettools.vscode-dotnet-runtime
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.powershell
code --install-extension msazurermtools.azurerm-vscode-tools
code --install-extension oderwat.indent-rainbow
code --install-extension shardulm94.trailing-spaces
code --install-extension yzhang.markdown-all-in-one

# Install Azure CLI
winget install -e --id Microsoft.AzureCLI