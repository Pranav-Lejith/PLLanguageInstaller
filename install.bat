@echo off
echo Installing PL Interpreter...

rem Set the installation directory
set "lang_dir=C:\Program Files\PL"

rem Create the installation directory if it doesn't exist
if not exist "%lang_dir%" (
    mkdir "%lang_dir%"
)

rem Copy the executable to the installation directory
xcopy /E /I /Y "pl_interpreter.exe" "%lang_dir%"

rem Add the installation directory to the system PATH
setx PATH "%PATH%;%lang_dir%"

echo Installation complete! You can now run your PL interpreter from the command line.
pause
