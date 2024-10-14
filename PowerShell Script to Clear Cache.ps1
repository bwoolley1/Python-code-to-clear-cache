# Function to clear Google Chrome cache
function Clear-ChromeCache {
    $chromeCachePath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache"

    if (Test-Path $chromeCachePath) {
        Remove-Item -Path $chromeCachePath\* -Recurse -Force
        Write-Host "Chrome cache cleared."
    } else {
        Write-Host "Chrome cache path not found."
    }
}

# Function to clear Mozilla Firefox cache
function Clear-FirefoxCache {
    $firefoxProfilesPath = "$env:APPDATA\Mozilla\Firefox\Profiles"

    if (Test-Path $firefoxProfilesPath) {
        Get-ChildItem -Path $firefoxProfilesPath | ForEach-Object {
            $firefoxCachePath = "$($_.FullName)\cache2"
            if (Test-Path $firefoxCachePath) {
                Remove-Item -Path $firefoxCachePath\* -Recurse -Force
                Write-Host "Firefox cache for profile $($_.Name) cleared."
            } else {
                Write-Host "No cache found for Firefox profile $($_.Name)."
            }
        }
    } else {
        Write-Host "Firefox cache path not found."
    }
}

# Clear Chrome and Firefox Cache
Clear-ChromeCache
Clear-FirefoxCache
