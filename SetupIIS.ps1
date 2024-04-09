# Check if running as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Please run this script as an Administrator."
    exit
}

# Function to enable Windows Optional Feature
function Enable-WindowsFeature($FeatureName) {
    $result = Enable-WindowsOptionalFeature -Online -FeatureName $FeatureName -NoRestart
    if ($result -and $result.ExitCode -eq 0) {
        Write-Host "Feature '$FeatureName' enabled successfully."
    } else {
        Write-Host "Failed to enable feature '$FeatureName'."
    }
}

# List of IIS Features to enable
$IISFeatures = @(
    "IIS-WebServerRole",
    "IIS-WebServer",
    "IIS-CommonHttpFeatures",
    "IIS-HttpErrors",
    "IIS-HttpRedirect",
    "IIS-ApplicationDevelopment",
    "IIS-NetFxExtensibility45",
    "IIS-HealthAndDiagnostics",
    "IIS-HttpLogging",
    "IIS-LoggingLibraries",
    "IIS-RequestMonitor",
    "IIS-HttpTracing",
    "IIS-Security",
    "IIS-RequestFiltering",
    "IIS-Performance",
    "IIS-WebServerManagementTools",
    "IIS-ManagementConsole",
    "IIS-ASPNET45",
    "IIS-ISAPIExtensions",
    "IIS-ISAPIFilter",
    "IIS-DefaultDocument",
    "IIS-StaticContent"
)

# Install IIS Features
foreach ($feature in $IISFeatures) {
    Enable-WindowsFeature $feature
}

# Check if restart is required
$restartRequired = (Get-WindowsOptionalFeature -Online | Where-Object { $_.State -eq "Pending" }).Count -gt 0

if ($restartRequired) {
    Write-Host "Restarting the system to apply changes..."
    Restart-Computer -Force
} else {
    Write-Host "IIS installation completed successfully."
}
