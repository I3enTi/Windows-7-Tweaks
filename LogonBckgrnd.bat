@echo off 

reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background /v OEMBackground /t REG_DWORD /d 1 /f

set b_folder=%WINDIR%\System32\oobe\info\backgrounds

IF EXIST %b_folder% (

start %b_folder%
@echo Pathway exists 
@echo off
 ECHO You already have this pathway, but just in case: \nCOPY YOUR BACKGROUND JPEG IMAGE HERE AND NAME IT 'backgroundDefault'.>"%WINDIR%\System32\oobe\info\backgrounds\Instructions.txt"
) ELSE (

 md %b_folder% 
 start %b_folder% 
@echo Pathway does NOT exist; has been made 
@echo off
 ECHO COPY YOUR BACKGROUND JPEG IMAGE HERE AND NAME IT 'backgroundDefault'.>"%WINDIR%\System32\oobe\info\backgrounds\Instructions.txt"
 )
 
:implementChange
set /p Change=Implement Background Change [y/n]?:
if %Change%==y logoff
if %Change%==n goto :close

:close
set /p Confirm=Exit [y/n]?
if %Confirm%==y goto end 
if %Confirm%==n goto :implementChange
