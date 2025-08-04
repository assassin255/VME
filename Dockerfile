# Use Windows Server Core 2019 as base image (GUI không khả thi)
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Set environment variables
ENV PORT=8080

# Use PowerShell as default shell
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

# Install Chocolatey
RUN Set-ExecutionPolicy Bypass -Scope Process -Force ; \
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Node.js LTS
RUN choco install -y nodejs-lts

# Create app folder
RUN mkdir C:\app

# Placeholder: start HTTP server or your app
EXPOSE $PORT

CMD ["powershell", "-Command", "Write-Host 'Running in Windows container (no GUI)'; Start-Sleep -Seconds 3600"]

