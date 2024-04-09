# Define the URL for the AWS CLI MSI installer
$awsCliUrl = "https://awscli.amazonaws.com/AWSCLIV2.msi"

# Define the path to save the downloaded MSI installer
$awsCliInstallerPath = "$env:TEMP\AWSCLIV2.msi"

# Download the AWS CLI MSI installer
Invoke-WebRequest -Uri $awsCliUrl -OutFile $awsCliInstallerPath

# Install AWS CLI using msiexec.exe
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$awsCliInstallerPath`" /quiet" -Wait

# Refresh environment variables
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

# Check AWS CLI version
aws --version

# Remove the downloaded MSI installer
Remove-Item -Path $awsCliInstallerPath -Force
