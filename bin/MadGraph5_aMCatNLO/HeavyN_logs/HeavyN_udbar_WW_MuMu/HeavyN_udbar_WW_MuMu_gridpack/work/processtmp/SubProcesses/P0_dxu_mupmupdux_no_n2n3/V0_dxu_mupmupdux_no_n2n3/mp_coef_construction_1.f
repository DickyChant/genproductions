      SUBROUTINE MP_COEF_CONSTRUCTION_1(P,NHEL,H,IC)
C     
      USE POLYNOMIAL_CONSTANTS
      IMPLICIT NONE
C     
C     CONSTANTS
C     
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=6)
      INTEGER    NCOMB
      PARAMETER (NCOMB=64)

      INTEGER NBORNAMPS
      PARAMETER (NBORNAMPS=2)
      INTEGER    NLOOPS, NLOOPGROUPS, NCTAMPS
      PARAMETER (NLOOPS=4, NLOOPGROUPS=2, NCTAMPS=16)
      INTEGER    NLOOPAMPS
      PARAMETER (NLOOPAMPS=20)
      INTEGER    NWAVEFUNCS,NLOOPWAVEFUNCS
      PARAMETER (NWAVEFUNCS=16,NLOOPWAVEFUNCS=8)
      REAL*16     ZERO
      PARAMETER (ZERO=0.0E0_16)
      COMPLEX*32     IZERO
      PARAMETER (IZERO=CMPLX(0.0E0_16,0.0E0_16,KIND=16))
C     These are constants related to the split orders
      INTEGER    NSO, NSQUAREDSO, NAMPSO
      PARAMETER (NSO=1, NSQUAREDSO=1, NAMPSO=2)
C     
C     ARGUMENTS
C     
      REAL*16 P(0:3,NEXTERNAL)
      INTEGER NHEL(NEXTERNAL), IC(NEXTERNAL)
      INTEGER H
C     
C     LOCAL VARIABLES
C     
      INTEGER I,J,K
      COMPLEX*32 COEFS(MAXLWFSIZE,0:VERTEXMAXCOEFS-1,MAXLWFSIZE)
C     
C     GLOBAL VARIABLES
C     
      INCLUDE 'mp_coupl_same_name.inc'

      INTEGER GOODHEL(NCOMB)
      LOGICAL GOODAMP(NSQUAREDSO,NLOOPGROUPS)
      COMMON/FILTERS/GOODAMP,GOODHEL

      INTEGER SQSO_TARGET
      COMMON/SOCHOICE/SQSO_TARGET

      LOGICAL UVCT_REQ_SO_DONE,MP_UVCT_REQ_SO_DONE,CT_REQ_SO_DONE
     $ ,MP_CT_REQ_SO_DONE,LOOP_REQ_SO_DONE,MP_LOOP_REQ_SO_DONE
     $ ,CTCALL_REQ_SO_DONE,FILTER_SO
      COMMON/SO_REQS/UVCT_REQ_SO_DONE,MP_UVCT_REQ_SO_DONE
     $ ,CT_REQ_SO_DONE,MP_CT_REQ_SO_DONE,LOOP_REQ_SO_DONE
     $ ,MP_LOOP_REQ_SO_DONE,CTCALL_REQ_SO_DONE,FILTER_SO

      COMPLEX*32 AMP(NBORNAMPS)
      COMMON/MP_AMPS/AMP
      COMPLEX*32 W(20,NWAVEFUNCS)
      COMMON/MP_W/W

      COMPLEX*32 WL(MAXLWFSIZE,0:LOOPMAXCOEFS-1,MAXLWFSIZE,
     $ -1:NLOOPWAVEFUNCS)
      COMPLEX*32 PL(0:3,-1:NLOOPWAVEFUNCS)
      COMMON/MP_WL/WL,PL

      COMPLEX*32 AMPL(3,NCTAMPS)
      COMMON/MP_AMPL/AMPL

C     
C     ----------
C     BEGIN CODE
C     ----------

C     The target squared split order contribution is already reached
C      if true.
      IF (FILTER_SO.AND.MP_LOOP_REQ_SO_DONE) THEN
        GOTO 1001
      ENDIF

C     Coefficient construction for loop diagram with ID 3
      CALL MP_FFV1L2P0_3(PL(0,0),W(1,2),GC_11,ZERO,ZERO,PL(0,1),COEFS)
      CALL MP_UPDATE_WL_0_0(WL(1,0,1,0),4,COEFS,4,4,WL(1,0,1,1))
      CALL MP_FFV1L3_1(PL(0,1),W(1,5),GC_11,ZERO,ZERO,PL(0,2),COEFS)
      CALL MP_UPDATE_WL_0_1(WL(1,0,1,1),4,COEFS,4,4,WL(1,0,1,2))
      CALL MP_FFV2L2_1(PL(0,2),W(1,11),GC_24,ZERO,ZERO,PL(0,3),COEFS)
      CALL MP_UPDATE_WL_1_1(WL(1,0,1,2),4,COEFS,4,4,WL(1,0,1,3))
      CALL MP_CREATE_LOOP_COEFS(WL(1,0,1,3),2,4,1,1,1,17,H)
C     Coefficient construction for loop diagram with ID 4
      CALL MP_FFV2L2_1(PL(0,2),W(1,12),GC_24,ZERO,ZERO,PL(0,4),COEFS)
      CALL MP_UPDATE_WL_1_1(WL(1,0,1,2),4,COEFS,4,4,WL(1,0,1,4))
      CALL MP_CREATE_LOOP_COEFS(WL(1,0,1,4),2,4,1,1,1,18,H)
C     Coefficient construction for loop diagram with ID 5
      CALL MP_FFV1L1P0_3(PL(0,0),W(1,1),GC_11,ZERO,ZERO,PL(0,5),COEFS)
      CALL MP_UPDATE_WL_0_0(WL(1,0,1,0),4,COEFS,4,4,WL(1,0,1,5))
      CALL MP_FFV1L3_2(PL(0,5),W(1,6),GC_11,ZERO,ZERO,PL(0,6),COEFS)
      CALL MP_UPDATE_WL_0_1(WL(1,0,1,5),4,COEFS,4,4,WL(1,0,1,6))
      CALL MP_FFV2L1_2(PL(0,6),W(1,14),GC_24,ZERO,ZERO,PL(0,7),COEFS)
      CALL MP_UPDATE_WL_1_1(WL(1,0,1,6),4,COEFS,4,4,WL(1,0,1,7))
      CALL MP_CREATE_LOOP_COEFS(WL(1,0,1,7),2,4,2,1,1,19,H)
C     Coefficient construction for loop diagram with ID 6
      CALL MP_FFV2L1_2(PL(0,6),W(1,16),GC_24,ZERO,ZERO,PL(0,8),COEFS)
      CALL MP_UPDATE_WL_1_1(WL(1,0,1,6),4,COEFS,4,4,WL(1,0,1,8))
      CALL MP_CREATE_LOOP_COEFS(WL(1,0,1,8),2,4,2,1,1,20,H)
C     At this point, all loop coefficients needed for (QCD=2), i.e. of
C      split order ID=1, are computed.
      IF(FILTER_SO.AND.SQSO_TARGET.EQ.1) GOTO 4000

      GOTO 1001
 4000 CONTINUE
      MP_LOOP_REQ_SO_DONE=.TRUE.
 1001 CONTINUE
      END

