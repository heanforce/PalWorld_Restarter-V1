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
cd /d C:\server\Palworld Dedicated Server
start "" PalServer.exe -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS -log
exit


