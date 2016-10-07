@echo off
IF exist "%ProgramFiles(x86)%\Microsoft Office\Office16\WINWORD.exe" set ospp_cmd=cscript.exe "%ProgramFiles(x86)%\Microsoft Office\Office16\"ospp.vbs /dstatus&GOTO RUN
IF exist "%ProgramFiles%\Microsoft Office\Office16\WINWORD.exe" set ospp_cmd=cscript.exe "%ProgramFiles%\Microsoft Office\Office16\"ospp.vbs /dstatus&GOTO RUN
IF exist "%ProgramFiles(x86)%\Microsoft Office\Office15\WINWORD.exe" set ospp_cmd=cscript.exe "%ProgramFiles(x86)%\Microsoft Office\Office15\"ospp.vbs /dstatus&GOTO RUN
IF exist "%ProgramFiles%\Microsoft Office\Office15\WINWORD.exe" set ospp_cmd=cscript.exe "%ProgramFiles%\Microsoft Office\Office15\"ospp.vbs /dstatus&GOTO RUN
IF exist "%ProgramFiles(x86)%\Microsoft Office\Office14\WINWORD.exe" set ospp_cmd=cscript.exe "%ProgramFiles(x86)%\Microsoft Office\Office14\"ospp.vbs /dstatus&GOTO RUN
IF exist "%ProgramFiles%\Microsoft Office\Office14\WINWORD.exe" set ospp_cmd=cscript.exe "%ProgramFiles%\Microsoft Office\Office14\"ospp.vbs /dstatus&GOTO RUN

Echo Supported version of Microsoft Office not installed

:RUN
FOR /f "tokens=2 delims=:" %%H IN ('%ospp_cmd% ^|find "LICENSE NAME"') DO SET _licname=%%H
FOR /f "tokens=1 delims=(" %%I IN ('%ospp_cmd% ^|find "REMAINING GRACE"') DO SET _licgrace=%%I
FOR /f "tokens=2 delims=-" %%G IN ('%ospp_cmd% ^|find "STATUS"') DO echo %%G - %_licname% - %_licgrace%