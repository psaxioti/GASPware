cmake_minimum_required(VERSION 3.23)

project(GASPware
   VERSION 2023.05.03
   LANGUAGES C Fortran
)

option(STATIC "Build static targets" OFF)
if(STATIC)
   set(LINKING_TYPE STATIC)
else()
   set(LINKING_TYPE SHARED)
endif(STATIC)

option(DISABLE_WARNINGS "Disable build warnings" OFF)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(GNUInstallDirs) 

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(X11 REQUIRED)
find_package(OpenGL REQUIRED)
find_package(Threads REQUIRED)

#set(Ygl_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src/Ygl-4.2.8/src)
set(Ygl_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src/Ygl-4.0)

include_directories(
   ${CMAKE_CURRENT_BINARY_DIR}
   ${Ygl_DIR}
   ${CMAKE_CURRENT_SOURCE_DIR}/src/Ygl-4.0
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr
)

link_libraries(
   ${X11_LIBRARIES}
   ${OPENGL_LIBRARIES}
   ${CMAKE_THREAD_LIBS_INIT}
   ${CMAKE_PTHREAD_LIBS_INIT}
)

add_compile_options(
   -O2
   -DUSE_AIO
   -Wall
   "$<$<COMPILE_LANGUAGE:Fortran>:-std=legacy;-fdec;-ffixed-line-length-132;-fd-lines-as-comments;-fno-range-check>"
   "$<$<AND:$<COMPILE_LANGUAGE:Fortran>,$<BOOL:${DISABLE_WARNINGS}>>:-Wno-argument-mismatch>"
   "$<$<AND:$<COMPILE_LANGUAGE:C>,$<BOOL:${DISABLE_WARNINGS}>>:-Wno-unused-result;-Wno-pointer-to-int-cast;-Wno-deprecated-declarations;-Wno-aggressive-loop-optimizations>"

   "$<$<BOOL:${DISABLE_WARNINGS}>:-Wno-maybe-uninitialized;-Wno-unused-variable>"
   "$<$<AND:$<COMPILE_LANGUAGE:Fortran>,$<BOOL:${DISABLE_WARNINGS}>>:-Wno-uninitialized;-Wno-unused-dummy-argument;-Wno-conversion;-Wno-unused-label;-Wno-tabs;-Wno-integer-division;-Wno-character-truncation>"
   "$<$<AND:$<COMPILE_LANGUAGE:C>,$<BOOL:${DISABLE_WARNINGS}>>:-Wno-format-contains-nul;-Wno-unused-but-set-variable;-Wno-parentheses;-Wno-comment;-Wno-misleading-indentation;-Wno-unused-value;-Wno-main;-Wno-format>"

   "$<$<AND:$<COMPILE_LANGUAGE:Fortran>,$<VERSION_GREATER:$<Fortran_COMPILER_VERSION>,8>>:-fallow-invalid-boz>"
   "$<$<AND:$<COMPILE_LANGUAGE:Fortran>,$<BOOL:${DISABLE_WARNINGS}>,$<VERSION_GREATER:$<Fortran_COMPILER_VERSION>,8>>:-Wno-surprising>"

)

include(Ygl)

include(inter)

link_libraries(
   Ygl
   inter
)

include(cmat)

include(gsort)

include(recal)

include(sadd)

include(stopp)

include(tape)

include(xtrackn)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake/Templates/GASPware-env.sh.in
   ${CMAKE_CURRENT_BINARY_DIR}/GASPware-env.sh
   @ONLY
)

install(FILES
      ${CMAKE_CURRENT_SOURCE_DIR}/etc/XTerm
      ${CMAKE_CURRENT_SOURCE_DIR}/etc/CLARAEXC.GE
      ${CMAKE_CURRENT_SOURCE_DIR}/etc/ClaraRing2Ring.pairs
      ${CMAKE_CURRENT_SOURCE_DIR}/etc/ClaraRings
      ${CMAKE_CURRENT_SOURCE_DIR}/etc/ClaraRings.cal
      ${CMAKE_CURRENT_SOURCE_DIR}/etc/EBzero.cal
      ${CMAKE_CURRENT_SOURCE_DIR}/etc/GASPzero.cal
      ${CMAKE_CURRENT_SOURCE_DIR}/etc/NUMBERING.BGO
      ${CMAKE_CURRENT_SOURCE_DIR}/etc/NWall.pairlist
      ${CMAKE_CURRENT_SOURCE_DIR}/etc/GSORT.pat
      ${CMAKE_CURRENT_BINARY_DIR}/GASPware-env.sh
   DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}
)
