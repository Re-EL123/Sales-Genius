@echo off
setlocal

:: Set paths manually
set "MAVEN_BIN=C:\Program Files\Apache\Maven\apache-maven-3.9.11\bin\mvn.cmd"
set "JPACKAGE_BIN=C:\Program Files\Java\jdk-24\bin\jpackage.exe"
set "MAIN_JAR=CashRegister-1.0-SNAPSHOT.jar"
set "MAIN_CLASS=com.mycompany.cashregister.CashRegister"
set "APP_NAME=CashRegister"
set "ICON_PATH=src\main\java\resources\appicon.ico"
set "VERSION=1.0"

echo 🔧 Building Maven project...
"%MAVEN_BIN%" clean package

IF NOT EXIST "target\%MAIN_JAR%" (
    echo ❌ Build failed or JAR not found.
    pause
    exit /b 1
)

echo 📦 Packaging with jpackage...
"%JPACKAGE_BIN%" ^
  --input target ^
  --name "%APP_NAME%" ^
  --main-jar "%MAIN_JAR%" ^
  --main-class "%MAIN_CLASS%" ^
  --type exe ^
  --icon "%ICON_PATH%" ^
  --java-options "--enable-preview --enable-native-access=ALL-UNNAMED" ^
  --app-version "%VERSION%" ^
  --win-console

IF %ERRORLEVEL% NEQ 0 (
    echo ❌ jpackage failed.
    pause
    exit /b 1
)

echo ✅ Installer created successfully!
pause
endlocal
