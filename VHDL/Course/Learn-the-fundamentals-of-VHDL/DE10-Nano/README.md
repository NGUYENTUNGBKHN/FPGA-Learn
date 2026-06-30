
niosv-bsp -c -s=UART_IO_SYS.sopcinfo -t=hal software/bsp/settings.bsp

niosv-app --bsp-dir=software/bsp --app-dir=software/app --srcs=software/app/main.c

juart-terminal

