@echo off
Title Windows7系统垃圾快速清理
echo            按任意键开始清理垃圾文件......
echo.
pause>nul
cls
echo      正在清理Tmp文件....
echo.
attrib -r -a -s -h "%systemdrive%\*.tmp" /d /s>nul 2>nul
attrib -r -a -s -h "%systemdrive%\*._mp" /d /s>nul 2>nul
del /f /s /q "%systemdrive%\*.tmp">nul 2>nul
del /f /s /q "%systemdrive%\*._mp">nul 2>nul
cls
echo      正在清理日志文件....
echo.
attrib -r -a -s -h "%systemdrive%\*.log" /d /s>nul 2>nul
del /f /s /q "%systemdrive%\*.log">nul 2>nul
cls
echo      正在清理Gid文件....
echo.
attrib -r -a -s -h "%systemdrive%\*.gid" /d /s>nul 2>nul
del /f /s /q "%systemdrive%\*.gid">nul 2>nul
cls
echo      正在清理Chk文件....
echo.
attrib -r -a -s -h "%systemdrive%\*.chk" /d /s>nul 2>nul
del /f /s /q "%systemdrive%\*.chk">nul 2>nul
cls
echo      正在清理Old文件....
echo.
attrib -r -a -s -h "%systemdrive%\*.old" /d /s>nul 2>nul
del /f /s /q "%systemdrive%\*.old">nul 2>nul
cls
echo      正在清理回收站....
echo.
attrib -r -a -s -h "%systemdrive%\recycled\*.*" /d /s>nul 2>nul
del /f /s /q "%systemdrive%\recycled\*.*">nul 2>nul
cls
echo      正在清理备份文件....
echo.
attrib -r -a -s -h "%windir%\*.bak" /d /s>nul 2>nul
del /f /s /q "%windir%\*.bak">nul 2>nul
cls
echo      正在清理文件使用痕迹....
echo.
attrib -r -a -s -h "%windir%\prefetch\*.pf" /d /s>nul 2>nul
del /f /s /q "%windir%\prefetch\*.pf">nul 2>nul
cls
echo      正在清理Cookies文件....
echo.
attrib -r -a -s -h "%userprofile%\cookies\*.*" /d /s>nul 2>nul
del /f /q "%userprofile%\cookies\*.*">nul 2>nul
cls
echo      正在清理上网产生的临时文件....
echo.
attrib -r -a -s -h "%userprofile%\Local Settings\Temporary Internet Files\*.*" /d /s>nul 2>nul
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*">nul 2>nul
cls
echo      正在清理临时文件....
echo.
attrib -r -a -s -h "%userprofile%\Local Settings\Temp\*.*" /d /s>nul 2>nul
del /f /s /q "%userprofile%\Local Settings\Temp\*.*">nul 2>nul
cls
echo      正在清理用户历史文件....
echo.
attrib -r -a -s -h "%userprofile%\recent\*.*" /d /s>nul 2>nul
del /f /s /q "%userprofile%\recent\*.*">nul 2>nul
cls
echo                 清理系统垃圾完成！
echo.
echo                 按任意键退出......
pause>nul
