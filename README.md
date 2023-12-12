# powershell-script-collection

This repository is a collection of some of my PowerShell scripts I have made over the years for various work related purposes. Some of them are made for a specific use case from the beginning but I have tried to convert them to being for more general purposes.

## GetHardwareID.ps1

This script is used to get the harware ID of your PC or laptop. Hardware ID is needed when device is registered to
Windows Autopilot/Microsoft Intune. 

The script is required to run as an administrator. Elevation will be prompted if trying to run as an user.
The script also requires NuGet and permissions to run a remote script from PSGallery. You're asked to provide a permission for both, press 'Y' and 'Enter' to accept them. 

After the script has run a new Explorer window is opened with the location of the result from the script. By default this is 'C:\HWID\AutoPilotHWID.csv'. You can change the location by changing '$OutputDir' in the script.