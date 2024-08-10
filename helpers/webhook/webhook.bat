@echo off

set WEBHOOK_URL=%~1
set MESSAGE=%~2

rem Send the POST request to the webhook URL using curl
curl -H "Content-Type: application/json" ^
     -d "{\"content\": \"%MESSAGE%\"}" ^
     %WEBHOOK_URL%

