-- -----------------------------------------------------------------------------
--             G�n�ration d'une base de donn�es pour
--                      Oracle Version 10g
--                        (14/5/2018 23:28:45)
-- -----------------------------------------------------------------------------
--      Nom de la base : WEB_AGENDA
--      Projet : Projet BD50 - Cr�ation d'un Web agenda
--      Auteur : Groupe 14
--      Date de derni�re modification : 14/5/2018 19:07:10
-- -----------------------------------------------------------------------------

DROP TABLE PARTICIPANT CASCADE CONSTRAINTS;

DROP TABLE GROUPE CASCADE CONSTRAINTS;

DROP TABLE INDISPONIBILITE CASCADE CONSTRAINTS;

DROP TABLE EVENEMENT CASCADE CONSTRAINTS;

DROP TABLE AGENDA CASCADE CONSTRAINTS;

DROP TABLE OCCURRENCE CASCADE CONSTRAINTS;

DROP TABLE PERIODICITE CASCADE CONSTRAINTS;

DROP TABLE GROUPE_UTILISATEUR CASCADE CONSTRAINTS;

DROP TABLE ABSENCE CASCADE CONSTRAINTS;

DROP TABLE PARTICIPATION CASCADE CONSTRAINTS;

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
,   CONSTRAINT PK_PARTICIPANT PRIMARY KEY (NUM_PARTICIPANT)  USING INDEX TABLESPACE WEBAGENDA_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : GROUPE
-- -----------------------------------------------------------------------------

