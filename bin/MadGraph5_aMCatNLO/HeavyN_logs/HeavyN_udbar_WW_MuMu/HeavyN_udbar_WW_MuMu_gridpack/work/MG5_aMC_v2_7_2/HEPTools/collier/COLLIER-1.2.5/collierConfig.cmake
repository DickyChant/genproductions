# File: collierConfig.cmake.in
# Author: Jean-Nicolas Lang
# Description: Config file for creating the collier library package
# Last Modified: March 02, 2018

# It defines the following variables
#  COLLIER_LIBRARY_DIR - include directories for project library
#  COLLIER_INCLUDE_DIR - include directories for project headers
#  COLLIER_LIBRARY_PATH - path to the collier library file

set(COLLIER_LIBRARY_DIR "/afs/cern.ch/work/s/sqian/genproductions/bin/MadGraph5_aMCatNLO/HeavyN_udbar_WW_MuMu/HeavyN_udbar_WW_MuMu_gridpack/work/MG5_aMC_v2_7_2/HEPTools/collier/COLLIER-1.2.5")
set(COLLIER_INCLUDE_DIR "/afs/cern.ch/work/s/sqian/genproductions/bin/MadGraph5_aMCatNLO/HeavyN_udbar_WW_MuMu/HeavyN_udbar_WW_MuMu_gridpack/work/MG5_aMC_v2_7_2/HEPTools/collier/COLLIER-1.2.5/modules")
add_library(collier SHARED IMPORTED)
find_library(COLLIER_LIBRARY_PATH collier HINTS "${COLLIER_LIBRARY_DIR}" NO_DEFAULT_PATH)
set_target_properties(collier PROPERTIES IMPORTED_LOCATION "${COLLIER_LIBRARY_PATH}")
include_directories(${COLLIER_INCLUDE_DIR})
