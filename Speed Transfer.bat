@echo off
:: THIS IS VERY IMPORTANT!!!
:: If this text looks weird to you in Notepad, it's because you need Notepad++ to see this correctly
:: Created by u/BritishSyndicate on Reddit (aka Grim - VTuber)
Setlocal
::EchoANSI.cmd
cls
:: Display a sample of all the ANSI colours.
:: Requires windows 1909 or newer

:: Define foreground and background ANSI colors:
Set _fBlack=[30m
Set _bBlack=[40m
Set _fRed=[31m
Set _bRed=[41m
Set _fGreen=[32m
Set _bGreen=[42m
Set _fYellow=[33m
Set _bYellow=[43m
Set _fBlue=[34m
Set _bBlue=[44m
Set _fMag=[35m
Set _bMag=[45m
Set _fCyan=[36m
Set _bCyan=[46m
Set _fLGray=[37m
Set _bLGray=[47m
Set _fDGray=[90m
Set _bDGray=[100m
Set _fBRed=[91m
Set _bBRed=[101m
Set _fBGreen=[92m
Set _bBGreen=[102m
Set _fBYellow=[93m
Set _bBYellow=[103m
Set _fBBlue=[94m
Set _bBBlue=[104m
Set _fBMag=[95m
Set _bBMag=[105m
Set _fBCyan=[96m
Set _bBCyan=[106m
Set _fBWhite=[97m
Set _bBWhite=[107m
Set _RESET=[0m
Set b=[1m
Set u=[4m
Set i=[7m

:check_Permissions
cls
echo Administrative permissions required. Detecting permissions...
echo.
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
	set _admin="yes"
	title Windows File Transfer - Speed Up!
) else (
    echo Failure: Current permissions inadequate.
	set _admin="no"
	title Normal: Windows File Transfer - Speed Up!
)
echo.
echo 
goto real_start

:real_start
cls
echo %_fBRed%%u%THIS IS A WARNING SCREEN AND PROMPT!!%_RESET%
echo.
Echo:
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                           ³
Echo  ³ Would you like to turn off the slow transfer speeds of Windows Explorer?  ³
Echo  ³ If (%_fGreen%%u%yes/y%_RESET%) this may cause your copmputer to slow down considerablly       ³
Echo  ³         And may use more of your RAM and CPU.                             ³
Echo  ³ Otherwise, put (%_fGreen%%u%no/n%_RESET%) to turn this back off and not slow down             ³
Echo  ³         your computer, restoring it to factory settings.                  ³
Echo  ³                                                                           ³
if %_admin%=="no" (
	Echo  ³ %_fBWhite%%_bBRed%THIS PROGRAM IS CURRENTLY NOT RAN WITH ADMIN PRIVLIGES!!%_RESET%                  ³
	Echo  ³ %_fBWhite%%_bBRed%PLEASE RUN THIS PROGRAM AGAIN WITH ADMIN PRIVLIGES!!%_RESET%                      ³
	Echo  ³                                                                           ³
)
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo:
echo.
echo This is a %u%%_fYellow%ONE TIME%_RESET% prompt (for this session ONLY).
set /p scramble=Y/N: || set scramble=Y
set skip="n"
if /i "%scramble%"=="Yes" (
	goto yes
) else if /i "%scramble%"=="Y" (
	goto yes
) else if /i "%scramble%"=="Yes_skip" (
	set skip="y"
	goto yes
) else if /i "%scramble%"=="Y_skip" (
	set skip="y"
	goto yes
) else if /i "%scramble%"=="No" (
	goto no
) else if /i "%scramble%"=="N" (
	goto no
) else if /i "%scramble%"=="No_skip" (
	set skip="y"
	goto no
) else if /i "%scramble%"=="N_skip" (
	set skip="y"
	goto no
) else (
	goto real_start
)

:yes
echo.
echo ---------------------------------------------------------
echo.
if /i "%skip%"=="n" (
	winsat formal
)
netsh int tcp set global autotuninglevel=disabled
wmic computersystem where name=”%computername%” set AutomaticManagedPagefile=False
wmic pagefileset where name=”C:\\pagefile.sys” set InitialSize=4096, MaximumSize=8192
goto report


:no
echo.
echo ---------------------------------------------------------
echo.
if /i "%skip%"=="n" (
	winsat formal
)
netsh int tcp set global autotuninglevel=normal
wmic computersystem where name=”%computername%” set AutomaticManagedPagefile=True
wmic pagefileset where name=”C:\\pagefile.sys” set InitialSize=16, MaximumSize=4985
goto report


:report
echo.
echo ---------------------------------------------------------
echo.
echo You can find the final report of changes and other data at:
echo        (Local Drive):\Windows\Performance\Winsat\DataStore\
echo              (Today Date + Time) Formal.Assessment.WinSAT.xml
echo.
echo There you will find a report of elements like CPU, RAM, and others, and 
echo        provide you with a system report that you can use to understand 
echo        which part of your PC needs to be improved.
echo.
echo ---------------------------------------------------------
echo.
echo You may now safely close this program....
echo Good Bye! :)
goto reboot



:reboot
echo.
echo ---------------------------------------------------------
echo.
echo A reboot is required, would you like to Reboot?
set /p reboot=Y/N: || set reboot=n
if /i "%reboot%" == "Y" (
	goto RESTART
) else if /i "%reboot%"=="Yes" (
	goto RESTART
) else if /i "%reboot%"=="N" (
	exit
) else if /i "%reboot%"=="No" (
	exit
) else (
	goto reboot
)


:RESTART
echo.
echo ---------------------------------------------------------
echo.
echo Your computer will restart in 30-60 seconds!
echo If you wish to stop this, please close this program....
timeout 30
shutdown /r /t 30
exit