CREATE TABLE GROUPE
   (
    NUM_GROUPE NUMBER(4)  NOT NULL,
    NUM_PARTICIPANT NUMBER(4)  NOT NULL,
    NOM_GROUPE VARCHAR2(50)  NOT NULL
,   CONSTRAINT PK_GROUPE PRIMARY KEY (NUM_GROUPE)  USING INDEX TABLESPACE WEBAGENDA_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE GROUPE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_GROUPE_PARTICIPANT
     ON GROUPE (NUM_PARTICIPANT ASC)
   TABLESPACE WEBAGENDA_IND ;

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
,   CONSTRAINT PK_INDISPONIBILITE PRIMARY KEY (NUM_INDISPO)  USING INDEX TABLESPACE WEBAGENDA_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE INDISPONIBILITE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_INDISPONIBILITE_PARTICIPA
     ON INDISPONIBILITE (NUM_PARTICIPANT ASC)
   TABLESPACE WEBAGENDA_IND ;

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
,   CONSTRAINT PK_EVENEMENT PRIMARY KEY (NUM_EVENEMENT)  USING INDEX TABLESPACE WEBAGENDA_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EVENEMENT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EVENEMENT_PERIODICITE
     ON EVENEMENT (NUM_PERIODICITE ASC)
   TABLESPACE WEBAGENDA_IND ;

CREATE  INDEX I_FK_EVENEMENT_AGENDA
     ON EVENEMENT (NUM_AGENDA ASC)
   TABLESPACE WEBAGENDA_IND ;

CREATE  INDEX I_FK_EVENEMENT_PARTICIPANT
     ON EVENEMENT (NUM_PARTICIPANT ASC)
   TABLESPACE WEBAGENDA_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : AGENDA
-- -----------------------------------------------------------------------------

CREATE TABLE AGENDA
   (
    NUM_AGENDA NUMBER(4)  NOT NULL,
    NOM_AGENDA VARCHAR2(128)  NOT NULL,
    ANNEE_AGENDA NUMBER(4)  NOT NULL
,   CONSTRAINT PK_AGENDA PRIMARY KEY (NUM_AGENDA)  USING INDEX TABLESPACE WEBAGENDA_IND 
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
,   CONSTRAINT PK_OCCURRENCE PRIMARY KEY (NUM_EVENEMENT, NUM_OCCURRENCE)  USING INDEX TABLESPACE WEBAGENDA_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE OCCURRENCE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_OCCURRENCE_EVENEMENT
     ON OCCURRENCE (NUM_EVENEMENT ASC)
   TABLESPACE WEBAGENDA_IND ;

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
,   CONSTRAINT PK_PERIODICITE PRIMARY KEY (NUM_PERIODICITE)  USING INDEX TABLESPACE WEBAGENDA_IND 
   ) ;

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
--       INDEX DE LA TABLE GROUPE_UTILISATEUR
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_GROUPE_UTILISATEUR_GROUPE
     ON GROUPE_UTILISATEUR (NUM_GROUPE ASC)
   TABLESPACE WEBAGENDA_IND ;

CREATE  INDEX I_FK_GROUPE_UTILISATEUR_PARTIC
     ON GROUPE_UTILISATEUR (NUM_PARTICIPANT ASC)
   TABLESPACE WEBAGENDA_IND ;

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

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ABSENCE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ABSENCE_OCCURRENCE
     ON ABSENCE (NUM_EVENEMENT ASC, NUM_OCCURRENCE ASC)
   TABLESPACE WEBAGENDA_IND ;

CREATE  INDEX I_FK_ABSENCE_PARTICIPANT
     ON ABSENCE (NUM_PARTICIPANT ASC)
   TABLESPACE WEBAGENDA_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : PARTICIPATION
-- -----------------------------------------------------------------------------

CREATE TABLE PARTICIPATION
   (
    NUM_PARTICIPANT NUMBER(4)  NOT NULL,
    NUM_EVENEMENT NUMBER(4)  NOT NULL,
    PARTICIPE NUMBER(1)  NOT NULL,
    ETAT_INVITATION VARCHAR2(1)  NOT NULL
,   CONSTRAINT PK_PARTICIPATION PRIMARY KEY (NUM_PARTICIPANT, NUM_EVENEMENT)  USING INDEX TABLESPACE WEBAGENDA_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE PARTICIPATION
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_PARTICIPATION_EVENEMENT
     ON PARTICIPATION (NUM_EVENEMENT ASC)
   TABLESPACE WEBAGENDA_IND ;

CREATE  INDEX I_FK_PARTICIPATION_PARTICIPANT
     ON PARTICIPATION (NUM_PARTICIPANT ASC)
   TABLESPACE WEBAGENDA_IND ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE GROUPE ADD (
     CONSTRAINT FK_GROUPE_PARTICIPANT
          FOREIGN KEY (NUM_PARTICIPANT)
               REFERENCES PARTICIPANT (NUM_PARTICIPANT));

ALTER TABLE INDISPONIBILITE ADD (
     CONSTRAINT FK_INDISPONIBILITE_PARTICIPANT
          FOREIGN KEY (NUM_PARTICIPANT)
               REFERENCES PARTICIPANT (NUM_PARTICIPANT));

ALTER TABLE EVENEMENT ADD (
     CONSTRAINT FK_EVENEMENT_PERIODICITE
          FOREIGN KEY (NUM_PERIODICITE)
               REFERENCES PERIODICITE (NUM_PERIODICITE));

ALTER TABLE EVENEMENT ADD (
     CONSTRAINT FK_EVENEMENT_AGENDA
          FOREIGN KEY (NUM_AGENDA)
               REFERENCES AGENDA (NUM_AGENDA));

ALTER TABLE EVENEMENT ADD (
     CONSTRAINT FK_EVENEMENT_PARTICIPANT
          FOREIGN KEY (NUM_PARTICIPANT)
               REFERENCES PARTICIPANT (NUM_PARTICIPANT));

ALTER TABLE OCCURRENCE ADD (
     CONSTRAINT FK_OCCURRENCE_EVENEMENT
          FOREIGN KEY (NUM_EVENEMENT)
               REFERENCES EVENEMENT (NUM_EVENEMENT));

ALTER TABLE GROUPE_UTILISATEUR ADD (
     CONSTRAINT FK_GROUPE_UTILISATEUR_GROUPE
          FOREIGN KEY (NUM_GROUPE)
               REFERENCES GROUPE (NUM_GROUPE));

ALTER TABLE GROUPE_UTILISATEUR ADD (
     CONSTRAINT FK_GROUPE_UTILISATEUR_PARTICIP
          FOREIGN KEY (NUM_PARTICIPANT)
               REFERENCES PARTICIPANT (NUM_PARTICIPANT));

ALTER TABLE ABSENCE ADD (
     CONSTRAINT FK_ABSENCE_OCCURRENCE
          FOREIGN KEY (NUM_EVENEMENT, NUM_OCCURRENCE)
               REFERENCES OCCURRENCE (NUM_EVENEMENT, NUM_OCCURRENCE));

ALTER TABLE ABSENCE ADD (
     CONSTRAINT FK_ABSENCE_PARTICIPANT
          FOREIGN KEY (NUM_PARTICIPANT)
               REFERENCES PARTICIPANT (NUM_PARTICIPANT));

ALTER TABLE PARTICIPATION ADD (
     CONSTRAINT FK_PARTICIPATION_EVENEMENT
          FOREIGN KEY (NUM_EVENEMENT)
               REFERENCES EVENEMENT (NUM_EVENEMENT));

ALTER TABLE PARTICIPATION ADD (
     CONSTRAINT FK_PARTICIPATION_PARTICIPANT
          FOREIGN KEY (NUM_PARTICIPANT)
               REFERENCES PARTICIPANT (NUM_PARTICIPANT));

-- -----------------------------------------------------------------------------
--       VUE : PARTICIPANT_UTILISATEUR
-- -----------------------------------------------------------------------------

CREATE VIEW PARTICIPANT_UTILISATEUR  (NUM_PARTICIPANT, NOM_PARTICIPANT, PRENOM_PARTICIPANT, DATE_NAISS_PARTICIPANT, SEXE_PARTICIPANT, MAIL_PARTICIPANT, TEL_PARTICIPANT, TYPE_PARTICIPANT, LOGIN, MDP, DATE_CREA_COMPTE, STATUT_COMPTE, TYPE_UTILISATEUR) AS
SELECT PARTICIPANT.NUM_PARTICIPANT, PARTICIPANT.NOM_PARTICIPANT, PARTICIPANT.PRENOM_PARTICIPANT, PARTICIPANT.DATE_NAISS_PARTICIPANT, PARTICIPANT.SEXE_PARTICIPANT, PARTICIPANT.MAIL_PARTICIPANT, PARTICIPANT.TEL_PARTICIPANT, PARTICIPANT.TYPE_PARTICIPANT, PARTICIPANT.LOGIN, PARTICIPANT.MDP, PARTICIPANT.DATE_CREA_COMPTE, PARTICIPANT.STATUT_COMPTE, PARTICIPANT.TYPE_UTILISATEUR
FROM PARTICIPANT ;

-- -----------------------------------------------------------------------------
--       VUE : PARTICIPANT_INVITE
-- -----------------------------------------------------------------------------

CREATE VIEW PARTICIPANT_INVITE  (NUM_PARTICIPANT, NOM_PARTICIPANT, PRENOM_PARTICIPANT, DATE_NAISS_PARTICIPANT, SEXE_PARTICIPANT, MAIL_PARTICIPANT, TEL_PARTICIPANT, TYPE_PARTICIPANT) AS
SELECT PARTICIPANT.NUM_PARTICIPANT, PARTICIPANT.NOM_PARTICIPANT, PARTICIPANT.PRENOM_PARTICIPANT, PARTICIPANT.DATE_NAISS_PARTICIPANT, PARTICIPANT.SEXE_PARTICIPANT, PARTICIPANT.MAIL_PARTICIPANT, PARTICIPANT.TEL_PARTICIPANT, PARTICIPANT.TYPE_PARTICIPANT
FROM PARTICIPANT ;


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------