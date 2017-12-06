# CMakeLists.txt
# Specifies main binary and other microcontroller-specific targets
# Author: akowalew

add_subdirectory(app)
add_subdirectory(dbg)

add_executable(${CMAKE_PROJECT_NAME}
	main.c
	startup.c
)

target_link_libraries(${CMAKE_PROJECT_NAME}
	app
	dbg
)

add_custom_target(${CMAKE_PROJECT_NAME}.bin
    COMMAND arm-none-eabi-objcopy -O binary ${CMAKE_PROJECT_NAME} ${CMAKE_PROJECT_NAME}.bin
    DEPENDS ${CMAKE_PROJECT_NAME})

add_custom_target(flash
	COMMAND lm4flash ${CMAKE_PROJECT_NAME}.bin
	DEPENDS ${CMAKE_PROJECT_NAME}.bin)

if(CMAKE_BUILD_TYPE MATCHES DEBUG)
	add_custom_target(debug
		COMMAND arm-none-eabi-gdb ${CMAKE_PROJECT_NAME} 
			-x ${CMAKE_SOURCE_DIR}/tools/debug.gdb
		DEPENDS flash)
elseif(CMAKE_BUILD_TYPE MATCHES RELEASE)
	add_custom_target(release
		COMMAND arm-none-eabi-gdb ${CMAKE_PROJECT_NAME} 
			-x ${CMAKE_SOURCE_DIR}/tools/release.gdb
		DEPENDS flash)
else()
	message(FATAL_ERROR "Unknown CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}")
endif()
