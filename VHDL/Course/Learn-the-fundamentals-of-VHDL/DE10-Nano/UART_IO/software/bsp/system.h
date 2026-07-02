/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'intel_niosv_g' in SOPC Builder design 'UART_IO_SYS'
 * SOPC Builder design path: ../../UART_IO_SYS.sopcinfo
 *
 * Generated: Wed Jul 01 21:56:39 JST 2026
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "intel_niosv_g"
#define ALT_CPU_CLIC_EN 0
#define ALT_CPU_CPU_FREQ 100000000u
#define ALT_CPU_DATA_ADDR_WIDTH 0x20
#define ALT_CPU_DCACHE_LINE_SIZE 32
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_DCACHE_SIZE 4096
#define ALT_CPU_FREQ 100000000
#define ALT_CPU_HAS_CSR_SUPPORT 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 4096
#define ALT_CPU_INST_ADDR_WIDTH 0x20
#define ALT_CPU_INT_MODE 0
#define ALT_CPU_MTIME_OFFSET 0x00050000
#define ALT_CPU_NAME "intel_niosv_g"
#define ALT_CPU_NIOSV_CORE_VARIANT 3
#define ALT_CPU_NUM_GPR 32
#define ALT_CPU_NUM_SRF_BANKS 1
#define ALT_CPU_RESET_ADDR 0x00000000
#define ALT_CPU_TICKS_PER_SEC NIOSV_INTERNAL_TIMER_TICKS_PER_SECOND
#define ALT_CPU_TIMER_DEVICE_TYPE 2


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define BANTAMLAKE_CLIC_EN 0
#define BANTAMLAKE_CPU_FREQ 100000000u
#define BANTAMLAKE_DATA_ADDR_WIDTH 0x20
#define BANTAMLAKE_DCACHE_LINE_SIZE 32
#define BANTAMLAKE_DCACHE_LINE_SIZE_LOG2 5
#define BANTAMLAKE_DCACHE_SIZE 4096
#define BANTAMLAKE_HAS_CSR_SUPPORT 1
#define BANTAMLAKE_HAS_DEBUG_STUB
#define BANTAMLAKE_ICACHE_LINE_SIZE 32
#define BANTAMLAKE_ICACHE_LINE_SIZE_LOG2 5
#define BANTAMLAKE_ICACHE_SIZE 4096
#define BANTAMLAKE_INST_ADDR_WIDTH 0x20
#define BANTAMLAKE_INT_MODE 0
#define BANTAMLAKE_MTIME_OFFSET 0x00050000
#define BANTAMLAKE_NIOSV_CORE_VARIANT 3
#define BANTAMLAKE_NUM_GPR 32
#define BANTAMLAKE_NUM_SRF_BANKS 1
#define BANTAMLAKE_RESET_ADDR 0x00000000
#define BANTAMLAKE_TICKS_PER_SEC NIOSV_INTERNAL_TIMER_TICKS_PER_SECOND
#define BANTAMLAKE_TIMER_DEVICE_TYPE 2


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __INTEL_NIOSV_G


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone V"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x50070
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x50070
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x50070
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "UART_IO_SYS"
#define ALT_SYS_CLK_TICKS_PER_SEC ALT_CPU_TICKS_PER_SEC
#define ALT_TIMESTAMP_CLK_TIMER_DEVICE_TYPE ALT_CPU_TIMER_DEVICE_TYPE


/*
 * hal2 configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK INTEL_NIOSV_G
#define ALT_TIMESTAMP_CLK INTEL_NIOSV_G
#define INTEL_FPGA_DFL_START_ADDRESS 0xffffffffffffffff
#define INTEL_FPGA_USE_DFL_WALKER 0


/*
 * intel_niosv_g_dm_agent configuration
 *
 */

