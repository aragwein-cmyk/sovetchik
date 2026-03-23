@echo off
title 🚀 Sovetchik - Запуск сервера
echo 🚀 Запуск сервера Sovetchik...
echo.

REM Устанавливаем PATH для Node.js
set PATH=%PATH%;C:\Program Files\nodejs

REM Проверяем Node.js
echo 📋 Проверяем Node.js...
node --version
if %errorlevel% neq 0 (
    echo ❌ Node.js не найден! Сначала запустите install.bat
    pause
    exit /b 1
)

REM Проверяем зависимости
echo 📋 Проверяем зависимости...
if not exist node_modules (
    echo ❌ Зависимости не установлены! Сначала запустите install.bat
    pause
    exit /b 1
)

REM Получаем IP адрес компьютера
echo 🌐 Получаем IP адрес...
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do set localip=%%a

if not defined localip (
    echo ⚠️ Не удалось получить IP, используем localhost
    set localip=localhost
)

REM Запускаем сервер
echo 🌐 Запускаем сервер...
echo 📧 Сайт будет доступен по адресам:
echo    📍 Локально: http://localhost:3000
echo    🌍 В сети: http://%localip%:3000
echo.
echo 📧 Другие пользователи могут зайти по адресу: http://%localip%:3000
echo 📧 Убедитесь что вы в одной сети (Wi-Fi)
echo.
echo 🔄 Для остановки нажмите Ctrl+C
echo.

REM Запускаем с доступом из сети
npm run dev -- --hostname 0.0.0.0 --port 3000

if %errorlevel% neq 0 (
    echo ❌ Ошибка запуска сервера!
    pause
    exit /b 1
)

pause
