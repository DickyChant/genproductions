ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      written by the UFO converter
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

      SUBROUTINE COUP2()

      IMPLICIT NONE
      INCLUDE 'model_functions.inc'

      DOUBLE PRECISION PI, ZERO
      PARAMETER  (PI=3.141592653589793D0)
      PARAMETER  (ZERO=0D0)
      INCLUDE 'input.inc'
      INCLUDE 'coupl.inc'
      R2GC_185_38 = -(MDL_EE*MDL_COMPLEXI*MDL_G__EXP__2)/(6.000000D+00
     $ *PI**2*MDL_SW*MDL_SQRT__2)
      UVGC_185_27_1EPS = (MDL_EE*MDL_COMPLEXI*MDL_G__EXP__2)
     $ /(2.400000D+01*PI**2*MDL_SW*MDL_SQRT__2)
      UVGC_185_28_1EPS = -(MDL_EE*MDL_COMPLEXI*MDL_G__EXP__2)
     $ /(1.200000D+01*PI**2*MDL_SW*MDL_SQRT__2)
      GC_11 = MDL_COMPLEXI*G
      END
