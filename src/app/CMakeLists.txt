# CMakeLists.txt
# Adds 'app' library target
# Author: akowalew

find_package(TivaWare REQUIRED COMPONENTS driverlib)

add_library(app
	app.c)

include_directories(${TivaWare_INCLUDE_DIRS})

target_link_libraries(app
	${TivaWare_LIBRARIES}
	dbg)