set(IOMODULE_NUM_DRIVER_INSTANCES "microblaze_mcs_0_iomodule_0")
set(IOMODULE0_PROP_LIST "0x80000000")
list(APPEND TOTAL_IOMODULE_PROP_LIST IOMODULE0_PROP_LIST)
set(UARTLITE_NUM_DRIVER_INSTANCES "")
set(UARTNS550_NUM_DRIVER_INSTANCES "")
set(UARTPS_NUM_DRIVER_INSTANCES "")
set(UARTPSV_NUM_DRIVER_INSTANCES "")
set(microblaze_mcs_0_dlmb_cntlr_memory_0 "0x50;0x3fb0")
set(DDR microblaze_mcs_0_dlmb_cntlr_memory_0)
set(CODE microblaze_mcs_0_dlmb_cntlr_memory_0)
set(DATA microblaze_mcs_0_dlmb_cntlr_memory_0)
set(TOTAL_MEM_CONTROLLERS "microblaze_mcs_0_dlmb_cntlr_memory_0")
set(MEMORY_SECTION "MEMORY
{
	microblaze_mcs_0_dlmb_cntlr_memory_0 : ORIGIN = 0x50, LENGTH = 0x3fb0
}")
set(STACK_SIZE 0x400)
set(HEAP_SIZE 0x800)
