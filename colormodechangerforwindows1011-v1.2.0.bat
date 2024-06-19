@echo off
set "params=%*"
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

chcp 65001 >nul 

title Color Mode Changer for Windows 10/11 - v1.2.0
echo ========================================================
echo =      Color Mode Changer for Windows 10/11 - v1.2.0   =
echo ========================================================
echo =                 Made by Jacob Nicked                 =
echo ========================================================
echo.

:choose_language

echo Choose a language/Wybierz język:
echo 1. English
echo 2. Polski
echo.
set /p "langchoice="

if %langchoice%==1 (
    set language=English
) else if %langchoice%==2 (
    set language=Polski
) else (
    echo Try again. Spróbuj ponownie.
    goto choose_language 
)

echo.

if %language%==English (
    cls
    echo ========================================================
    echo =      Color Mode Changer for Windows 10/11 - v1.2.0   =
    echo ========================================================
    echo =                 Made by Jacob Nicked                 =
    echo ========================================================
    echo.

    echo Hello, %username%! 
    echo.

    echo The tool modifies the Windows registry, which means the OS will be modified. 
    echo It should not break your PC, but if this happens so, I am NOT responsible for that - you use the tool for your own responsibility.
    echo Make sure to run the tool as administrator.
    echo.
) else (
    cls
    echo ========================================================
    echo =     Color Mode Changer for Windows 10/11 - v1.2.0    =
    echo ========================================================
    echo =                 Made by Jacob Nicked                 =
    echo ========================================================
    echo.
    echo Witaj, %username%! 
    echo.

    echo To narzędzie modyfikuje rejestr systemu Windows, co oznacza, że system operacyjny zostanie zmodyfikowany. 
    echo Nie powinno to uszkodzić komputera, ale jeśli tak się stanie, NIE ponoszę za to odpowiedzialności - używasz narzędzia na własną odpowiedzialność.
    echo Upewnij się, że uruchamiasz narzędzie jako administrator.
    echo.   
)

:choose_mode  

if %language%==English (
    echo Choose a mode:
    echo 1. Dark
    echo 2. Light
    echo 3. Exit
) else (
    echo Wybierz tryb:
    echo 1. Ciemny
    echo 2. Jasny
    echo 3. Wyjdź
)
echo.
set /p "answer="

if %answer%==1 goto dark
if %answer%==3 goto exit
if %answer%==2 goto light

:dark
echo.
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d 0 /f
echo.
if %language%==English (
    echo Set the dark mode successfully. Restart File Explorer or your PC. Press any key to exit.
) else (
    echo Ustawiono tryb ciemny. Uruchom ponownie Eksplorator plików lub komputer. Naciśnij dowolny klawisz, aby wyjść.
)
pause > nul
exit

:exit
exit

:light
echo.
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d 1 /f
echo.
if %language%==English (
    echo Set the light mode successfully. Restart File Explorer or your PC. Press any key to exit.
) else (
    echo Ustawiono tryb jasny. Uruchom ponownie Eksplorator plików lub komputer. Naciśnij dowolny klawisz, aby wyjść.
)
pause > nul
exit
