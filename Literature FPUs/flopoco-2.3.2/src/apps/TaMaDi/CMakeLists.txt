PROJECT(TaMaDi C CXX)

MESSAGE("Trying to build TaMaDi on " ${CMAKE_SYSTEM_NAME} ", compiler is "${CMAKE_C_COMPILER})

# CMake's way of handling various versions
cmake_minimum_required(VERSION 2.4)
if(COMMAND cmake_policy)
  cmake_policy(SET CMP0003 NEW)
endif(COMMAND cmake_policy)


#####################For packaging (source file distrib so far)#######
# Use  make package_source to build a release
# Currently it doesn't work at all

SET(CPACK_SOURCE_GENERATOR "TGZ")
SET(CPACK_PACKAGE_VERSION_MAJOR "0")
SET(CPACK_PACKAGE_VERSION_MINOR "9")
SET(CPACK_PACKAGE_VERSION_PATCH "0")

INCLUDE(CPack)
# 
#Compilation flags
#SET(CMAKE_CXX_FLAGS_DEBUG "-Wall")
# Uncomment for profiling
#SET(CMAKE_CXX_FLAGS_DEBUG "-g -pg -Wall")
SET(CMAKE_CXX_FLAGS_DEBUG "-pg -Wall")
# Do you want an executable of 12MB ?
SET(CMAKE_BUILD_TYPE DEBUG)
#SET(CMAKE_BUILD_TYPE release)


FIND_PATH(MPFR_H
	  mpfr.h
	  HINTS "C:/Program Files/Microsoft Visual Studio 9.0/VC/include"
	  DOC "Path of mpfr.h, the include file for GNU MPFR library"
)

FIND_LIBRARY(MPFR_LIB
	NAMES mpfr mpfr.lib
	HINTS "C:/Program Files/Microsoft Visual Studio 9.0/VC/lib"
	DOC "Directory of the MPFR library")


# Detect Sollya's presence
FIND_LIBRARY( SOLLYA_LIB sollya )

IF (SOLLYA_LIB)
	ADD_DEFINITIONS(-DHAVE_SOLLYA)
	MESSAGE(STATUS "Found Sollya: ${SOLLYA_LIB}")
ELSE (SOLLYA_LIB)
	MESSAGE(STATUS "Sollya not found, many very nice operators won't be available")
ENDIF (SOLLYA_LIB)


IF (MPFR_H AND MPFR_LIB)
    SET(MPFR_FOUND TRUE)
ENDIF (MPFR_H AND MPFR_LIB)

IF (MPFR_FOUND)
    MESSAGE(STATUS "Found mpfr: ${MPFR_H} ${MPFR_LIB}")
ELSE (MPFR_FOUND)
    MESSAGE(FATAL_ERROR "Could not find MPFR.\nOn Debian-based systems type: 'sudo apt-get install libmpfr-dev'")
ENDIF (MPFR_FOUND)



FIND_PATH(FLOPOCO_H
	  NAMES FloPoCo.hpp
	  HINTS "../.." "/usr/local/include"
	  DOC "Path of FloPoCo.hpp"
)
IF (FLOPOCO_H)
    MESSAGE(STATUS "Found FloPoCo.hpp in: ${FLOPOCO_H}")
		include_directories("${FLOPOCO_H}") # This only works if we compile here...
ELSE (FLOPOCO_H)
    MESSAGE(FATAL_ERROR "Could not find FloPoCo.hpp")
ENDIF (FLOPOCO_H)




FIND_LIBRARY(FLOPOCO_LIB
	NAMES FloPoCo
	HINTS "../../../" "/usr/local/lib/"
	DOC "The FloPoCo library")


IF (FLOPOCO_LIB)
    MESSAGE(STATUS "Found FloPoCo library: ${FLOPOCO_LIB}")
ELSE (FLOPOCO_LIB)
    MESSAGE(FATAL_ERROR "Could not find libFloPoCo. Did you compile it before trying to compile this app?")
ENDIF (FLOPOCO_LIB)



ADD_EXECUTABLE(tamadi
 TaMaDiCore 
 TaMaDiPriorityEncoder 
 TaMaDiDecoder 
 TaMaDiFIFO 
 TaMaDiShiftRegister 
 TaMaDiModule 
 TaMaDiModuleDummyWrapper
 TaMaDiModuleWrapperInterface
 TaMaDiDispatcherInterface
 TaMaDiDeserializer
 TaMaDiSystem
	main
)

TARGET_LINK_LIBRARIES(
  tamadi 	${FLOPOCO_LIB} sollya mpfr gmp gmpxx  )

