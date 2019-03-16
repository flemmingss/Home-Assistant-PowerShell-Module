<#
.SYNOPSIS
  Name: Get-HomeAssistantEntity.ps1
 This is a function in the a PowerShell Module to Control the Home-Assistant home automation software.
.DESCRIPTION
  This function is used to get information abaout a entity in Home-Assistant
.NOTES
    Original release Date: 17.03.2019
  Author: Flemming Sørvollen Skaret (https://github.com/flemmingss/)
.LINK
  https://github.com/flemmingss/
.EXAMPLE
  Get-HomeAssistantEntity
  Get-HomeAssistantEntity -entity_id <entity_id>
#>

function Get-HomeAssistantEntity
{
[CmdletBinding()]
    Param(
    [Parameter(Mandatory=$false,Position="0")
    ][string]$entity_id
    )

if ($entity_id)
    {
    Invoke-RestMethod -Method get -Uri ("$ha_api_url"+"states/"+$entity_id) -Header $ha_api_headers
    }
else
    {
    Invoke-RestMethod -Method get -Uri ("$ha_api_url"+"states") -Header $ha_api_headers
    }

} #function end
