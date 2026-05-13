add_executable(recal_cob
   ${CMAKE_CURRENT_SOURCE_DIR}/src/recal/recal_cob.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/recal/readDBinfo.c
)

add_executable(recal_corr
   ${CMAKE_CURRENT_SOURCE_DIR}/src/recal/recal_corr.F
)

add_executable(recal_diff
   ${CMAKE_CURRENT_SOURCE_DIR}/src/recal/recal_diff.F
)

add_executable(recal_doppl
   ${CMAKE_CURRENT_SOURCE_DIR}/src/recal/recal_doppl.F
)

set(recal_dopplDATA_FILES
   ${CMAKE_CURRENT_SOURCE_DIR}/etc/NUMBERING.GE
   ${CMAKE_CURRENT_SOURCE_DIR}/etc/EBNUMBERING.GE
)

set_target_properties(recal_doppl PROPERTIES
   RESOURCE "${recal_dopplDATA_FILES}"
)

add_executable(recal_gain
   ${CMAKE_CURRENT_SOURCE_DIR}/src/recal/recal_gain.F
)

add_executable(recal_test
   ${CMAKE_CURRENT_SOURCE_DIR}/src/recal/recal_test.F
)

add_executable(recal_time
   ${CMAKE_CURRENT_SOURCE_DIR}/src/recal/recal_time.F
)

install(TARGETS recal_cob recal_corr recal_diff recal_doppl recal_gain recal_test recal_time
   RUNTIME
   LIBRARY
   RESOURCE DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}
)
