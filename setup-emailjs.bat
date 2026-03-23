@echo off
title 🔧 Настройка EmailJS для Sovetchik
echo.
echo 🔧 НАСТРОЙКА EMAILJS - НАСТОЯЩИЙ EMAIL БЕСПЛАТНО!
echo.
echo 📋 ИНСТРУКЦИЯ:
echo.
echo 1️⃣  ОТКРОЙТЕ https://www.emailjs.com/ в браузере
echo 2️⃣  НАЖМИТЕ "Sign Up" и зарегистрируйтесь
echo 3️⃣  ПОДТВЕРДИТЕ email (проверьте почту)
echo.
echo 4️⃣  СОЗДАЙТЕ EMAIL SERVICE:
echo    - Перейдите в "Email Services"
echo    - Нажмите "Add New Service" 
echo    - Выберите "Gmail"
echo    - Нажмите "Connect" и разрешите доступ
echo    - Скопируйте Service ID
echo.
echo 5️⃣  СОЗДАЙТЕ EMAIL TEMPLATE:
echo    - Перейдите в "Email Templates"
echo    - Нажмите "Create New Template"
echo    - Template Name: Verification Code
echo    - Subject: 🔐 Confirm your email - Sovetchik
echo    - Вставьте HTML из файла EMAILJS-HTML.txt
echo    - Нажмите "Save"
echo    - Скопируйте Template ID
echo.
echo 6️⃣  ПОЛУЧИТЕ PUBLIC KEY:
echo    - Перейдите в "Account" → "API Keys"
echo    - Скопируйте Public Key
echo.
echo 7️⃣  ВВЕДИТЕ ДАННЫЕ НИЖЕ:
echo.

REM Получаем данные от пользователя
set /p serviceID="🔑 Service ID (выглядит как service_xxxxxxxxx): "
set /p templateID="📧 Template ID (выглядит как template_xxxxxxxxx): "
set /p userID="👤 Public Key (выглядит как user_xxxxxxxxx): "

echo.
echo ✅ ВВЕДЕННЫЕ ДАННЫЕ:
echo Service ID: %serviceID%
echo Template ID: %templateID%
echo Public Key: %userID%
echo.

REM Проверяем, что все данные введены
if "%serviceID%"=="" (
    echo ❌ Service ID не введен!
    pause
    exit /b 1
)

if "%templateID%"=="" (
    echo ❌ Template ID не введен!
    pause
    exit /b 1
)

if "%userID%"=="" (
    echo ❌ Public Key не введен!
    pause
    exit /b 1
)

echo 🔧 Обновляю конфигурацию EmailJS...

REM Создаем временный файл с конфигурацией
echo const EMAILJS_CONFIG = { > temp_config.js
echo   serviceID: '%serviceID%', >> temp_config.js
echo   templateID: '%templateID%', >> temp_config.js
echo   userID: '%userID%' >> temp_config.js
echo }; >> temp_config.js

echo.
echo ✅ Конфигурация создана!
echo 📧 Теперь нужно обновить файл utils/emailServiceDirect.ts
echo.

REM Показываем инструкции по обновлению файла
echo.
echo 📝 ИНСТРУКЦИЯ ОБНОВЛЕНИЯ ФАЙЛА:
echo 1. Откройте файл: utils\emailServiceDirect.ts
echo 2. Найдите строки:
echo    serviceID: 'service_default'
echo    templateID: 'template_default'  
echo    userID: 'user_default'
echo 3. Замените их на:
echo    serviceID: '%serviceID%'
echo    templateID: '%templateID%'
echo    userID: '%userID%'
echo 4. Сохраните файл
echo.

REM Создаем HTML файл с шаблоном
echo 📧 Создаю HTML шаблон для EmailJS...
(
echo ^<div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; background: #f9fafb;"^> > EMAILJS-HTML.txt
echo   ^<div style="background: linear-gradient^(135deg, #667eea 0%%, #764ba2 100%%^); padding: 40px; text-align: center; border-radius: 12px 12px 0 0;"^>^> >> EMAILJS-HTML.txt
echo     ^<h1 style="color: white; margin: 0; font-size: 28px;"^>🎉 Welcome to Sovetchik!^</h1^> >> EMAILJS-HTML.txt
echo     ^<p style="color: rgba^(255,255,255,0.9^); margin: 10px 0 0 0; font-size: 16px;"^>Your AI-powered job search assistant^</p^> >> EMAILJS-HTML.txt
echo   ^</div^>^> >> EMAILJS-HTML.txt
echo   ^<div style="padding: 40px; background: white; border-radius: 0 0 12px 12px;"^>^> >> EMAILJS-HTML.txt
echo     ^<h2 style="color: #1f2937; margin-bottom: 10px;"^>Hi {{{to_name}}}!^</h2^> >> EMAILJS-HTML.txt
echo     ^<p style="color: #6b7280; font-size: 16px; line-height: 1.5;"^>Thank you for signing up for Sovetchik! To complete your registration, please confirm your email address using the code below:^</p^> >> EMAILJS-HTML.txt
echo     ^<div style="background: #f8fafc; border: 2px solid #e5e7eb; border-radius: 8px; padding: 24px; text-align: center; margin: 30px 0;"^>^> >> EMAILJS-HTML.txt
echo       ^<div style="font-size: 14px; color: #6b7280; font-weight: 600; margin-bottom: 12px; text-transform: uppercase; letter-spacing: 0.5px;"^>Verification Code^</div^> >> EMAILJS-HTML.txt
echo       ^<div style="font-size: 32px; font-weight: 700; color: #667eea; letter-spacing: 4px; line-height: 1;"^>{{{{verification_code}}}^</div^> >> EMAILJS-HTML.txt
echo     ^</div^>^> >> EMAILJS-HTML.txt
echo     ^<div style="background: #fef3c7; border-left: 4px solid #f59e0b; padding: 16px; margin: 24px 0; border-radius: 0 8px 8px 0;"^>^> >> EMAILJS-HTML.txt
echo       ^<p style="color: #92400e; font-size: 14px; margin: 0;"^>^<strong^>⏰ Important:^</strong^> This code expires in 15 minutes. If you didn't create an account, please ignore this email.^</p^> >> EMAILJS-HTML.txt
echo     ^</div^>^> >> EMAILJS-HTML.txt
echo   ^</div^>^> >> EMAILJS-HTML.txt
echo ^</div^>^> >> EMAILJS-HTML.txt
)

echo.
echo ✅ HTML шаблон создан в файле: EMAILJS-HTML.txt
echo ✅ Конфигурация создана в файле: temp_config.js
echo.
echo 🚀 ЗАПУСКАЙТЕ САЙТ:
echo 1. Обновите файл utils\emailServiceDirect.ts
echo 2. Запустите start.bat
echo 3. Регистрируйтесь и проверьте почту!
echo.

pause
