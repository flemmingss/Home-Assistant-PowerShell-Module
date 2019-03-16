<#
.SYNOPSIS
  Name: Get-HomeAssistantConfig.ps1
 This is a function in the a PowerShell Module to Control the Home-Assistant home automation software.
.DESCRIPTION
  This function is used to get information abaout the Home-Assistant configuration
.NOTES
    Original release Date: 17.03.2019
  Author: Flemming Sørvollen Skaret (https://github.com/flemmingss/)
.LINK
  https://github.com/flemmingss/
.EXAMPLE
  Get-HomeAssistantConfig
#>

function Get-HomeAssistantConfig
{
Invoke-RestMethod -Method get -Uri ("$ha_api_url"+"config") -Header $ha_api_headers
} #function end
