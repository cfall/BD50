-- -----------------------------------------------------------------------------
--       TABLE : GROUPE_UTILISATEUR
-- -----------------------------------------------------------------------------

CREATE TABLE GROUPE_UTILISATEUR
   (
    NUM_GROUPE NUMBER(4)  NOT NULL,
    NUM_PARTICIPANT NUMBER(4)  NOT NULL
,   CONSTRAINT PK_GROUPE_UTILISATEUR PRIMARY KEY (NUM_GROUPE, NUM_PARTICIPANT) 
   ) ORGANIZATION INDEX;


-- -----------------------------------------------------------------------------
--       TABLE : ABSENCE
-- -----------------------------------------------------------------------------

CREATE TABLE ABSENCE
   (
    NUM_EVENEMENT NUMBER(4)  NOT NULL,
    NUM_OCCURRENCE NUMBER(4)  NOT NULL,
    NUM_PARTICIPANT NUMBER(4)  NOT NULL
,   CONSTRAINT PK_ABSENCE PRIMARY KEY (NUM_EVENEMENT, NUM_OCCURRENCE, NUM_PARTICIPANT) 
   )ORGANIZATION INDEX ;