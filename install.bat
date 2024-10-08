@echo off
setlocal

:: Get the directory of the current .bat file (where pl_interpreter.exe is located)
set INTERPRETER_DIR=%~dp0
set INTERPRETER_SRC=%INTERPRETER_DIR%pl_interpreter.exe

:: Create a directory for the interpreter in the user's home directory
set DEST_DIR=%USERPROFILE%\pl_interpreter

if not exist "%DEST_DIR%" (
    mkdir "%DEST_DIR%"
)

:: Copy the interpreter to the newly created folder
echo Copying pl_interpreter.exe to %DEST_DIR%...
copy "%INTERPRETER_SRC%" "%DEST_DIR%"

:: Check if the copy was successful
if %ERRORLEVEL% neq 0 (
    echo Failed to copy pl_interpreter.exe to %DEST_DIR%. Make sure you have the necessary privileges.
    pause
    exit /b 1
)

:: Check if the interpreter directory is already in the PATH
echo Setting environment variable PATH...
for /F "tokens=*" %%a in ('echo %PATH%') do (
    echo %%a | find /I "%DEST_DIR%" >nul
    if errorlevel 1 (
        :: Add to PATH if not already present
        setx PATH "%PATH%;%DEST_DIR%"
    )
)

:: Completion message
echo Installation completed successfully. You can now run 'pl_interpreter' from any command line.
pause
endlocal
exit /b 0
