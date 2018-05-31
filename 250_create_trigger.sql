-----------------------------------------------------------------------------------------------
						-- EVENEMENT
-----------------------------------------------------------------------------------------------
-- TRIGGER de gestion de la redondance 
-- Mise à jour des tables de références et propagation dans la table EVENEMENT

CREATE OR REPLACE TRIGGER TAU_AGENDA
AFTER UPDATE ON AGENDA 
FOR EACH ROW 
BEGIN 
	UPDATE EVENEMENT EVT 
		SET 
			 EVT.NOM_AGENDA = :NEW.NOM_AGENDA
			,EVT.ANNEE_AGENDA = :NEW.ANNEE_AGENDA
	WHERE EVT.NUM_AGENDA = :NEW.NUM_AGENDA; 
END; 
/

CREATE OR REPLACE TRIGGER TAU_PERIODICITE
AFTER UPDATE ON PERIODICITE
FOR EACH ROW 
BEGIN 
	UPDATE EVENEMENT EVT
		SET
			 EVT.TYPE_PERIODICITE = :NEW.TYPE_PERIODICITE
			,EVT.NB_REPETITION = :NEW.NB_REPETITION
			,EVT.DATE_DEB_PERIODICITE = :NEW.DATE_DEB_PERIODICITE
			,EVT.DATE_FIN_PERIODICITE = :NEW.DATE_FIN_PERIODICITE
		WHERE EVT.NUM_PERIODICITE = :NEW.NUM_PERIODICITE;
END; 
/

-- TRIGGER de récupération des valeurs de clés étrangères pour insertion dans la table EVENEMENT

CREATE OR REPLACE TRIGGER TBI_EVENEMENT 
BEFORE INSERT ON EVENEMENT
FOR EACH ROW
DECLARE
	errno number := -20001; 
	errmsg varchar2(200) := 'Erreur dans la clé étrangère';
	numrows number := 0;
BEGIN 
-- Vérification et récupération du nom de l'agenda
	SELECT COUNT(*) INTO numrows
	FROM AGENDA 
	WHERE :new.NUM_AGENDA = AGENDA.NUM_AGENDA;
	IF(numrows = 0) THEN 
		:new.NUM_AGENDA := 0;
		:new.NOM_AGENDA := 'Inconnu';
	ELSE 
		SELECT NOM_AGENDA
		INTO :NEW.NOM_AGENDA 
		FROM AGENDA AGD
		WHERE AGD.NUM_AGENDA = :NEW.NUM_AGENDA; 
	END IF;
-- Vérification et récupération de l'année de l'agenda
	SELECT COUNT(*) INTO numrows
	FROM AGENDA 
	WHERE :new.NUM_AGENDA = AGENDA.NUM_AGENDA;
	IF(numrows = 0) THEN 
		:new.NUM_AGENDA := 0;
		:new.NOM_AGENDA := 'Inconnu';
	ELSE 
		SELECT ANNEE_AGENDA
		INTO :NEW.ANNEE_AGENDA 
		FROM AGENDA AGD
		WHERE AGD.NUM_AGENDA = :NEW.NUM_AGENDA; 
	END IF;
-- Vérification et récupération du type de périodicité
	SELECT COUNT(*) INTO numrows
	FROM PERIODICITE 
	WHERE :new.NUM_PERIODICITE = PERIODICITE.NUM_PERIODICITE;
	IF(numrows = 0) THEN 
		:new.NUM_PERIODICITE := 0;
		:new.TYPE_PERIODICITE := 'Inconnu';
	ELSE 
		SELECT TYPE_PERIODICITE
		INTO :NEW.TYPE_PERIODICITE 
		FROM PERIODICITE PER
		WHERE PER.NUM_PERIODICITE = :NEW.NUM_PERIODICITE; 
	END IF;
-- Vérification et récupération du nombre de répétition de la périodicité
	SELECT COUNT(*) INTO numrows
	FROM PERIODICITE 
	WHERE :new.NUM_PERIODICITE = PERIODICITE.NUM_PERIODICITE;
	IF(numrows = 0) THEN 
		:new.NUM_PERIODICITE := 0;
		:new.NB_REPETITION := 0;
	ELSE 
		SELECT NB_REPETITION
		INTO :NEW.NB_REPETITION 
		FROM PERIODICITE PER
		WHERE PER.NUM_PERIODICITE = :NEW.NUM_PERIODICITE; 
	END IF;
-- Vérification et récupération de la date de début de la périodicité
	SELECT COUNT(*) INTO numrows
	FROM PERIODICITE 
	WHERE :new.NUM_PERIODICITE = PERIODICITE.NUM_PERIODICITE;
	IF(numrows = 0) THEN 
		:new.NUM_PERIODICITE := 0;
		:new.DATE_DEB_PERIODICITE := '00/00/0000';
	ELSE 
		SELECT DATE_DEB_PERIODICITE
		INTO :NEW.DATE_DEB_PERIODICITE 
		FROM PERIODICITE PER
		WHERE PER.NUM_PERIODICITE = :NEW.NUM_PERIODICITE; 
	END IF;
