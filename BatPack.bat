@echo off

set /p file=����Դ�ļ�����
set /p outBat=���bat�ļ�����

certutil -encode -f "%file%" _body.bat

echo @echo off>_header.bat
echo set /p decodeName=����ļ�����>>_header.bat
echo certutil -decode -f "%%~f0" "%%decodeName%%">>_header.bat
echo exit /b 1>>_header.bat

copy _header.bat+_body.bat %outBat%

del _header.bat _body.bat

pause