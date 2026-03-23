@echo off
title 🔧 Исправление деплоя Vercel
echo.
echo 🔧 ИСПРАВЛЕНИЕ ПРОБЛЕМЫ С DEPLOYMENT
echo.

REM Проверяем Node.js
echo 📋 Проверяем Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js не найден! Установите с https://nodejs.org/
    pause
    exit /b 1
)

REM Проверяем npm
echo 📋 Проверяем npm...
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm не найден!
    pause
    exit /b 1
)

REM Очистка кэша и старых сборок
echo 🧹 Очищаем кэш и старые сборки...
if exist ".next" (
    echo 🗑️ Удаляем папку .next...
    rmdir /s /q ".next"
)
if exist "out" (
    echo 🗑️ Удаляем папку out...
    rmdir /s /q "out"
)
if exist "vercel.json" (
    echo 🗑️ Удаляем старый vercel.json...
    del "vercel.json"
)

REM Установка зависимостей
echo 📦 Проверяем зависимости...
if not exist node_modules (
    echo 📦 Устанавливаем зависимости...
    npm install
    if %errorlevel% neq 0 (
        echo ❌ Ошибка установки зависимостей!
        pause
        exit /b 1
    )
)

REM Создание правильной конфигурации Vercel
echo 📝 Создаем конфигурацию Vercel...
echo { > vercel.json
echo   "name": "sovetchik", >> vercel.json
echo   "version": 2, >> vercel.json
echo   "buildCommand": "npm run build", >> vercel.json
echo   "outputDirectory": "out", >> vercel.json
echo   "installCommand": "npm install", >> vercel.json
echo   "framework": "nextjs", >> vercel.json
echo   "regions": ["iad1"], >> vercel.json
echo   "functions": { >> vercel.json
echo     "api/send-email/route.js": { >> vercel.json
echo       "maxDuration": 10 >> vercel.json
echo     } >> vercel.json
echo   } >> vercel.json
echo } >> vercel.json

REM Сборка проекта
echo 🔨 Собираем проект...
npm run build
if %errorlevel% neq 0 (
    echo ❌ Ошибка сборки проекта!
    pause
    exit /b 1
)

REM Проверяем что out папка создалась
if not exist "out" (
    echo ❌ Папка out не создалась! Проверяем ошибки сборки...
    pause
    exit /b 1
)

echo ✅ Сборка завершена успешно!
echo 📁 Папка out создана и готова к деплою.

REM Установка Vercel CLI если нужно
echo 📋 Проверяем Vercel CLI...
vercel --version >nul 2>&1
if %errorlevel% neq 0 (
    echo 📦 Устанавливаем Vercel CLI...
    npm install -g vercel
    if %errorlevel% neq 0 (
        echo ❌ Ошибка установки Vercel!
        pause
        exit /b 1
    )
)

REM Деплой на Vercel с правильными параметрами
echo 🚀 Деплоим на Vercel с чистой конфигурацией...
echo.
echo 📋 ВАЖНО: 
echo    1. Войдите в свой Vercel аккаунт
echo    2. Выберите "Create New Project"
echo    3. Импортируйте папку проекта
echo    4. Оставьте预设 настройки по умолчанию
echo.

vercel --prod --force

if %errorlevel% neq 0 (
    echo ❌ Ошибка деплоя!
    echo.
    echo 🔧 Возможные решения:
    echo    1. Очистите кэш Vercel: vercel logout && vercel login
    echo    2. Проверьте права доступа к папке
    echo    3. Попробуйте удалить и создать проект заново
    pause
    exit /b 1
)

echo.
echo ✅ САЙТ УСПЕШНО ЗАДЕПЛОЕН!
echo.
echo 🌐 Ваш сайт доступен по новой ссылке!
echo 📧 Проверьте консоль Vercel для получения URL
echo.
echo 📧 Если ссылка не работает, подождите 2-3 минуты
echo.
echo 📧 Для обновления сайта снова запустите этот скрипт
echo.

pause
