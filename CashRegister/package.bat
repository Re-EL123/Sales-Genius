@echo off
echo Running jpackage...

"C:\Program Files\Java\jdk-24\bin\jpackage.exe" ^
  --input target ^
  --name CashRegister ^
  --main-jar CashRegister-1.0-SNAPSHOT.jar ^
  --main-class com.mycompany.cashregister.CashRegister ^
  --type exe ^
  --icon src\main\java\resources\appicon.ico ^
  --app-version 1.0 ^
  --win-console ^
  --win-shortcut ^
  --win-menu ^
  --dest installer

echo Exit code: %ERRORLEVEL%
pause
