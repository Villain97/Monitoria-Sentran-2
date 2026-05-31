@echo off
cd /d "%~dp0"
echo Atualizando status uma vez...
python scripts\motor_status_local.py --contratos Amparo --uma-vez
pause
