ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      written by the UFO converter
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

      SUBROUTINE MP_COUP2()

      IMPLICIT NONE
      INCLUDE 'model_functions.inc'
      REAL*16 MP__PI, MP__ZERO
      PARAMETER (MP__PI=3.1415926535897932384626433832795E0_16)
      PARAMETER (MP__ZERO=0E0_16)
      INCLUDE 'mp_input.inc'
      INCLUDE 'mp_coupl.inc'

      MP__R2GC_185_38 = -(MP__MDL_EE*MP__MDL_COMPLEXI
     $ *MP__MDL_G__EXP__2)/(6.000000E+00_16*MP__PI**2*MP__MDL_SW
     $ *MP__MDL_SQRT__2)
      MP__UVGC_185_27_1EPS = (MP__MDL_EE*MP__MDL_COMPLEXI
     $ *MP__MDL_G__EXP__2)/(2.400000E+01_16*MP__PI**2*MP__MDL_SW
     $ *MP__MDL_SQRT__2)
      MP__UVGC_185_28_1EPS = -(MP__MDL_EE*MP__MDL_COMPLEXI
     $ *MP__MDL_G__EXP__2)/(1.200000E+01_16*MP__PI**2*MP__MDL_SW
     $ *MP__MDL_SQRT__2)
      MP__GC_11 = MP__MDL_COMPLEXI*MP__G
      END
