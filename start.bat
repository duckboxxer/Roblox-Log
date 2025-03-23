@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrator privileges. Please run it as administrator.
    pause
    exit /b
)

color 4

:: Define paths
set "paths=%localappdata%\Roblox\logs %localappdata%\Fishstrap\logs %localappdata%\Bloxstrap\logs"

:: Loop through each path and check for files
for %%p in (%paths%) do (
    if exist "%%p\*.*" (
        del /q /f "%%p\*.*"
        echo Deleted logs in: %%p
    ) else (
        echo Not found: %%p
    )
)

echo Cleanup completed.
pause
