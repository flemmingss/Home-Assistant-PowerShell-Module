<#
.SYNOPSIS
  Name: Invoke-HomeAssistantService.ps1
 This is a function in the a PowerShell Module to Control the Home-Assistant home automation software.
.DESCRIPTION
  This function is used to invoke a service in the Home-Assistent
.NOTES
    Original release Date: 17.03.2019
  Author: Flemming Sørvollen Skaret (https://github.com/flemmingss/)
.LINK
  https://github.com/flemmingss/
.EXAMPLE
 Invoke-HomeAssistantService -service <service> -entity_id <entity_id>
 Invoke-HomeAssistantService -service <service> -json '<json>'
#>

Function Invoke-HomeAssistantService
{
[CmdletBinding()]
    Param(
    [Parameter(Mandatory=$true,Position="0",ParameterSetName="ByEntity")][string]
    [Parameter(Mandatory=$true,Position="0",ParameterSetName="ByJSON")][string]
    $service,

    [Parameter(Mandatory=$true,Position="1",ParameterSetName="ByEntity")][string]
    $entity_id,

    [Parameter(Mandatory=$true,Position="1",ParameterSetName="ByJSON")][string]
    $json
    )

    #-SERVICE
    $service = $service.replace(".","/")

    #-ENTITY_ID
    
    if ($entity_id)
    {
    $body = ConvertTo-Json @{"entity_id" = "$entity_id"}
    }

    #-JSON
    elseif ($json)
    {
    $body = $json
    
    }


    Invoke-RestMethod -Method Post -Uri ("$ha_api_url"+"services/"+"$service") -Body ($body) -Header $ha_api_headers
    Write-Host $body
} #function end
