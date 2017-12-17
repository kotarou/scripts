
# Set the script and options up

$Boxstarter.RebootOk=$true
$Boxstarter.NoPassword=$false   # Does this machine have no password to log on?
$Boxstarter.AutoLogin=$true     # Save password for reboot

choco feature enable --name=allowGlobalConfirmation

Disable-UAC 

# Tweaking windows

Update-ExecutionPolicy Unrestricted
Disable-BingSearch
Disable-GameBarTips
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions -EnableShowFullPathInTitleBar -DisableShowRecentFilesInQuickAccess -DisableShowFrequentFoldersInQuickAccess -EnableExpandToOpenFolder -EnableShowProtectedOSFiles
Set-TaskbarOptions -Size Small -UnLock -Dock Left

# Power settings / hibernation

powercfg -h off

powercfg -change -standby-timeout-ac 0
powercfg -change -standby-timeout-dc 0

powercfg -change -monitor-timeout-ac 240
powercfg -change -monitor-timeout-dc 20

powercfg -change -disk-timeout-ac 0
powercfg -change -disk-timeout-dc 0

# Windows Update

if (Test-PendingReboot) { Invoke-Reboot }

Install-WindowsUpdate -AcceptEula

if (Test-PendingReboot) { Invoke-Reboot }

# DotNet and redistributables
# Not sure if I need all of these?

choco install DotNet3.5
if (Test-PendingReboot) { Invoke-Reboot }
choco install DotNet4.5
if (Test-PendingReboot) { Invoke-Reboot }
choco install DotNet4.6 
if (Test-PendingReboot) { Invoke-Reboot }

choco install vcredist2012
if (Test-PendingReboot) { Invoke-Reboot }
choco install vcredist2013
if (Test-PendingReboot) { Invoke-Reboot }
choco install vcredist2014
if (Test-PendingReboot) { Invoke-Reboot }
choco install vcredist2015
if (Test-PendingReboot) { Invoke-Reboot }
choco install vcredist2016
if (Test-PendingReboot) { Invoke-Reboot }
choco install vcredist2017
if (Test-PendingReboot) { Invoke-Reboot }

&"$env:windir\system32\tzutil.exe" /s "New Zealand Standard Time"

# General / essential programs

choco install firefox
choco install 7zip
choco install everything

# Windows / system tweaks

choco install LinkShellExtension
choco install grepwin

# Text editors

choco install notepadplusplus.install

# Development

choco install git 

# Languages

choco install nodejs 

# Communications

choco install skype
choco install slack
choco install mumble
choco install teamspeak
choco install discord

# Media

choco install mpv
choco install cccp
choco install ffmpeg
choco install foobar2000

# Gaming

choco install steam -y
choco install cheatengine -y

#Security and tweaking

choco install malwarebytes -y
choco install ccleaner -y
choco install ccenhancer -y
choco install advancedsystemtweaker -y
choco install windows-tweaker -y

# Finish and cleanup

Enable-UAC