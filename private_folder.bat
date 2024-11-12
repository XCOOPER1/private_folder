cls
@echo off
title Folder Private
if Exist "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT Exist Private goto MDLOCKER
:CONFIRM
echo Are you sure you want to lock the Folder(Y/N)
set/p "cho=>"
if /I "%cho%"=="Y" goto LOCK
if /I "%cho%"=="N" goto END
echo Invalid choice.
goto CONFIRM
:LOCK
ren Private "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Folder locked
goto END 
:UNLOCK
echo Enter Password to unlock folder
set/p "pass=>"
if NOT "%pass%"=="your_password" goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Private
echo Folder Unlocked successfully
goto END 
:FAIL
echo Invalid Password
goto END
:MDLOCKER
md Private
echo Private created successfully
goto END
:END
