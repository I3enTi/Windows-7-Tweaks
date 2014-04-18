@echo off 

reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background /v OEMBackground /t REG_DWORD /d 1 /f

set b_folder=%WINDIR%\System32\oobe\info\backgrounds

IF EXIST %b_folder% (

start %b_folder%
@echo on  ECHO: exists 
@echo off

) ELSE (

 md %b_folder% 
 start %b_folder% 
@echo on ECHO: does NOT exist; made 
 )
 
ECHO: COPY YOUR (JPEG)BACKGROUND IMAGE HERE and NAME IT "backgroundDefault"
pause

@echo off

:implementChange
set /p Change=Implement Background Change [y/n]?:
if %Change%==y logoff
if %Change%==n goto :close

:close
set /p Confirm=Exit [y/n]?
if %Confirm%==y goto end 
if %Confirm%==n goto :implementChange
