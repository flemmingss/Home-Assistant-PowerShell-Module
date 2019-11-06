# Home-Assistant PowerShell Module
A PowerShell Module to Control the Home-Assistant home automation software


**Description**  
   This is a project I started with in late 2018 and it hasn't been developed since. But I will publish it anyway and hopefully implement more features in the future

**Instructions**

Load module to import all functions:
```powershell
Import-Module .\Home-Assistant
```
New-HomeAssistantSession neds to be used before any other function will work.

**Functions**

```powershell
  Get-HomeAssistantConfig
  Get-HomeAssistantEntity
  Get-HomeAssistantEntity -entity_id <entity_id>
  Get-HomeAssistantServices
  Invoke-HomeAssistantService -service <service> -entity_id <entity_id>
  Invoke-HomeAssistantService -service <service> -json '<json>'
  New-HomeAssistantSession -ip <Home-Assistant IP> -port <Home-Assistant port> -token <access token>
```
**Examples**

```powershell
  
New-HomeAssistantSession -ip 10.0.24.4 -port 8123 -token eyYfo49g036gdKg5LSki4w04tkifulaglgkMn3idnf2w57x5eyfog036gdKg5LSkgw04tkifulaglgkMidnf2w57axyYfo49g036gdKLSkgi4w04tkifaglgkMn3idnf2w57axyYfo49g036gdKg5LSkgi4w04tkifulaglgkMn3idnf2w57ax5
Get-HomeAssistantEntity -entity_id light.limitlessled_g1
Invoke-HomeAssistantService -service light.turn_on -entity_id light.limitlessled_g1
Invoke-HomeAssistantService -service light.turn_on -json '{"entity_id":"light.limitlessled_g1","color_name":"blue"}'
```

**Examples - Advanced/Script/JSON**

Use with custom component "hass-variables" https://github.com/rogro82/hass-variables

```powershell

$cpu_usage_pct = "25"
$json_to_send = '{"variable":"computer_cpu_usage","value":' + '"' +  "$cpu_usage_pct" + '"' + '}'
Invoke-HomeAssistantService -service variable.set_variable -json $json_to_send

```

Use with custom component "home-assistant-variables" https://github.com/snarky-snark/home-assistant-variables

```powershell

$cpu_usage_pct = "25"
$json_to_send = '{"entity_id":"var.computer_cpu_usage","value":' + '"' +  "$cpu_usage_pct" + '"' + '}'
Invoke-HomeAssistantService -service var.set -json $json_to_send

```

**Changelog**  
* 17.03.2019
    * Release
* 11.06.2019
    * Updated to better follow PowerShell's best practice for modules. Created folder /Home-Assistant/ and Merged all .ps1 functions to one module file "Home-Assistant.psm1" and Added Module Manifest file "Home-Assistant.psd1"
* 05.11.2019   
    * Added ModuleVersion to module manifest because it is required
