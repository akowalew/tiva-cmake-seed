set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(MCU TM4C123GH6PM)
set(LD_SCRIPT "${MCU}.ld")

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)

set(CMAKE_C_FLAGS "\
	-march=armv7e-m \
	-mcpu=cortex-m4 \
	-mtune=cortex-m4 \
	-mfpu=fpv4-sp-d16 \
	-mthumb \
	-mfloat-abi=hard \
	-ffunction-sections \
	-fdata-sections \
	-DTARGET_IS_TM4C123_RA3"
	CACHE STRING "" FORCE)

set(CMAKE_CXX_FLAGS "\
	-march=armv7e-m \
	-mcpu=cortex-m4 \
	-mtune=cortex-m4 \
	-mfpu=fpv4-sp-d16 \
	-mthumb \
	-mfloat-abi=hard \
	-ffunction-sections \
	-fdata-sections \
	-DTARGET_IS_TM4C123_RA3"
	CACHE STRING "" FORCE)

set(CMAKE_EXE_LINKER_FLAGS "\
	-Wl,--gc-sections \
	-Wl,-T ${CMAKE_SOURCE_DIR}/cmake/${LD_SCRIPT}"
	CACHE STRING "" FORCE)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
