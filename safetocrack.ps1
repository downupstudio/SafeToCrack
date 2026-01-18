Write-Host "SafeToCrack - Site Safety & Danger Checker"
Write-Host "============================================"

$sites = @{}
$siteWords = @()

$bestSites = @{
    "CS.RIN.RU" = "https://cs.rin.ru/forum"
    "SteamRIP" = "https://steamrip.com/"
    "AnkerGames" = "https://ankergames.net/"
    "GOG Games" = "https://gog-games.to/"
    "UnionCrax" = "https://union-crax.xyz/"
    "AstralGames" = "https://astral-games.xyz/"
    "Online Fix" = "https://online-fix.me/"
    "SteamUnderground" = "https://steamunderground.net/"
    "Ova Games" = "https://www.ovagames.com/"
    "Torrminatorr" = "https://forum.torrminatorr.com/"
}

$safeSites = @{
    "g4u" = "https://g4u.to/"
    "GLoad" = "https://gload.to/"
    "GameBounty" = "https://gamebounty.world/"
    "scene cat" = "https://rentry.co/FMHYB64#scene-cat"
    "Fluxy Repacks" = "https://fluxyrepacks.xyz/"
    "GoMorGames" = "https://gomorgames.com/"
    "appnetica" = "https://appnetica.com/"
    "AtopGames" = "https://atopgames.com/"
    "ElEnemigos" = "https://elenemigos.com/"
    "Reloaded Steam" = "https://reloadedsteam.com/"
    "SteamGG" = "https://steamgg.net/"
    "Rexa Games" = "https://rexagames.com/"
    "SteamOra" = "https://steamora.net/"
    "TriahGames" = "https://triahgames.com/"
    "GetFreeGames" = "https://getfreegames.net/"
    "desolation" = "https://rentry.co/FMHYB64#desolation"
    "World of PC Games" = "https://worldofpcgames.com/"
    "Games4U" = "https://games4u.org/"
    "CG Games" = "https://www.cg-gamespc.com/"
    "GamePCFull" = "https://gamepcfull.com/"
}

$repackSites = @{
    "FitGirl Repacks" = "https://fitgirl-repacks.site/"
    "KaOsKrew" = "https://kaoskrew.org/"
    "ARMGDDN Browser" = "https://github.com/KaladinDMP/AGBrowser"
    "Gnarly Repacks" = "https://rentry.co/FMHYB64#gnarly"
    "M4CKD0GE Repacks" = "https://m4ckd0ge-repacks.site/"
    "Vanya Games" = "https://vanya-games.site/"
    "DODI Repacks" = "https://rentry.co/FMHYB64#dodi"
    "Stevv Game" = "https://www.stevvgame.com/"
    "Xatab Repacks" = "https://byxatab.com/"
    "Elamigos" = "https://elamigos.site/"
    "FreeGOGPCGames" = "https://freegogpcgames.com/"
}

