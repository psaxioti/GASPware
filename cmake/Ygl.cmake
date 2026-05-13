add_executable(makeYgltypes EXCLUDE_FROM_ALL
   ${Ygl_DIR}/makeYgltypes.c
)

add_custom_target(Ygltypes
   COMMAND mkdir -p X11
   COMMAND makeYgltypes > ${CMAKE_CURRENT_BINARY_DIR}/X11/Ygltypes.h
   BYPRODUCTS ${CMAKE_CURRENT_BINARY_DIR}/X11/Ygltypes.h
   DEPENDS makeYgltypes
   WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
   COMMENT "Generating Ygltypes.h"
)

add_library(Ygl ${LINKING_TYPE}
   ${Ygl_DIR}/ygl.c
   ${Ygl_DIR}/draw.c
   ${Ygl_DIR}/misc.c
   ${Ygl_DIR}/font.c
   ${Ygl_DIR}/queue.c
   ${Ygl_DIR}/color.c
   ${Ygl_DIR}/menu.c
   ${Ygl_DIR}/gl2ppm.c
   ${Ygl_DIR}/3d.c
   ${Ygl_DIR}/fortran.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/Ygl-4.0/glwidget.c
)

add_dependencies(Ygl
   Ygltypes
)

target_compile_definitions(Ygl PRIVATE
   X11
   OGL
   DOUBLEBUF
   MULTIBUF
)

target_sources(Ygl
      PUBLIC
         FILE_SET publicH
         TYPE HEADERS
         BASE_DIRS
            ${Ygl_DIR}
            ${CMAKE_CURRENT_SOURCE_DIR}/src/Ygl-4.0
            ${CMAKE_CURRENT_BINARY_DIR}
         FILES
            ${Ygl_DIR}/X11/Ygl.h
            ${Ygl_DIR}/X11/Yfgl.h
            ${CMAKE_CURRENT_BINARY_DIR}/X11/Ygltypes.h
      PRIVATE
         FILE_SET privateH
         TYPE HEADERS
         BASE_DIRS
            ${Ygl_DIR}
            ${CMAKE_CURRENT_SOURCE_DIR}/src/Ygl-4.0
         FILES
            ${CMAKE_CURRENT_SOURCE_DIR}/src/Ygl-4.0/glwidget.h
            ${Ygl_DIR}/header.h
            ${Ygl_DIR}/config.h
)

install(TARGETS Ygl
      LIBRARY
      FILE_SET publicH
      RUNTIME
)
