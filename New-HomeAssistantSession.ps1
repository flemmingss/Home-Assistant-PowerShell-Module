<#
.SYNOPSIS
  Name: New-HomeAssistantSession.ps1
 This is a function in the a PowerShell Module to Control the Home-Assistant home automation software.
.DESCRIPTION
  This function is used to connect to the Home-Assistent API
.NOTES
    Original release Date: 17.03.2019
  Author: Flemming Sørvollen Skaret (https://github.com/flemmingss/)
.LINK
  https://github.com/flemmingss/
.EXAMPLE
 New-HomeAssistantSession -ip <Home-Assistant IP> -port <Home-Assistant port> -token <access token>
#>

Function New-HomeAssistantSession
{
    Param(
    [Parameter(Mandatory=$true)][string]$ip,
    [Parameter(Mandatory=$true)][string]$port,
    [Parameter(Mandatory=$true)][string]$token
    )

    $global:ha_api_headers = @{Authorization = "Bearer "+$token}
    $global:ha_api_url = "http://"+"$ip"+":"+"$port"+"/api/"

    try
    {
        Write-Host "Testing connection... " -ForegroundColor Yellow -NoNewline
        $api_connection = (Invoke-WebRequest -uri $ha_api_url -Method GET -Headers $ha_api_headers)    
        $global:ha_api_configured = $true
        Write-Host "Connection to Home-Assistant API succeeded! (" ($api_connection).StatusCode ($api_connection).StatusDescription ")" -ForegroundColor Green
    }
    catch 
    {
        if ((Test-NetConnection -ComputerName $ip -WarningAction SilentlyContinue).PingSucceeded)
        {
            Write-Host "Connection to Home-Assistant API failed!" -ForegroundColor Red
        }
        else
        {
            Write-Host "Connection failed - ICMP request timed out!" -ForegroundColor Red
        }
    
        $global:ha_api_url = $null
        $global:ha_api_headers = $null
        $global:ha_api_configured = $false
    } #catch end


} #function end