$unsafeSites = @{
    "IGG Games" = "DOXXED MERC213, contains DRM/crypto miners/malware"
    "PCGamesTorrents" = "Contains malware and exploits"
    "LoadGames" = "Contains malware and exploits"
    "GamesTorrents" = "Contains malware and exploits"
    "SteamUnlocked" = "Slow downloads, malicious redirects, stolen uploads"
    "GOG Unlocked" = "Slow downloads, malicious redirects, stolen uploads"
    "ROMs Unlocked" = "Slow downloads, malicious redirects, stolen uploads"
    "TLauncher" = "Contains spyware"
    "The Pirate Bay" = "Malware risk (including skulled users and dauphong)"
    "TPB" = "Malware risk (including skulled users and dauphong)"
    "Kickass Torrents" = "Malware risk"
    "7launcher" = "Uses their own launcher"
    "SE7EN" = "Uses their own launcher"
    "AGFY" = "Scam links"
    "AimHaven" = "Malicious redirect ads"
    "Apunkagames" = "Untrusted site"
    "BBRepacks" = "Fake BlackBox Repacks, contain malware"
    "Chovka" = "Injects scheduled tasks and registry entries for ads"
    "Repack.Info" = "Injects scheduled tasks and registry entries for ads"
    "Corepack" = "Stolen releases, has been caught with malware"
    "Cracked-Games" = "Malware risk"
    "Crohasit" = "Has affiliations with owners of SteamUnlocked"
    "Crotorrents" = "Has affiliations with owners of SteamUnlocked"
    "Downloadly" = "Contains cryptominers"
    "Empresstorrents" = "High malware risk"
    "FileCR" = "Malware risk"
    "Game3rb" = "Malicious fake download links baked into the page"
    "MrPcGamer" = "Malicious fake download links baked into the page"
    "Games4theworld" = "Uses The Pirate Bay"
    "GameFabrique" = "Adware installers, uploads from untrusted sites"
    "kLauncher" = "Contains malware (minecraft)"
    "Koyso" = "Missing source info"
    "Nexus Games" = "Malicious downloads"
    "WorldOfPCGames" = "Malicious downloads"
    "steamrepacks" = "Malicious downloads"
    "unlocked-games" = "Malicious downloads"
    "nosTEAM" = "Malware risk, uploaded BTC miners"
    "OceanOfGames" = "High malware risk"
    "OceanOfAPKs" = "High malware risk"
    "PiviGames" = "Gets games from untrusted sources"
    "PolyMC" = "Owner kicked all members (minecraft launcher)"
    "RepackGames" = "Mislabel games and steal releases"
    "Rgmechanics" = "Fake site"
    "Steamtools" = "Untrusted tool"
    "SWA V2" = "Untrusted tool"
    "Seyter" = "Repacks contain bitcoin miners"
    "Qoob" = "Repacks contain bitcoin miners"
    "Wifi4games" = "Malware downloads"
    "Zona launcher" = "Unknown sources"
}

function Extract-Words($title) {
    $words = @()
    $titleParts = $title -split '[\.\s]+'
    foreach ($part in $titleParts) {
        $cleanPart = $part -replace '[^\w]', ''
        if ($cleanPart -ne "") {
            $words += $cleanPart.ToLower()
        }
    }
    return $words
}

foreach ($site in $bestSites.Keys) {
    $sites[$site.ToLower()] = @{
        Name = $site
        Url = $bestSites[$site]
        Category = "BEST"
        Status = "SAFE"
    }
    $siteWords += Extract-Words $site
}

foreach ($site in $safeSites.Keys) {
    $sites[$site.ToLower()] = @{
        Name = $site
        Url = $safeSites[$site]
        Category = "Safe"
        Status = "SAFE"
    }
    $siteWords += Extract-Words $site
}

foreach ($site in $repackSites.Keys) {
    $sites[$site.ToLower()] = @{
        Name = $site
        Url = $repackSites[$site]
        Category = "Repacks"
        Status = "SAFE"
    }
    $siteWords += Extract-Words $site
}

foreach ($site in $unsafeSites.Keys) {
    $sites[$site.ToLower()] = @{
        Name = $site
        Url = ""
        Category = "Dangerous"
        Status = "UNSAFE"
        Warning = $unsafeSites[$site]
    }
    $siteWords += Extract-Words $site
}

$siteWords = $siteWords | Sort-Object -Unique

function Show-AllSafeSites {
    Write-Host ""
    Write-Host "ALL SAFE SITES" -ForegroundColor Cyan
    Write-Host "=============="
    
    $safeCount = 0
    $currentCategory = ""
    
    $allSafeSites = $sites.GetEnumerator() | Where-Object { $_.Value.Status -eq "SAFE" } | Sort-Object { $_.Value.Category }, { $_.Value.Name }
    
    foreach ($siteEntry in $allSafeSites) {
        $site = $siteEntry.Value
        
        if ($site.Category -ne $currentCategory) {
            Write-Host ""
            Write-Host "$($site.Category)" -ForegroundColor Yellow
            Write-Host "----------"
            $currentCategory = $site.Category
        }
        
        Write-Host "  - $($site.Name)" -ForegroundColor Green
        if ($site.Url) {
            Write-Host "    $($site.Url)" -ForegroundColor White
        }
        $safeCount++
    }
    
    Write-Host ""
    Write-Host "Total safe sites: $safeCount" -ForegroundColor Cyan
}

