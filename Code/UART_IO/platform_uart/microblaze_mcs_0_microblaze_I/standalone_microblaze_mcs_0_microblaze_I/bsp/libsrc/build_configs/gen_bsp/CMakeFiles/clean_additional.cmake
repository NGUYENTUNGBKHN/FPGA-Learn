# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "E:\\intelFPGA\\FPGA-Learn\\Code\\UART_IO\\platform_uart\\microblaze_mcs_0_microblaze_I\\standalone_microblaze_mcs_0_microblaze_I\\bsp\\include\\sleep.h"
  "E:\\intelFPGA\\FPGA-Learn\\Code\\UART_IO\\platform_uart\\microblaze_mcs_0_microblaze_I\\standalone_microblaze_mcs_0_microblaze_I\\bsp\\include\\xiltimer.h"
  "E:\\intelFPGA\\FPGA-Learn\\Code\\UART_IO\\platform_uart\\microblaze_mcs_0_microblaze_I\\standalone_microblaze_mcs_0_microblaze_I\\bsp\\include\\xtimer_config.h"
  "E:\\intelFPGA\\FPGA-Learn\\Code\\UART_IO\\platform_uart\\microblaze_mcs_0_microblaze_I\\standalone_microblaze_mcs_0_microblaze_I\\bsp\\lib\\libxiltimer.a"
  )
endif()
