@echo off
title 🚀 Быстрый деплой на Vercel
echo.
echo 🚀 БЫСТРЫЙ ДЕПЛОЙ НА VERCEL
echo.

REM Инициализация Git
echo 📦 Инициализация Git...
git init
git add .
git commit -m "Deploy Sovetchik AI Job Search Assistant"

REM Создание .gitignore если нет
if not exist .gitignore (
    echo .next > .gitignore
    echo out >> .gitignore
    echo node_modules >> .gitignore
    echo .DS_Store >> .gitignore
    echo *.log >> .gitignore
)

REM Установка Vercel CLI
echo 📦 Проверка Vercel CLI...
vercel --version >nul 2>&1
if %errorlevel% neq 0 (
    echo 📦 Установка Vercel CLI...
    npm install -g vercel
)

REM Вход в Vercel
echo 🔐 Вход в Vercel...
vercel login

REM Деплой
echo 🚀 Деплой проекта...
vercel --prod

echo.
echo ✅ ГОТОВО!
echo 🌐 Ваш сайт должен быть задеплоен
echo 📧 Проверьте консоль выше для ссылки
echo.
echo 📋 Следуйте инструкциям в браузере
echo.

pause
