@echo off
title 🚀 Деплой сайта на Vercel
echo.
echo 🚀 ЗАПУСКАЕМ ДЕПЛОЙ САЙТА
echo.

REM Проверяем Node.js
echo 📋 Проверяем Node.js...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js не найден!
    pause
    exit /b 1
)

REM Установка зависимостей если нужно
if not exist node_modules (
    echo 📦 Устанавливаем зависимости...
    npm install
)

REM Очистка старых сборок
echo 🧹 Очищаем старые сборки...
if exist ".next" rmdir /s /q ".next"
if exist "out" rmdir /s /q "out"

REM Сборка проекта
echo 🔨 Собираем проект...
npm run build
if %errorlevel% neq 0 (
    echo ❌ Ошибка сборки!
    pause
    exit /b 1
)

REM Проверяем что out папка создалась
if not exist "out" (
    echo ❌ Папка out не создалась!
    pause
    exit /b 1
)

echo ✅ Сборка завершена!

REM Установка Vercel CLI
echo 📋 Проверяем Vercel CLI...
vercel --version >nul 2>&1
if %errorlevel% neq 0 (
    echo 📦 Устанавливаем Vercel CLI...
    npm install -g vercel
)

REM Деплой
echo 🚀 Деплоим на Vercel...
echo.
echo 📋 Откроется браузер для входа в Vercel
echo 📋 Следуйте инструкциям на экране
echo.

vercel --prod

echo.
echo ✅ ГОТОВО!
echo 🌐 Ваш сайт задеплоен!
echo 📧 Ссылка будет показана выше
echo 📱 Сайт оптимизирован для мобильных устройств
echo.

pause
