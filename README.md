# SafeToCrack

## How to run
Run this command in your terminal.
```powershell
Invoke-Expression (Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/downupstudio/SafeToCrack/refs/heads/main/safetocrack.ps1").Content
```

## What the script does
The script checks if a gaming download site is considered safe or unsafe based on community-vetted lists from FMHY (FreeMediaHeckYeah). It displays the following information in organized categories:
- Safety Status: Classifies sites as SAFE or UNSAFE with clear visual indicators
- Site Information: Name, category, and direct URL (for safe sites)
- Safety Categories:
  - Best - Highly recommended sites with stars in FMHY list
  - Safe - Trusted sites from FMHY community list
  - Repacks - Trusted repack sites (FitGirl, DODI, etc.)
  - Dangerous - Known unsafe sites with specific warnings
- Search Functionality: Searches for partial matches like the SteamRIP Checker
- Warning Details: For unsafe sites, displays specific reasons for their classification

 ## Requirements  
- PowerShell: Windows PowerShell 5.1+ or PowerShell Core 7.x+
- Operating System: Windows 10 or Windows 11

## Notes
- Run normally: No administrator privileges required for basic functionality
- Local operation: No data is sent anywhere; everything runs locally on your machine
- Community-vetted: Lists are based on FMHY community recommendations and warnings
- Search behavior: Uses partial matching (searching "rip" finds "SteamRIP")
- Color coding: Green text for safe sites, red text for unsafe sites, clear visual indicators
- Comprehensive coverage: Includes both recommended sites and known dangerous sites to avoid
