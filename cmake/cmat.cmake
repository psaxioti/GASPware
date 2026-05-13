add_executable(cmat
   ${CMAKE_CURRENT_SOURCE_DIR}/src/cmat/cmat.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/cmat/glwContour.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/cmat/Autoban.c
)

install(TARGETS cmat
   RUNTIME
   LIBRARY
   RESOURCE DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}
)