Write-Host "Ready! Loaded $($sites.Count) sites (safe & unsafe)." -ForegroundColor Green
Write-Host ""

$running = $true

while ($running) {
    Write-Host "MAIN MENU" -ForegroundColor Cyan
    Write-Host "========="
    Write-Host "1. Search for a site"
    Write-Host "2. Show all safe sites"
    Write-Host "3. Exit"
    Write-Host ""
    
    $choice = Read-Host "Enter your choice (1-3)"
    
    switch ($choice) {
        "1" {
            Write-Host ""
            Write-Host "SITE SEARCH" -ForegroundColor Yellow
            Write-Host "-----------"
            $userInput = Read-Host "Enter site name to search (or 'back' to return to menu)"

            if ($userInput -eq "back") {
                continue
            }

            if ([string]::IsNullOrWhiteSpace($userInput)) {
                Write-Host "Please enter a site name." -ForegroundColor Yellow
                Write-Host ""
                continue
            }

            $cleanInput = $userInput.Trim().ToLower()
            
            if ($cleanInput.Length -le 3) {
                $isValidShortSearch = $false
                
                foreach ($word in $siteWords) {
                    if ($word -eq $cleanInput) {
                        $isValidShortSearch = $true
                        break
                    }
                }
                
                if (-not $isValidShortSearch) {
                    Write-Host ""
                    Write-Host "Search term '$userInput' is too short (1-3 letters)." -ForegroundColor Red
                    Write-Host "You can only search with 1-3 letters if it matches a complete word from a site title." -ForegroundColor Yellow
                    Write-Host "Try a longer search term (4+ letters)." -ForegroundColor Gray
                    Write-Host ""
                    continue
                }
            }

            $foundSites = @()

            foreach ($siteKey in $sites.Keys) {
                if ($siteKey.Contains($cleanInput)) {
                    $foundSites += $sites[$siteKey]
                }
            }

            if ($foundSites.Count -gt 0) {
                Write-Host ""
                Write-Host "Found $($foundSites.Count) match(es):" -ForegroundColor Green

                foreach ($site in $foundSites) {
                    if ($site.Status -eq "SAFE") {
                        Write-Host " - $($site.Name)" -ForegroundColor Green
                        Write-Host "   Status: $($site.Status)" -ForegroundColor Green
                        Write-Host "   Category: $($site.Category)" -ForegroundColor White
                        if ($site.Url) {
                            Write-Host "   URL: $($site.Url)" -ForegroundColor White
                        }
                    } else {
                        Write-Host " - $($site.Name)" -ForegroundColor Red
                        Write-Host "   Status: $($site.Status)" -ForegroundColor Red
                        Write-Host "   Warning: $($site.Warning)" -ForegroundColor Yellow
                    }
                }
                Write-Host ""
            } else {
                Write-Host ""
                Write-Host "Site not found in database: $userInput" -ForegroundColor Gray
                Write-Host "This site is not in our safety lists." -ForegroundColor Gray
                Write-Host ""
            }
        }
        "2" {
            Show-AllSafeSites
        }
        "3" {
            Write-Host ""
            Write-Host "Exiting SafeToCrack. Goodbye!" -ForegroundColor Yellow
            $running = $false
        }
        default {
            Write-Host ""
            Write-Host "Invalid choice. Please enter 1, 2, or 3." -ForegroundColor Red
            Write-Host ""
        }
    }
}