
# Find the Xenomai package
@[if DEVELSPACE]@
#list(APPEND CMAKE_MODULE_PATH ${xenomai_ros_PACKAGE_PATH})
find_package(Xenomai PATHS "@(CMAKE_CURRENT_SOURCE_DIR)/cmake" NO_DEFAULT_PATH)
@[else]@
find_package(Xenomai )
@[end if]@

set(Xenomai_FOUND ${XENOMAI_FOUND})

# Macro to add the native xenomai flags
macro(add_xenomai_flags)
  add_definitions(${Xenomai_DEFINITIONS})
  link_directories(${Xenomai_LIBRARY_DIRS})
  include_directories(${Xenomai_INCLUDE_DIR})

  # Add libraries
  set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${Xenomai_LDFLAGS_NATIVE}")
endmacro(add_xenomai_flags)

# Macto to add the xenomai flags with the posix wrappers
macro(add_xenomai_posix_flags)
  add_definitions(${Xenomai_DEFINITIONS_POSIX})
  link_directories(${Xenomai_LIBRARY_DIRS})
  include_directories(${Xenomai_INCLUDE_POSIX_DIR})

  # Add linker flags
  set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${Xenomai_LDFLAGS_POSIX}")
endmacro(add_xenomai_posix_flags)

# Macro to link against the xenomai libraries
#macro(target_link_xenomai ... )
#  if(Xenomai_FOUND)
#    foreach(lib_name IN ${ARGV})
#      if(lib_name STREQUAL "native")
#        target_link_libraries(${ARG1} ${Xenomai_LIBRARY_NATIVE})
#      elseif(lib_name STREQUAL "xenomai")
#        target_link_libraries(${ARG1} ${Xenomai_XENOMAI})
#      elseif(lib_name STREQUAL "rtdm")
#        target_link_libraries(${ARG1} ${Xenomai_RTDM})
#      elseif(lib_name STREQUAL "pthread_rt")
#        target_link_libraries(${ARG1} ${Xenomai_PTHREAD_RT})
#      endif()
#    endforeach(lib_name)
#  endif()
#endmacro(rosbuild_link_xenomai)
