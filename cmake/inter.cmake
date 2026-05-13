add_library(inter ${LINKING_TYPE}
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/inter_inp.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/inter_drws.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/inter_rm3d.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/inter_phys.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/inter_spec.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/inter_sys.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/inter_term.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/inter_var1.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/inter_var2.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/inter_vms.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/inter_c.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/inter_cmath.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/inter_isl.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/inter_inpx.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/lineget.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/inter_cspec.c

   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/displib.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/iadlib.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/laslib.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/banlib.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/tkt.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/tkt.inc #
   ${CMAKE_CURRENT_SOURCE_DIR}/src/tape/tapelib.F
   ${CMAKE_CURRENT_SOURCE_DIR}/src/tape/mt.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/tekmodes.c

   ${CMAKE_CURRENT_SOURCE_DIR}/src/cmat/ivflib.F #
   ${CMAKE_CURRENT_SOURCE_DIR}/src/cmat/complib.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/cmat/memclib.F #
   ${CMAKE_CURRENT_SOURCE_DIR}/src/cmat/mlmlib.c
   ${CMAKE_CURRENT_SOURCE_DIR}/src/cmat/cmtlib.F #
   ${CMAKE_CURRENT_SOURCE_DIR}/src/cmat/cmtinc.F #
   ${CMAKE_CURRENT_SOURCE_DIR}/src/cmat/cmtspe.F #

   ${CMAKE_CURRENT_SOURCE_DIR}/src/libr/autobgmin.c
)

set(interDATA_FILES
   ${CMAKE_CURRENT_SOURCE_DIR}/etc/AWMASS.DAT
)

set_target_properties(inter PROPERTIES
   RESOURCE "${interDATA_FILES}"
)

install(TARGETS inter
   RUNTIME
   LIBRARY
   RESOURCE DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}
)
