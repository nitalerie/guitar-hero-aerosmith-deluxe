@echo off

cd "%~dp0..\.."
python dependencies\python\gen_version.py _qb/dx/dx_version.q
python dependencies\python\configure_build.py ps3

if %errorlevel% neq 0 (pause /b %errorlevel% && exit /b %errorlevel%)

start "" "%~dp0..\..\out\ps3"