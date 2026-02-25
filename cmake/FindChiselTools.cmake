# FindChiselTools.cmake — Locate JDK 17, Mill, and firtool for Chisel elaboration
#
# Sets:
#   CHISEL_TOOLS_FOUND  — TRUE if all tools found
#   JAVA_HOME           — Path to JDK 17
#   MILL_BIN            — Path to mill binary
#   FIRTOOL_BIN         — Path to firtool binary

# --- JDK 17 ---
if(DEFINED ENV{JAVA_HOME} AND EXISTS "$ENV{JAVA_HOME}/bin/java")
  set(JAVA_HOME "$ENV{JAVA_HOME}")
elseif(EXISTS "$ENV{HOME}/workspace/jdk-17.0.2/bin/java")
  set(JAVA_HOME "$ENV{HOME}/workspace/jdk-17.0.2")
else()
  # Try system java and check version
  find_program(_java_bin java)
  if(_java_bin)
    execute_process(
      COMMAND ${_java_bin} -version
      ERROR_VARIABLE _java_ver OUTPUT_QUIET
      ERROR_STRIP_TRAILING_WHITESPACE)
    if(_java_ver MATCHES "\"17\\.")
      get_filename_component(_java_dir ${_java_bin} DIRECTORY)
      get_filename_component(JAVA_HOME "${_java_dir}/.." REALPATH)
    endif()
  endif()
  unset(_java_bin CACHE)
endif()

if(JAVA_HOME AND EXISTS "${JAVA_HOME}/bin/java")
  message(STATUS "Found JDK 17: ${JAVA_HOME}")
else()
  message(WARNING "JDK 17 not found — Chisel targets disabled")
endif()

# --- Mill ---
find_program(MILL_BIN mill
  HINTS "$ENV{HOME}/workspace/bin" "$ENV{HOME}/.local/bin")

if(MILL_BIN)
  message(STATUS "Found Mill: ${MILL_BIN}")
else()
  message(WARNING "Mill not found — Chisel targets disabled")
endif()

# --- firtool ---
find_program(FIRTOOL_BIN firtool
  HINTS "$ENV{HOME}/workspace/bin"
        "$ENV{HOME}/workspace/firtool-1.136.0/bin")

if(FIRTOOL_BIN)
  message(STATUS "Found firtool: ${FIRTOOL_BIN}")
else()
  message(WARNING "firtool not found — Chisel targets disabled")
endif()

# --- Result ---
if(JAVA_HOME AND MILL_BIN AND FIRTOOL_BIN)
  set(CHISEL_TOOLS_FOUND TRUE)
  message(STATUS "Chisel toolchain: ready")
else()
  set(CHISEL_TOOLS_FOUND FALSE)
  message(STATUS "Chisel toolchain: incomplete (targets will be skipped)")
endif()
