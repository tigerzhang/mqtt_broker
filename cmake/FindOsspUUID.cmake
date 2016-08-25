SET(OsspUUID_EXTRA_PREFIXES /usr/local /opt/local "$ENV{HOME}")
FOREACH(prefix ${OsspUUID_EXTRA_PREFIXES})
    LIST(APPEND OsspUUID_INCLUDE_PATHS "${prefix}/include")
    LIST(APPEND OsspUUID_LIB_PATHS "${prefix}/lib")
ENDFOREACH()

FIND_PATH(OsspUUID_INCLUDE_DIR ossp/uuid.h PATHS ${OsspUUID_INCLUDE_PATHS})
FIND_LIBRARY(OsspUUID_LIB NAMES ossp-uuid PATHS ${OsspUUID_LIB_PATHS})

IF (OsspUUID_LIB AND OsspUUID_INCLUDE_DIR)
    SET(OsspUUID_FOUND TRUE)
    SET(OsspUUID_LIB ${OsspUUID_LIB})
ELSE ()
    SET(OsspUUID_FOUND FALSE)
ENDIF ()

IF (OsspUUID_FOUND)
    IF (NOT OsspUUID_FIND_QUIETLY)
        MESSAGE(STATUS "Found OsspUUID: ${OsspUUID_LIB}")
    ENDIF ()
ELSE ()
    IF (OsspUUID_FIND_REQUIRED)
        message(FATAL_ERROR "Could NOT find OsspUUID.")
    ENDIF ()
    MESSAGE(STATUS "OsspUUID NOT found.")
ENDIF ()

MARK_AS_ADVANCED(
        OsspUUID_LIB
        OsspUUID_INCLUDE_DIR
)