-- Table périodicité 
insert into periodicite
		( num_periodicite
		 ,type_periodicite
		 ,nb_repetition
		 ,date_deb_periodicite
		 ,date_fin_periodicite) 
	values 
		( seq_periodicite.nextval
		 ,'SEMESTRIELLE'
		 ,2
		 ,'22/02/2018'
		 ,'23/06/2018') ;

-- Table agenda 
insert into agenda
		( num_agenda
		 ,nom_agenda
		 ,annee_agenda) 
	values 
		( seq_agenda.nextval
		 ,'Emploi du temps'
		 ,2018) ;	

-- Table participant 
insert into participant
		( num_participant
		 ,nom_participant
		 ,prenom_participant
		 ,date_naiss_participant
		 ,sexe_participant
		 ,mail_participant
		 ,tel_participant
		 ,type_participant
		 ,login
		 ,mdp
		 ,date_crea_compte
		 ,statut_compte
		 ,type_utilisateur
		 ) 
	values 
		( seq_occurrence.nextval
		 ,'FISCHER'
		 ,'Christian'
		 ,'01/06/1963'
		 ,'H'
		 ,'christian.fischer@utbm.fr'
		 ,'0676852110'
		 ,'U'
		 ,'cfischer'
		 ,'cfischer'
		 ,sysdate
		 ,1
		 ,'User');		 
		 
-- Table événement 
insert into evenement
		( num_evenement
		 ,num_periodicite
		 ,num_agenda
		 ,num_participant
		 ,libelle_evenement
		 ,date_deb_evenement
		 ,date_fin_evenement
		 ,type_evenement
		 ,repetitif
		 ,prive
		 ,etat_evenement
		 ) 
	values 
		( seq_evenement.nextval
		 ,1
		 ,1
		 ,1
		 ,'Cours BD50'
		 ,'22/02/2018'
		 ,'23/06/2018'
		 ,'Cours'
		 ,0
		 ,1
		 ,1);

-- Table occurrence		 
insert into occurrence
		( num_evenement
		 ,num_occurrence
		 ,date_occurrence
		 ,num_rue_occurrence
		 ,nom_rue_occurrence
		 ,comp_adr_occurrence
		 ,commune_occurrence
		 ,cp_occurrence
		 ,pays_occurrence
		 ,heure_deb_occurrence
		 ,heure_fin_occurrence
		 ,etat_occurrence
		 ) 
	values 
		( 2
		 ,seq_occurrence.nextval
		 ,'13/03/2018'
		 ,12
		 ,'Thierry Mieg'
		 ,'Bâtiment B salle E107'
		 ,'BELFORT'
		 ,90000
		 ,'FRANCE'
		 ,to_date('13/03/2018 08:00', 'dd/mm/yyyy hh:mi')
		 ,to_date('13/03/2018 10:00', 'dd/mm/yyyy hh:mi')
		 ,1);		 