-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE GROUPE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_GROUPE_PARTICIPANT
     ON GROUPE (NUM_PARTICIPANT ASC)
   TABLESPACE BD50_IND ;
   
-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE INDISPONIBILITE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_INDISPONIBILITE_PARTICIPA
     ON INDISPONIBILITE (NUM_PARTICIPANT ASC)
   TABLESPACE BD50_IND ;
   
-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EVENEMENT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EVENEMENT_PERIODICITE
     ON EVENEMENT (NUM_PERIODICITE ASC)
   TABLESPACE BD50_IND ;

CREATE  INDEX I_FK_EVENEMENT_AGENDA
     ON EVENEMENT (NUM_AGENDA ASC)
   TABLESPACE BD50_IND ;

CREATE  INDEX I_FK_EVENEMENT_PARTICIPANT
     ON EVENEMENT (NUM_PARTICIPANT ASC)
   TABLESPACE BD50_IND ;
   
-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE OCCURRENCE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_OCCURRENCE_EVENEMENT
     ON OCCURRENCE (NUM_EVENEMENT ASC)
   TABLESPACE BD50_IND ;
   
-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE GROUPE_UTILISATEUR
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_GROUPE_UTILISATEUR_GROUPE
     ON GROUPE_UTILISATEUR (NUM_GROUPE ASC)
   TABLESPACE BD50_IND ;

CREATE  INDEX I_FK_GROUPE_UTILISATEUR_PARTIC
     ON GROUPE_UTILISATEUR (NUM_PARTICIPANT ASC)
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ABSENCE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ABSENCE_OCCURRENCE
     ON ABSENCE (NUM_EVENEMENT ASC, NUM_OCCURRENCE ASC)
   TABLESPACE BD50_IND ;

CREATE  INDEX I_FK_ABSENCE_PARTICIPANT
     ON ABSENCE (NUM_PARTICIPANT ASC)
   TABLESPACE BD50_IND ;  
   
-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE PARTICIPATION
-- -----------------------------------------------------------------------------
CREATE  INDEX I_FK_PARTICIPATION_EVENEMENT
     ON PARTICIPATION (NUM_EVENEMENT ASC)
   TABLESPACE WEBAGENDA_IND ;

CREATE  INDEX I_FK_PARTICIPATION_PARTICIPANT
     ON PARTICIPATION (NUM_PARTICIPANT ASC)
   TABLESPACE WEBAGENDA_IND ;
   
   