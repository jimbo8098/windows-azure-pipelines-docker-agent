FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN setx path "%path%;C:\Program Files\Docker"

WORKDIR /azp
COPY start.ps1 .
CMD powershell .\start.ps1