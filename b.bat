@ECHO OFF
set result=%date%-%time%
@echo %result%
echo %result% >> t3.txt
set /a x=1
pause
cls
:start
@ECHO Uplaod bin files to esp32
@ECHO Connect ESP32 and
PAUSE
@ECHO Press boot button when serial port is printed and till uploading starts
echo Device-%x% >> t3.txt
REM esptool.py --chip esp32 --port COM3 --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 80m --flash_size detect 0xe000 file(1).bin 0x1000 file(2).bin 0x10000 file(3).bin 0x8000 file(4).bin > t.txt
powershell "esptool.py --chip esp32 --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 80m --flash_size detect 0xe000 file1.bin 0x1000 file2.bin 0x10000 file3.bin 0x8000 file4.bin | tee t.txt"
more +7 t.txt > t2.txt
powershell -command "& {get-content t2.txt|select-object -first 1}" >>t3.txt
type t3.txt
set /a x=x+1
@ECHO To end press CTRL+C else
PAUSE
goto start
PAUSE
