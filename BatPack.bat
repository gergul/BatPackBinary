@echo off

set /p file=输入源文件名：
set /p outBat=输出bat文件名：

certutil -encode -f "%file%" _body.bat

echo @echo off>_header.bat
echo set /p decodeName=输出文件名：>>_header.bat
echo certutil -decode -f "%%~f0" "%%decodeName%%">>_header.bat
echo exit /b 1>>_header.bat

copy _header.bat+_body.bat %outBat%

del _header.bat _body.bat

pause