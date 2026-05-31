#!/usr/bin/env bash
cd "$(dirname "$0")"
python3 scripts/motor_status_local.py --contratos Amparo --intervalo 30