#define ALT_MODULE_CLASS_intel_niosv_g_dm_agent intel_niosv_g
#define INTEL_NIOSV_G_DM_AGENT_BASE 0x40000
#define INTEL_NIOSV_G_DM_AGENT_CLIC_EN 0
#define INTEL_NIOSV_G_DM_AGENT_CPU_FREQ 100000000u
#define INTEL_NIOSV_G_DM_AGENT_DATA_ADDR_WIDTH 0x20
#define INTEL_NIOSV_G_DM_AGENT_DCACHE_LINE_SIZE 32
#define INTEL_NIOSV_G_DM_AGENT_DCACHE_LINE_SIZE_LOG2 5
#define INTEL_NIOSV_G_DM_AGENT_DCACHE_SIZE 4096
#define INTEL_NIOSV_G_DM_AGENT_HAS_CSR_SUPPORT 1
#define INTEL_NIOSV_G_DM_AGENT_HAS_DEBUG_STUB
#define INTEL_NIOSV_G_DM_AGENT_ICACHE_LINE_SIZE 32
#define INTEL_NIOSV_G_DM_AGENT_ICACHE_LINE_SIZE_LOG2 5
#define INTEL_NIOSV_G_DM_AGENT_ICACHE_SIZE 4096
#define INTEL_NIOSV_G_DM_AGENT_INST_ADDR_WIDTH 0x20
#define INTEL_NIOSV_G_DM_AGENT_INTERRUPT_CONTROLLER_ID 0
#define INTEL_NIOSV_G_DM_AGENT_INT_MODE 0
#define INTEL_NIOSV_G_DM_AGENT_IRQ -1
#define INTEL_NIOSV_G_DM_AGENT_IRQ_INTERRUPT_CONTROLLER_ID -1
#define INTEL_NIOSV_G_DM_AGENT_MTIME_OFFSET 0x00050000
#define INTEL_NIOSV_G_DM_AGENT_NAME "/dev/intel_niosv_g_dm_agent"
#define INTEL_NIOSV_G_DM_AGENT_NIOSV_CORE_VARIANT 3
#define INTEL_NIOSV_G_DM_AGENT_NUM_GPR 32
#define INTEL_NIOSV_G_DM_AGENT_NUM_SRF_BANKS 1
#define INTEL_NIOSV_G_DM_AGENT_RESET_ADDR 0x00000000
#define INTEL_NIOSV_G_DM_AGENT_SPAN 65536
#define INTEL_NIOSV_G_DM_AGENT_TICKS_PER_SEC NIOSV_INTERNAL_TIMER_TICKS_PER_SECOND
#define INTEL_NIOSV_G_DM_AGENT_TIMER_DEVICE_TYPE 2
#define INTEL_NIOSV_G_DM_AGENT_TYPE "intel_niosv_g"


/*
 * intel_niosv_g_hal_driver configuration
 *
 */

#define NIOSV_INTERNAL_TIMER_TICKS_PER_SECOND 1000


/*
 * intel_niosv_g_timer_sw_agent configuration
 *
 */

#define ALT_MODULE_CLASS_intel_niosv_g_timer_sw_agent intel_niosv_g
#define INTEL_NIOSV_G_TIMER_SW_AGENT_BASE 0x50000
#define INTEL_NIOSV_G_TIMER_SW_AGENT_CLIC_EN 0
#define INTEL_NIOSV_G_TIMER_SW_AGENT_CPU_FREQ 100000000u
#define INTEL_NIOSV_G_TIMER_SW_AGENT_DATA_ADDR_WIDTH 0x20
#define INTEL_NIOSV_G_TIMER_SW_AGENT_DCACHE_LINE_SIZE 32
#define INTEL_NIOSV_G_TIMER_SW_AGENT_DCACHE_LINE_SIZE_LOG2 5
#define INTEL_NIOSV_G_TIMER_SW_AGENT_DCACHE_SIZE 4096
#define INTEL_NIOSV_G_TIMER_SW_AGENT_HAS_CSR_SUPPORT 1
#define INTEL_NIOSV_G_TIMER_SW_AGENT_HAS_DEBUG_STUB
#define INTEL_NIOSV_G_TIMER_SW_AGENT_ICACHE_LINE_SIZE 32
#define INTEL_NIOSV_G_TIMER_SW_AGENT_ICACHE_LINE_SIZE_LOG2 5
#define INTEL_NIOSV_G_TIMER_SW_AGENT_ICACHE_SIZE 4096
#define INTEL_NIOSV_G_TIMER_SW_AGENT_INST_ADDR_WIDTH 0x20
#define INTEL_NIOSV_G_TIMER_SW_AGENT_INTERRUPT_CONTROLLER_ID 0
#define INTEL_NIOSV_G_TIMER_SW_AGENT_INT_MODE 0
#define INTEL_NIOSV_G_TIMER_SW_AGENT_IRQ -1
#define INTEL_NIOSV_G_TIMER_SW_AGENT_IRQ_INTERRUPT_CONTROLLER_ID -1
#define INTEL_NIOSV_G_TIMER_SW_AGENT_MTIME_OFFSET 0x00050000
#define INTEL_NIOSV_G_TIMER_SW_AGENT_NAME "/dev/intel_niosv_g_timer_sw_agent"
#define INTEL_NIOSV_G_TIMER_SW_AGENT_NIOSV_CORE_VARIANT 3
#define INTEL_NIOSV_G_TIMER_SW_AGENT_NUM_GPR 32
#define INTEL_NIOSV_G_TIMER_SW_AGENT_NUM_SRF_BANKS 1
#define INTEL_NIOSV_G_TIMER_SW_AGENT_RESET_ADDR 0x00000000
#define INTEL_NIOSV_G_TIMER_SW_AGENT_SPAN 64
#define INTEL_NIOSV_G_TIMER_SW_AGENT_TICKS_PER_SEC NIOSV_INTERNAL_TIMER_TICKS_PER_SECOND
#define INTEL_NIOSV_G_TIMER_SW_AGENT_TIMER_DEVICE_TYPE 2
#define INTEL_NIOSV_G_TIMER_SW_AGENT_TYPE "intel_niosv_g"


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x50070
#define JTAG_UART_IRQ 0
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * onchip_memory2 configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_memory2 altera_avalon_onchip_memory2
#define ONCHIP_MEMORY2_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY2_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY2_BASE 0x0
#define ONCHIP_MEMORY2_CONTENTS_INFO ""
#define ONCHIP_MEMORY2_DUAL_PORT 0
#define ONCHIP_MEMORY2_GUI_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_INIT_CONTENTS_FILE "UART_IO_SYS_onchip_memory2"
#define ONCHIP_MEMORY2_INIT_MEM_CONTENT 1
#define ONCHIP_MEMORY2_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY2_IRQ -1
#define ONCHIP_MEMORY2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEMORY2_NAME "/dev/onchip_memory2"
#define ONCHIP_MEMORY2_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY2_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY2_SINGLE_CLOCK_OP 0
#define ONCHIP_MEMORY2_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY2_SIZE_VALUE 160000
#define ONCHIP_MEMORY2_SPAN 160000
#define ONCHIP_MEMORY2_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY2_WRITABLE 1


