-- -----------------------------------------------------------------------------
--       TABLE : PARTICIPANT
-- -----------------------------------------------------------------------------

CREATE TABLE PARTICIPANT
   (
    NUM_PARTICIPANT NUMBER(4)  NOT NULL,
    NOM_PARTICIPANT VARCHAR2(50)  NOT NULL,
    PRENOM_PARTICIPANT VARCHAR2(50)  NOT NULL,
    DATE_NAISS_PARTICIPANT DATE  NOT NULL,
    SEXE_PARTICIPANT VARCHAR2(1)  NOT NULL,
    MAIL_PARTICIPANT VARCHAR2(100)  NOT NULL,
    TEL_PARTICIPANT VARCHAR2(15)  NULL,
    TYPE_PARTICIPANT VARCHAR2(1)  NOT NULL,
    LOGIN VARCHAR2(20)  NULL,
    MDP VARCHAR2(40)  NULL,
    DATE_CREA_COMPTE DATE  NULL,
    STATUT_COMPTE NUMBER(1)  NULL,
    TYPE_UTILISATEUR VARCHAR2(6)  NULL
,   CONSTRAINT PK_PARTICIPANT PRIMARY KEY (NUM_PARTICIPANT)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : GROUPE
-- -----------------------------------------------------------------------------

CREATE TABLE GROUPE
   (
    NUM_GROUPE NUMBER(4)  NOT NULL,
    NUM_PARTICIPANT NUMBER(4)  NOT NULL,
    NOM_GROUPE VARCHAR2(50)  NOT NULL
,   CONSTRAINT PK_GROUPE PRIMARY KEY (NUM_GROUPE)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : INDISPONIBILITE
-- -----------------------------------------------------------------------------

CREATE TABLE INDISPONIBILITE
   (
    NUM_INDISPO NUMBER(4)  NOT NULL,
    NUM_PARTICIPANT NUMBER(4)  NOT NULL,
    DATE_DEB_INDISPO DATE  NOT NULL,
    DATE_FIN_INDISPO DATE  NOT NULL,
    RAISON_INDISPO VARCHAR2(50)  NULL
,   CONSTRAINT PK_INDISPONIBILITE PRIMARY KEY (NUM_INDISPO)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : EVENEMENT
-- -----------------------------------------------------------------------------

CREATE TABLE EVENEMENT
   (
    NUM_EVENEMENT NUMBER(4)  NOT NULL,
    NUM_PERIODICITE NUMBER(4)  NOT NULL,
    NUM_AGENDA NUMBER(4)  NOT NULL,
    NUM_PARTICIPANT NUMBER(4)  NOT NULL,
    LIBELLE_EVENEMENT VARCHAR2(100)  NOT NULL,
    DATE_DEB_EVENEMENT DATE  NOT NULL,
    DATE_FIN_EVENEMENT DATE  NOT NULL,
    TYPE_EVENEMENT VARCHAR2(50)  NOT NULL,
    REPETITIF NUMBER(1)  NOT NULL,
    PRIVE NUMBER(1)  NOT NULL,
    ETAT_EVENEMENT NUMBER(1)  NOT NULL,
    NOM_AGENDA VARCHAR2(50)  NOT NULL,
    ANNEE_AGENDA NUMBER(4)  NOT NULL,
    TYPE_PERIODICITE VARCHAR2(40)  NOT NULL,
    NB_REPETITION NUMBER(4)  NOT NULL,
    DATE_DEB_PERIODICITE DATE  NOT NULL,
    DATE_FIN_PERIODICITE DATE  NOT NULL
,   CONSTRAINT PK_EVENEMENT PRIMARY KEY (NUM_EVENEMENT)  USING INDEX TABLESPACE BD50_IND 
   ) ;


-- -----------------------------------------------------------------------------
--       TABLE : AGENDA
-- -----------------------------------------------------------------------------

CREATE TABLE AGENDA
   (
    NUM_AGENDA NUMBER(4)  NOT NULL,
    NOM_AGENDA VARCHAR2(128)  NOT NULL,
    ANNEE_AGENDA NUMBER(4)  NOT NULL
,   CONSTRAINT PK_AGENDA PRIMARY KEY (NUM_AGENDA)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : OCCURRENCE
-- -----------------------------------------------------------------------------

CREATE TABLE OCCURRENCE
   (
    NUM_EVENEMENT NUMBER(4)  NOT NULL,
    NUM_OCCURRENCE NUMBER(4)  NOT NULL,
    DATE_OCCURRENCE DATE  NOT NULL,
    NUM_RUE_OCCURRENCE NUMBER(4)  NOT NULL,
    EXT_OCCURRENCE VARCHAR2(3)  NULL,
    NOM_RUE_OCCURRENCE VARCHAR2(50)  NOT NULL,
    COMP_ADR_OCCURRENCE VARCHAR2(60)  NULL,
    COMMUNE_OCCURRENCE VARCHAR2(50)  NOT NULL,
    CP_OCCURRENCE VARCHAR2(8)  NOT NULL,
    PAYS_OCCURRENCE VARCHAR2(40)  NOT NULL,
    HEURE_DEB_OCCURRENCE DATE  NOT NULL,
    HEURE_FIN_OCCURRENCE DATE  NOT NULL,
    ETAT_OCCURRENCE NUMBER(1)  NOT NULL,
    LIBELLE_EVENEMENT VARCHAR2(100)  NOT NULL,
    DATE_DEB_EVENEMENT DATE  NOT NULL,
    DATE_FIN_EVENEMENT DATE  NOT NULL,
    TYPE_EVENEMENT VARCHAR2(50)  NOT NULL
,   CONSTRAINT PK_OCCURRENCE PRIMARY KEY (NUM_EVENEMENT, NUM_OCCURRENCE)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : PERIODICITE
-- -----------------------------------------------------------------------------

CREATE TABLE PERIODICITE
   (
    NUM_PERIODICITE NUMBER(4)  NOT NULL,
    TYPE_PERIODICITE VARCHAR2(40)  NOT NULL,
    NB_REPETITION NUMBER(4)  NOT NULL,
    DATE_DEB_PERIODICITE DATE  NOT NULL,
    DATE_FIN_PERIODICITE DATE  NOT NULL
,   CONSTRAINT PK_PERIODICITE PRIMARY KEY (NUM_PERIODICITE)  USING INDEX TABLESPACE BD50_IND 
   ) ;

   
-- -----------------------------------------------------------------------------
--       TABLE : PARTICIPATION
-- -----------------------------------------------------------------------------

CREATE TABLE PARTICIPATION
   (
    NUM_PARTICIPANT NUMBER(4)  NOT NULL,
    NUM_EVENEMENT NUMBER(4)  NOT NULL,
    PARTICIPE NUMBER(1)  NOT NULL,
    ETAT_INVITATION VARCHAR2(1)  NOT NULL
,   CONSTRAINT PK_PARTICIPATION PRIMARY KEY (NUM_PARTICIPANT, NUM_EVENEMENT)  USING INDEX TABLESPACE BD50_IND 
   ) ;