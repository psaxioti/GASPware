add_executable(gsort
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsort.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsortcom0.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsortcom1.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsortcom2.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsortioev-new.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsortmisc.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gs_ebevent.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gs_gsphevent.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gs_yalevent.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/tndlib.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gs_GSRevent.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsort-utils.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gs_ganilevent.c

   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsortuser1.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsortuser2.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsortuser3.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsortuser4.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsortuser5.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsortuser6.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsortuser7.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsortuser8.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsortuser9.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/gsortuser-c.c
)

set(gsortDATA_FILES
   ${CMAKE_CURRENT_SOURCE_DIR}/etc/CLARANUMBERING.GE
   ${CMAKE_CURRENT_SOURCE_DIR}/etc/CLARANUMBERING.GE.original
   ${CMAKE_CURRENT_SOURCE_DIR}/etc/EBIVNUMBERING.GE
   ${CMAKE_CURRENT_SOURCE_DIR}/etc/EBNUMBERING.GE
   ${CMAKE_CURRENT_SOURCE_DIR}/etc/EBNUMBERING.SI
   ${CMAKE_CURRENT_SOURCE_DIR}/etc/NUMBERING.EUCLIDES
   ${CMAKE_CURRENT_SOURCE_DIR}/etc/NUMBERING.GE
   ${CMAKE_CURRENT_SOURCE_DIR}/etc/NUMBERING.SI
)

set_target_properties(gsort PROPERTIES
   RESOURCE "${gsortDATA_FILES}"
)

add_executable(mat_stop
   ${CMAKE_CURRENT_SOURCE_DIR}/src/gsort/mat_stop.F
)

install(TARGETS gsort mat_stop
   RUNTIME
   LIBRARY
   RESOURCE DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}
)
