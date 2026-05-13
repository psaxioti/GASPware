add_executable(stopp
   ${CMAKE_CURRENT_SOURCE_DIR}/src/StopP/stopp.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/StopP/zieglerch.F
)

set(stoppDATA_FILES
   ${CMAKE_CURRENT_SOURCE_DIR}/etc/ziegdat.dat
   ${CMAKE_CURRENT_SOURCE_DIR}/etc/scoef.dat
)

set_target_properties(stopp PROPERTIES
   RESOURCE "${stoppDATA_FILES}"
)

install(TARGETS stopp
   RUNTIME
   LIBRARY
   RESOURCE DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}
)
