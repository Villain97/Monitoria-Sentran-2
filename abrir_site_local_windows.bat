@echo off
cd /d "%~dp0"
echo Abrindo servidor local em http://localhost:8000/login.html
echo Mantenha esta janela aberta enquanto usa o site.
start "Motor Status" cmd /k python scripts\motor_status_local.py --contratos Amparo --intervalo 30
start "" http://localhost:8000/login.html
python -m http.server 8000
pause
