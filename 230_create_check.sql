ALTER TABLE PARTICIPATION ADD (
	CONSTRAINT CK_PARTICIPATION_EI 
		CHECK (ETAT_INVITATION IN ('A', 'R', 'E'))) ;
		

ALTER TABLE PARTICIPANT ADD (
	CONSTRAINT CK_PARTICIPANT_TP 
		CHECK (TYPE_PARTICIPANT IN ('U', 'I'))) ;
		
ALTER TABLE PARTICIPANT ADD (
	CONSTRAINT CK_PARTICIPANT_SEX_P 
		CHECK (SEXE_PARTICIPANT IN ('H', 'F'))) ;
		

 