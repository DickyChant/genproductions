C     This File is Automatically generated by ALOHA 
C     The process calculated in this file is: 
C     (Gamma(3,2,-1)*ProjM(-1,1)) * C(51,2) * C(52,1)
C     
      SUBROUTINE MP_FFV2C1_0(F2, F1, V3, COUP,VERTEX)
      IMPLICIT NONE
      COMPLEX*32 CI
      PARAMETER (CI=(0Q0,1Q0))
      COMPLEX*32 TMP2
      COMPLEX*32 V3(*)
      COMPLEX*32 F1(*)
      COMPLEX*32 F2(*)
      COMPLEX*32 VERTEX
      COMPLEX*32 COUP
      TMP2 = (-1Q0)*(F1(5)*(F2(7)*(V3(5)-V3(8))+F2(8)*(+CI*(V3(7))
     $ -V3(6)))+F1(6)*(F2(7)*(-1Q0)*(V3(6)+CI*(V3(7)))+F2(8)*(V3(5)
     $ +V3(8))))
      VERTEX = COUP*(-CI * TMP2)
      END


