add_executable(xtrackn
   ${CMAKE_CURRENT_SOURCE_DIR}/src/xtrack/trackn.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/xtrack/trackn.inc
   ${CMAKE_CURRENT_SOURCE_DIR}/src/xtrack/glwlib.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/xtrack/effcor.F src/xtrack/effcor.inc
)

#set_target_properties(xtrackn PROPERTIES
#   RESOURCE
#)

install(TARGETS xtrackn
   RUNTIME
   LIBRARY
   RESOURCE DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}
)
