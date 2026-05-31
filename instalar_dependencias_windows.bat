@echo off
cd /d "%~dp0"
echo Instalando dependencias do motor de status...
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python -m playwright install chromium
echo.
echo Instalacao concluida.
pause
