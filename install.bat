@echo off
echo 🚀 Установка зависимостей для Sovetchik...
echo.

REM Устанавливаем PATH для Node.js
set PATH=%PATH%;C:\Program Files\nodejs

REM Проверяем Node.js
echo 📋 Проверяем Node.js...
node --version
if %errorlevel% neq 0 (
    echo ❌ Node.js не найден! Установите Node.js с https://nodejs.org/
    pause
    exit /b 1
)

REM Проверяем npm
echo 📋 Проверяем npm...
npm --version
if %errorlevel% neq 0 (
    echo ❌ npm не найден!
    pause
    exit /b 1
)

REM Устанавливаем зависимости
echo 📦 Устанавливаем зависимости...
npm install

if %errorlevel% neq 0 (
    echo ❌ Ошибка установки зависимостей!
    pause
    exit /b 1
)

echo.
echo ✅ Все зависимости установлены успешно!
echo 🚀 Теперь можно запустить сайт: npm run dev
echo.
pause
