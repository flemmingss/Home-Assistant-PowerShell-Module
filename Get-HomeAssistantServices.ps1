<#
.SYNOPSIS
  Name: Get-HomeAssistantServices.ps1
 This is a function in the a PowerShell Module to Control the Home-Assistant home automation software.
.DESCRIPTION
  This function is used to get all the available services in Home-Assistant
.NOTES
    Original release Date: 17.03.2019
  Author: Flemming Sørvollen Skaret (https://github.com/flemmingss/)
.LINK
  https://github.com/flemmingss/
.EXAMPLE
  Get-HomeAssistantServices
#>

Function Get-HomeAssistantServices
{ 
Invoke-RestMethod -Method get -Uri ("$ha_api_url"+"services") -Header $ha_api_headers
} #function end
