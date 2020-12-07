ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      written by the UFO converter
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

      REAL*16 G
      COMMON/MP_STRONG/ G

      COMPLEX*32 GAL(2)
      COMMON/MP_WEAK/ GAL

      COMPLEX*32 MU_R
      COMMON/MP_RSCALE/ MU_R


      REAL*16 MDL_MT,MDL_MW,MDL_MZ,MDL_MH,MDL_MN1,MDL_MN2,MDL_MN3

      COMMON/MP_MASSES/ MDL_MT,MDL_MW,MDL_MZ,MDL_MH,MDL_MN1,MDL_MN2
     $ ,MDL_MN3


      REAL*16 MDL_WN2,MDL_WN3,MDL_WN1,MDL_WZ,MDL_WT,MDL_WW,MDL_WH

      COMMON/MP_WIDTHS/ MDL_WN2,MDL_WN3,MDL_WN1,MDL_WZ,MDL_WT,MDL_WW
     $ ,MDL_WH


      COMPLEX*32 R2GC_185_38,UVGC_185_27_1EPS,UVGC_185_28_1EPS,GC_11
     $ ,GC_24,GC_79

      COMMON/MP_COUPLINGS/ R2GC_185_38,UVGC_185_27_1EPS
     $ ,UVGC_185_28_1EPS,GC_11,GC_24,GC_79


