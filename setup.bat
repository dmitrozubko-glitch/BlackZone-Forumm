@echo off
REM BlackZone Forum - Setup Script for Windows

echo ============================================
echo BlackZone Forum - Installation
echo ============================================

REM Check if Node.js is installed
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo Node.js не встановлено!
    echo Завантажте Node.js з https://nodejs.org/
    pause
    exit /b 1
)

echo Node.js знайдено!
echo.

REM Install server dependencies
echo Встановлення залежностей Backend...
cd server
call npm install
if %errorlevel% neq 0 (
    echo Помилка при встановленні Backend!
    pause
    exit /b 1
)

cd ..

REM Install client dependencies
echo.
echo Встановлення залежностей Frontend...
cd client
call npm install
if %errorlevel% neq 0 (
    echo Помилка при встановленні Frontend!
    pause
    exit /b 1
)

cd ..

echo.
echo ============================================
echo Встановлення завершено!
echo ============================================
echo.
echo Щоб запустити додаток:
echo 1. Відкрийте 2 терміналу
echo.
echo Terminal 1:
echo   cd server
echo   npm start
echo.
echo Terminal 2:
echo   cd client
echo   npm start
echo.
echo Додаток буде доступний на http://localhost:3000
echo.
pause
