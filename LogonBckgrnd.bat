reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background /v OEMBackground /t REG_DWORD /d 1 /f

start C:\Windows\System32\oobe\info\backgrounds

pause

@echo off
:implementChange
set /p Change=Implement Background Change [y/n] ?:
if %Change%==y logoff
if %Change%==n goto :close

:close
set /p Confirm=Exit [y/n]?
if %Confirm%==y goto end 
if %Confirm%==n goto :implementChange
