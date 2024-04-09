# Check if running as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Please run this script as an Administrator."
    exit
}

# Install IIS Server
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Install ASP.NET Features
Install-WindowsFeature -Name Web-Asp-Net45

# Install IIS Management Scripts and Tools
Install-WindowsFeature -Name Web-Mgmt-Tools

# Install IIS 6 Metabase Compatibility
Install-WindowsFeature -Name Web-Metabase

# Install IIS 6 Management Compatibility
Install-WindowsFeature -Name Web-Lgcy-Mgmt-Console

# Install IIS Request Filtering
Install-WindowsFeature -Name Web-Filtering

# Install IIS URL Rewrite
Install-WindowsFeature -Name Web-Url-Rewrite

# Install IIS Static Content Compression
Install-WindowsFeature -Name Web-Stat-Compression

# Install IIS Dynamic Content Compression
Install-WindowsFeature -Name Web-Dyn-Compression

# Install IIS Default Document
Install-WindowsFeature -Name Web-Default-Doc

# Install IIS HTTP Errors
Install-WindowsFeature -Name Web-Http-Errors

# Install IIS HTTP Redirection
Install-WindowsFeature -Name Web-Http-Redirect

# Install IIS Static Content
Install-WindowsFeature -Name Web-Static-Content

# Install IIS Dynamic Content
Install-WindowsFeature -Name Web-Dynamic-Content

# Install IIS Client Certificate Mapping Authentication
Install-WindowsFeature -Name Web-Client-Auth

# Install IIS IIS Windows Authentication
Install-WindowsFeature -Name Web-Windows-Auth

# Install IIS Digest Authentication
Install-WindowsFeature -Name Web-Digest-Auth

# Install IIS Basic Authentication
Install-WindowsFeature -Name Web-Basic-Auth

# Install IIS IIS Server Side Includes
Install-WindowsFeature -Name Web-Includes

# Install IIS ASP.NET
Install-WindowsFeature -Name Web-Asp-Net

# Install IIS ASP
Install-WindowsFeature -Name Web-Asp

# Install IIS CGI
Install-WindowsFeature -Name Web-CGI

# Install IIS ISAPI Extensions
Install-WindowsFeature -Name Web-ISAPI-Ext

# Install IIS ISAPI Filters
Install-WindowsFeature -Name Web-ISAPI-Filter

