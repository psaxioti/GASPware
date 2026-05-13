add_executable(list_tape
   ${CMAKE_CURRENT_SOURCE_DIR}/src/tape/list_tape.F
)

add_executable(tapetotape
   ${CMAKE_CURRENT_SOURCE_DIR}/src/tape/tapetotape.F
)

install(TARGETS list_tape tapetotape
   RUNTIME
   LIBRARY
   RESOURCE DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}
)
