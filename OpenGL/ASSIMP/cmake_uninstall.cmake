IF(NOT EXISTS "D:/OpenGL/assimp-5.0.1/install_manifest.txt")
  MESSAGE(FATAL_ERROR "Cannot find install manifest: \"D:/OpenGL/assimp-5.0.1/install_manifest.txt\"")
ENDIF(NOT EXISTS "D:/OpenGL/assimp-5.0.1/install_manifest.txt")

FILE(READ "D:/OpenGL/assimp-5.0.1/install_manifest.txt" files)
STRING(REGEX REPLACE "\n" ";" files "${files}")
FOREACH(file ${files})
  MESSAGE(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
  EXEC_PROGRAM(
    "D:/CMake/bin/cmake.exe" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
    OUTPUT_VARIABLE rm_out
    RETURN_VALUE rm_retval
    )
  IF(NOT "${rm_retval}" STREQUAL 0)
    MESSAGE(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
  ENDIF(NOT "${rm_retval}" STREQUAL 0)
ENDFOREACH(file)
