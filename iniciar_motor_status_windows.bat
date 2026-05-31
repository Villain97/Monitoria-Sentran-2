@echo off
cd /d "%~dp0"
echo Iniciando motor de status SPLTV...
echo Para parar, feche esta janela.
python scripts\motor_status_local.py --contratos Amparo --intervalo 30
pause
