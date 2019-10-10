@echo off
REM Created by gayankavirathne on 23-8-2019:


@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

choco install googlechrome
 -y
choco install office365business -y
choco install vlc -y
choco install adobereader -y
choco install jre8 -y

