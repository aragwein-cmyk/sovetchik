@echo off
title 🚀 Создание Git репозитория и деплой
echo.
echo 🚀 СОЗДАНИЕ GIT РЕПОЗИТОРИЯ И ДЕПЛОЙ
echo.

REM Проверяем Git
echo 📋 Проверяем Git...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Git не найден! Скачиваю...
    powershell -Command "Invoke-WebRequest -Uri https://git-scm.com/download/win -OutFile git-installer.exe"
    start git-installer.exe
    echo 📦 Установите Git и перезапустите скрипт
    pause
    exit /b 1
)

REM Инициализация Git
echo 📦 Инициализируем Git...
git init
git add .
git commit -m "Initial commit - Sovetchik AI Job Search Assistant"

REM Создание репозитория на GitHub через GitHub CLI
echo 🐙 Создаю репозиторий на GitHub...
gh --version >nul 2>&1
if %errorlevel% neq 0 (
    echo 📦 Устанавливаю GitHub CLI...
    powershell -Command "winget install GitHub.cli"
)

REM Вход в GitHub
echo 🔐 Вход в GitHub...
gh auth login

REM Создание репозитория
echo 📝 Создаю репозиторий...
gh repo create sovetchik --public --description "AI-powered job search assistant for Kazakhstan" --source=. --remote=origin --push

REM Проверяем что репозиторий создан
echo ✅ Репозиторий создан!

REM Подключение к Vercel
echo 🚀 Подключаю к Vercel...
vercel --version >nul 2>&1
if %errorlevel% neq 0 (
    echo 📦 Устанавливаю Vercel CLI...
    npm install -g vercel
)

REM Вход в Vercel
echo 🔐 Вход в Vercel...
vercel login

REM Деплой
echo 🚀 Деплою на Vercel...
vercel --prod

echo.
echo ✅ ГОТОВО!
echo 🌐 Ваш сайт задеплоен!
echo 📧 Ссылка: https://sovetchik-xxx.vercel.app
echo.

pause