/*
 * pio_btn configuration
 *
 */

#define ALT_MODULE_CLASS_pio_btn altera_avalon_pio
#define PIO_BTN_BASE 0x50040
#define PIO_BTN_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_BTN_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_BTN_CAPTURE 0
#define PIO_BTN_DATA_WIDTH 2
#define PIO_BTN_DO_TEST_BENCH_WIRING 0
#define PIO_BTN_DRIVEN_SIM_VALUE 0
#define PIO_BTN_EDGE_TYPE "NONE"
#define PIO_BTN_FREQ 100000000
#define PIO_BTN_HAS_IN 1
#define PIO_BTN_HAS_OUT 0
#define PIO_BTN_HAS_TRI 0
#define PIO_BTN_IRQ -1
#define PIO_BTN_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_BTN_IRQ_TYPE "NONE"
#define PIO_BTN_NAME "/dev/pio_btn"
#define PIO_BTN_RESET_VALUE 0
#define PIO_BTN_SPAN 16
#define PIO_BTN_TYPE "altera_avalon_pio"


/*
 * pio_led configuration
 *
 */

#define ALT_MODULE_CLASS_pio_led altera_avalon_pio
#define PIO_LED_BASE 0x50060
#define PIO_LED_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_LED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_LED_CAPTURE 0
#define PIO_LED_DATA_WIDTH 8
#define PIO_LED_DO_TEST_BENCH_WIRING 0
#define PIO_LED_DRIVEN_SIM_VALUE 0
#define PIO_LED_EDGE_TYPE "NONE"
#define PIO_LED_FREQ 100000000
#define PIO_LED_HAS_IN 0
#define PIO_LED_HAS_OUT 1
#define PIO_LED_HAS_TRI 0
#define PIO_LED_IRQ -1
#define PIO_LED_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_LED_IRQ_TYPE "NONE"
#define PIO_LED_NAME "/dev/pio_led"
#define PIO_LED_RESET_VALUE 0
#define PIO_LED_SPAN 16
#define PIO_LED_TYPE "altera_avalon_pio"


/*
 * pio_switch configuration
 *
 */

#define ALT_MODULE_CLASS_pio_switch altera_avalon_pio
#define PIO_SWITCH_BASE 0x50050
#define PIO_SWITCH_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_SWITCH_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_SWITCH_CAPTURE 0
#define PIO_SWITCH_DATA_WIDTH 3
#define PIO_SWITCH_DO_TEST_BENCH_WIRING 0
#define PIO_SWITCH_DRIVEN_SIM_VALUE 0
#define PIO_SWITCH_EDGE_TYPE "NONE"
#define PIO_SWITCH_FREQ 100000000
#define PIO_SWITCH_HAS_IN 1
#define PIO_SWITCH_HAS_OUT 0
#define PIO_SWITCH_HAS_TRI 0
#define PIO_SWITCH_IRQ -1
#define PIO_SWITCH_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_SWITCH_IRQ_TYPE "NONE"
#define PIO_SWITCH_NAME "/dev/pio_switch"
#define PIO_SWITCH_RESET_VALUE 0
#define PIO_SWITCH_SPAN 16
#define PIO_SWITCH_TYPE "altera_avalon_pio"

#endif /* __SYSTEM_H_ */
