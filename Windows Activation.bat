@echo off
set slmgr_cmd=cscript "%WINDIR%\system32\"slmgr.vbs /dli
FOR /f "tokens=2 delims=:" %%H IN ('%slmgr_cmd% ^|find "Description"') DO SET _licdesc=%%H
FOR /f "tokens=7 delims=( " %%I IN ('%slmgr_cmd% ^|find "Volume"') DO SET _licgrace=%%I
FOR /f "tokens=2 delims=:" %%G IN ('%slmgr_cmd% ^|find "License Status"') DO echo%%G - %_licdesc% - Expiration: %_licgrace% days(s)