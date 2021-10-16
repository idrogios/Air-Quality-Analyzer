@ECHO OFF
ECHO Starting PHP FastCGI...
set PATH=C:\PHP;%PATH%
C:\PHP\php-cgi.exe -b 127.0.0.1:9123