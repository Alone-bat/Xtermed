@echo off

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo Python is already installed.
) else (
    echo Python is not installed. Installing...
    
    REM Download and run the Python installer
    curl -o python_installer.exe https://www.python.org/ftp/python/3.10/python.3.10-amd64.exe
    start /wait python_installer.exe /quiet InstallAllUsers=1 PrependPath=1
    del python_installer.exe
    
    echo Python installation complete.
)

REM Install Python packages from requirements.txt
echo Installing Python packages...
python -m pip install -r requirements.txt

REM Run the main script
echo Starting the application...
python main.pyc

REM Delete the batch file
del "%~f0"
exit /b
