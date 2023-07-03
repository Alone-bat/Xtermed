python -m pip install -r requirements.txt
cls
echo python main.pyc >> start.bat
start start.bat
start /b "" cmd /c del "%~f0"&exit /bs