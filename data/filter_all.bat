@echo off
echo Running all filtering scripts...

echo.
echo Filtering Disability_status.jsonl...
powershell -ExecutionPolicy Bypass -File ".\disability\filter_disability.ps1"

echo.
echo Filtering Gender_identity.jsonl...
powershell -ExecutionPolicy Bypass -File ".\gender\filter_gender.ps1"

echo.
echo Filtering Physical_appearance.jsonl...
powershell -ExecutionPolicy Bypass -File ".\physical\filter_physical.ps1"

echo.
echo Filtering Religion.jsonl...
powershell -ExecutionPolicy Bypass -File ".\religion\filter_religion.ps1"

echo.
echo All filtering complete!
echo. 