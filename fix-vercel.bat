@echo off
title 🔧 Исправление Vercel
echo.
echo 🔧 ИСПРАВЛЕНИЕ ПРОБЛЕМЫ С VERCEL
echo.

REM Устанавливаем правильный PATH
set PATH=%PATH%;C:\Program Files\nodejs

REM Проверяем Node.js
echo 📋 Проверяем Node.js...
"C:\Program Files\nodejs\node.exe" --version
if %errorlevel% neq 0 (
    echo ❌ Node.js не найден!
    pause
    exit /b 1
)

REM Проверяем npm
echo 📋 Проверяем npm...
"C:\Program Files\nodejs\npm.cmd" --version
if %errorlevel% neq 0 (
    echo ❌ npm не найден!
    pause
    exit /b 1
)

REM Выходим из Vercel
echo 🚪 Выходим из Vercel...
"C:\Program Files\nodejs\npx.cmd" vercel logout

REM Входим в Vercel
echo 🔐 Входим в Vercel...
"C:\Program Files\nodejs\npx.cmd" vercel login

REM Деплоим проект
echo 🚀 Деплоим проект...
"C:\Program Files\nodejs\npx.cmd" vercel --prod

echo.
echo ✅ ГОТОВО!
echo 🌐 Ваш сайт должен быть задеплоен
echo 📧 Проверьте ссылку в консоли выше
echo.

pause
