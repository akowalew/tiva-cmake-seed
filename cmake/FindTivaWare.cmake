# FindTivaWare.cmake
# - Try to find TivaWare
# Once done this will define
# 	TIVAWARE_FOUND - System has TivaWare
# 	TIVAWARE_INCLUDE_DIRS - The TivaWare include directories
# Author: akowalew

include(FindPackageHandleStandardArgs)

find_path(_TIVAWARE_INCLUDE_DIR inc 
	PATH_SUFFIXES tivaware)

if("driverlib" IN_LIST TivaWare_FIND_COMPONENTS)
	find_path(_TIVAWARE_DRIVERLIB_INCLUDE_DIR driverlib 
		PATH_SUFFIXES tivaware)
	find_library(_TIVAWARE_DRIVERLIB_LIBRARY driver 
		PATH_SUFFIXES tivaware)

	find_package_handle_standard_args(TivaWare
		DEFAULT_MSG
		_TIVAWARE_INCLUDE_DIR
		_TIVAWARE_DRIVERLIB_INCLUDE_DIR
		_TIVAWARE_DRIVERLIB_LIBRARY
	)

	set(TivaWare_INCLUDE_DIRS 
		${_TIVAWARE_INCLUDE_DIR}
	)

	set(TivaWare_LIBRARIES 
		${_TIVAWARE_DRIVERLIB_LIBRARY}
	)

	mark_as_advanced(
		_TIVAWARE_INCLUDE_DIR
		_TIVAWARE_DRIVERLIB_INCLUDE_DIR 
		_TIVAWARE_DRIVERLIB_LIBRARY
	)

else()
	find_package_handle_standard_args(TivaWare
		DEFAULT_MSG
		_TIVAWARE_INCLUDE_DIR
	)

	set(TivaWare_INCLUDE_DIRS 
		${_TIVAWARE_INCLUDE_DIR}
	)

	mark_as_advanced(
		_TIVAWARE_INCLUDE_DIR
	)

endif()
