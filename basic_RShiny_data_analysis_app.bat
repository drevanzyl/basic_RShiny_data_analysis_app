@echo off
setlocal EnableDelayedExpansion

echo ===============================================
echo Basic RShiny Data Analysis App
echo This app provides interactive data analysis tools
echo including data visualization and frequency tables.
echo ===============================================

echo Checking R installation...
where Rscript >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo Error: R is not installed or not in PATH
    pause
    exit /b 1
)


set "APP_PATH=%~dp0app.R"
set "APP_PATH=!APP_PATH:\=/!"

echo Starting Shiny app...
echo Note: To stop the app:
echo  - Close the browser window 
echo  - Press Ctrl+C in this window
echo -----------------------------------------------

Rscript -e "tryCatch(shiny::runApp('!APP_PATH!', launch.browser = TRUE), error = function(e) { message('Error: ', e); quit(status = 1) })"

if %ERRORLEVEL% neq 0 (
    echo Failed to start Shiny app
    pause
    exit /b 1
)

timeout /t 5 >nul



echo.
echo Press any key to close this window when you're done...
pause >nul

endlocal