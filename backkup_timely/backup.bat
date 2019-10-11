set source="Z:\home\gayan\Desktop\CiperLabs\fiever\scripts\backkup_timely\Example Batch 1\source folder in 2020"
set target="Z:\home\gayan\Desktop\CiperLabs\fiever\scripts\backkup_timely\Example Batch 1\target in 2020"
set age=1


ROBOCOPY %source% %target%  /mov /minage:%age% /E /V