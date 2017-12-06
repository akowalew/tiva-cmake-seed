target remote | openocd -f board/ek-tm4c123gxl.cfg -f interface/ti-icdi.cfg -c "gdb_port pipe; log_output openocd.log"

monitor reset halt

break faultISR

break nmISR

break defaultISR
