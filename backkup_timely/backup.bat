@echo off

rem : set the source file path here
rem set source="E:\CiperLabs\fiver\scripts\backkup_timely\Example Batch 1\source folder in 2020"

rem : set the destination file path here 
rem set target="E:\CiperLabs\fiver\scripts\backkup_timely\Example Batch 1\target in 2020"

rem : set the number of days here ( if you need it to be an year enter the number of days: 365, 2 years : 730 , 3 years : 1195 )
set age=4

set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please choose source folder.',0,0).self.path""

for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "source=%%I"

set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please choose Target folder.',0,0).self.path""

for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "target=%%I"


set /p testMode="Press y for to start in test mode [y/n]?:"

IF %testMode%==y (
ROBOCOPY "%source%" "%target%"  /copy:DT /minage:%age% /E /V
) ELSE (
ROBOCOPY "%source%" "%target%"  /mov /minage:%age% /E /V
)



pause