-- Vérification et récupération de la date de fin de la périodicité
	SELECT COUNT(*) INTO numrows
	FROM PERIODICITE 
	WHERE :new.NUM_PERIODICITE = PERIODICITE.NUM_PERIODICITE;
	IF(numrows = 0) THEN 
		:new.NUM_PERIODICITE := 0;
		:new.DATE_FIN_PERIODICITE := '00/00/0000';
	ELSE 
		SELECT DATE_FIN_PERIODICITE
		INTO :NEW.DATE_FIN_PERIODICITE 
		FROM PERIODICITE PER
		WHERE PER.NUM_PERIODICITE = :NEW.NUM_PERIODICITE; 
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN 
		RAISE_APPLICATION_ERROR(errno,errmsg);
END;
/
-------------------------------------------------------------------------------------------------
	                             	-- OCCURENCE
-------------------------------------------------------------------------------------------------											
-- Mise à jour des tables de références et propagation dans la table OCCURRENCE
CREATE OR REPLACE TRIGGER TAU_EVENEMENT
AFTER UPDATE ON EVENEMENT 
FOR EACH ROW 
BEGIN 
	UPDATE OCCURRENCE OCC 
		SET 
			 OCC.LIBELLE_EVENEMENT = :NEW.LIBELLE_EVENEMENT
			,OCC.DATE_DEB_EVENEMENT = :NEW.DATE_DEB_EVENEMENT
			,OCC.DATE_FIN_EVENEMENT = :NEW.DATE_FIN_EVENEMENT
			,OCC.TYPE_EVENEMENT = :NEW.TYPE_EVENEMENT
	WHERE OCC.NUM_EVENEMENT = :NEW.NUM_EVENEMENT; 
END; 
/

-- TRIGGER de récupération des valeurs de clés étrangères pour insertion dans la table EVENEMENT

CREATE OR REPLACE TRIGGER TBI_OCCURRENCE 
BEFORE INSERT ON OCCURRENCE
FOR EACH ROW
DECLARE
	errno number := -20001; 
	errmsg varchar2(200) := 'Erreur dans la clé étrangère'; 
	numrows number := 0; 
BEGIN 
-- Vérification et récupération du libellé de l'événement
	SELECT COUNT(*) INTO numrows
	FROM EVENEMENT 
	WHERE :new.NUM_EVENEMENT = EVENEMENT.NUM_AGENDA;
	IF(numrows = 0) THEN 
		:new.NUM_EVENEMENT := 0;
		:new.LIBELLE_EVENEMENT := 'Inconnu';
	ELSE 
		SELECT LIBELLE_EVENEMENT
		INTO :NEW.LIBELLE_EVENEMENT 
		FROM EVENEMENT EVT
		WHERE EVT.NUM_EVENEMENT = :NEW.NUM_EVENEMENT; 
	END IF;
-- Vérification et récupération de la date de début de l'événement
	SELECT COUNT(*) INTO numrows
	FROM EVENEMENT 
	WHERE :new.NUM_EVENEMENT = EVENEMENT.NUM_AGENDA;
	IF(numrows = 0) THEN 
		:new.NUM_EVENEMENT := 0;
		:new.DATE_DEB_EVENEMENT := '00/00/0000';
	ELSE 
		SELECT DATE_DEB_EVENEMENT
		INTO :NEW.DATE_DEB_EVENEMENT
		FROM EVENEMENT EVT 
		WHERE EVT.NUM_EVENEMENT = :NEW.NUM_EVENEMENT;
	END IF;
-- Vérification et récupération de la date de fin de l'événement
	SELECT COUNT(*) INTO numrows
	FROM EVENEMENT 
	WHERE :new.NUM_EVENEMENT = EVENEMENT.NUM_AGENDA;
	IF(numrows = 0) THEN 
		:new.NUM_EVENEMENT := 0;
		:new.DATE_FIN_EVENEMENT := '00/00/0000';
	ELSE 
		SELECT DATE_FIN_EVENEMENT
		INTO :NEW.DATE_FIN_EVENEMENT
		FROM EVENEMENT EVT 
		WHERE EVT.NUM_EVENEMENT = :NEW.NUM_EVENEMENT;
	END IF;
-- Vérification et récupération du type de l'événement
	SELECT COUNT(*) INTO numrows
	FROM EVENEMENT 
	WHERE :new.NUM_EVENEMENT = EVENEMENT.NUM_AGENDA;
	IF(numrows = 0) THEN 
		:new.NUM_EVENEMENT := 0;
		:new.TYPE_EVENEMENT := 'Inconnu';
	ELSE
		SELECT TYPE_EVENEMENT
		INTO :NEW.TYPE_EVENEMENT
		FROM EVENEMENT EVT 
		WHERE EVT.NUM_EVENEMENT = :NEW.NUM_EVENEMENT;
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN 
		RAISE_APPLICATION_ERROR(errno, errmsg);
END;
/