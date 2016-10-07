@echo off
set slmgr_cmd=cscript "%WINDIR%\system32\"slmgr.vbs /dli
FOR /f "tokens=2 delims=:" %%G IN ('%slmgr_cmd% ^|find "Registered KMS machine"') DO echo%%G 