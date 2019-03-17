# Home-Assistant PowerShell Module
A PowerShell Module to Control the Home-Assistant home automation software


**Description**  
   This is a project I started with in late 2018 and it hasn't been developed since. But I will publish it anyway and hopefully implement more features in the future

**Instructions**

Load module to import all functions:
```powershell
Import-Module .\HomeAssistant
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
**Changelog**  
* 17.03.2019
    * Release
