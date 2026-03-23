@echo off
title 🚀 Деплой на Vercel - БЕСПЛАТНЫЙ сервер
echo.
echo 🚀 СОЗДАНИЕ БЕСПЛАТНОГО СЕРВЕРА НА VERCEL
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

REM Проверяем зависимости
echo 📋 Проверяем зависимости...
if not exist node_modules (
    echo 📦 Устанавливаем зависимости...
    npm install
    if %errorlevel% neq 0 (
        echo ❌ Ошибка установки зависимостей!
        pause
        exit /b 1
    )
)

REM Проверяем Vercel CLI
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

REM Сборка проекта
echo 🔨 Собираем проект...
npm run build
if %errorlevel% neq 0 (
    echo ❌ Ошибка сборки проекта!
    pause
    exit /b 1
)

REM Деплой на Vercel
echo 🚀 Деплоим на Vercel...
echo.
echo 📋 ВАЖНО: Вам нужно будет:
echo    1. Войти в свой Vercel аккаунт (или создать новый)
echo    2. Разрешить доступ Vercel к вашему GitHub/GitLab
echo    3. Выбрать проект для деплоя
echo.

vercel --prod

if %errorlevel% neq 0 (
    echo ❌ Ошибка деплоя!
    pause
    exit /b 1
)

echo.
echo ✅ САЙТ УСПЕШНО ЗАДЕПЛОЕН!
echo.
echo 🌐 Ваш сайт доступен по ссылке которую показал Vercel
echo 📧 Вы можете отправить эту ссылку друзьям для тестирования
echo.
echo 📧 Для обновления сайта снова запустите этот скрипт
echo.

pause
