﻿* Encoding: UTF-8.
MIXED var BY sequence period formulation 
  /CRITERIA=CIN(90) MXITER(8000) MXSTEP(200) SCORING(1) SINGULAR(0.0000000000001) HCONVERGE(0, 
    ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000000001, ABSOLUTE) 
  /FIXED=sequence period formulation  | SSTYPE(3) 
  /METHOD=REML
  /PRINT=G  
  /RANDOM=formulation | SUBJECT(subject) COVTYPE(CSH) 
  /REPEATED=formulation | SUBJECT(subject*period) COVTYPE(DIAG)
  /EMMEANS=TABLES(formulation) COMPARE ADJ(LSD).



