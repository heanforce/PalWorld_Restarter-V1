@echo off
SETLOCAL

SET steamcmd_root_path=%~dp0\steamcmd_palworld
SET steamcmd_file=%steamcmd_root_path%\steamcmd.exe
SET steamcmd_install_file=%steamcmd_root_path%\installer\steamcmd.exe

IF NOT EXIST "%steamcmd_file%" (
    COPY "%steamcmd_install_file%" "%steamcmd_file%"
)

"%steamcmd_file%" +force_install_dir "%~dp0\." +login anonymous +app_update 2394010 validate +quit

@echo off

REM Change the current directory to the script's directory
cd /d %~dp0

REM Add a 5-second delay using the timeout command
timeout /t 5 /nobreak

start "" PalServer.exe -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS -log
exit
