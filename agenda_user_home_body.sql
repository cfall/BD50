create or replace PACKAGE BODY AGENDA_USER_HOME AS
 
  procedure aff_menu AS 
  BEGIN
  htp.htmlopen; 
    HTP.HEADOPEN; 
    HTP.TITLE('Home'); 
    HTP.PRINT('<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">');
    HTP.HEADCLOSE;
    
    HTP.BODYOPEN; 
        HTP.PRINT('<nav class="navbar navbar-default">
              <div class="container-fluid">
                <div class="navbar-header">
                  <a class="navbar-brand" href="#">Web Agenda</a>
                </div>
                <ul class="nav navbar-nav">
                  <li class="active"><a href="aff_home_page">Accueil</a></li>
                  <li><a href="agenda_user_home.ag_aff_lst_agenda">Agenda</a></li>
                  <li><a href="#">Invitation</a></li>
                  <li><a href="#">Groupe</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                  <li><a href="#"><span class="glyphicon glyphicon-user"></span> Mon compte</a></li>
                  <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Se déconnecter</a></li>
                </ul>
              </div>
            </nav>');
    end aff_menu; 

  procedure aff_home_page AS
  BEGIN
    htp.htmlopen; 
    HTP.HEADOPEN; 
    HTP.TITLE('Home'); 
    HTP.PRINT('<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">');
    HTP.HEADCLOSE;
    
    HTP.BODYOPEN(cattributes =>'TEXT="#000000" BGCOLOR="#FFFFFF"'); 
        HTP.PRINT('<nav class="navbar navbar-inverse">'); 
            HTP.PRINT('<div class="container-fluid">');
                HTP.PRINT('<div class="navbar navbar-header">');
                    HTP.PRINT('<a class="navbar-brand" href="#">Site</a>');
                HTP.PRINT('<div/>');
                HTP.PRINT('<ul class="navbar navbar-nav">');
                    HTP.PRINT('<li class="active"><a href="#">Home</a></li>');
                    HTP.PRINT('<li><a href="#">Agenda</a></li>');
                    HTP.PRINT('<li><a href="#">Invitation</a></li>');
                    HTP.PRINT('<li><a href="#">Groupe</a></li>');
                HTP.PRINT('</ul>');
                HTP.PRINT('<ul class="navbar navbar-nav navbar-right">');
                    HTP.PRINT('<li><a href="#"><span class="glyphicon glyphicon-user">Mon compte</span></a></li>');
                    HTP.PRINT('<li><a href="#"><span class="glyphicon glyphicon-log-out">Se déconnecter</span></a></li>');
                HTP.PRINT('</ul>');
            HTP.PRINT('</div>');
        HTP.PRINT('</nav>');
        HTP.PARA; 
        HTP.PRINT('Bienvenu dans votre agenda personnel !');
        HTP.BODYCLOSE;
        HTP.HTMLCLOSE;
  END aff_home_page;
  
  procedure ag_aff_lst_agenda as 
  cursor lst_agenda is 
  select 
     agd.nom_agenda
    ,agd.annee_agenda
    ,agd.num_agenda
    ,count(evt.num_evenement) as nb 
  from 
    agenda agd inner join evenement evt 
        on agd.num_agenda = evt.num_agenda 
  where 
    evt.num_participant = 1
  group by 
    agd.nom_agenda
    ,agd.annee_agenda
    ,agd.num_agenda
  order by 1 ;
  nb number := 0; 
BEGIN
    agenda_user_home.aff_menu; 
    htp.br;
    htp.print('Liste des agendas');
    htp.br; 
   /* if(lst_agenda%ROWCOUNT = 0)  then 
        htp.print('Vous n"avez aucun agenda !');
    else */
        htp.tableOpen(cattributes => 'TRUE COLS=2 CELLSPACING=2 CELLSPADDING=2 WIDTH="50%"');
        htp.tableheader('Nom agenda',cattributes => 'BGCOLOR="FFCC33"');
        htp.tableheader('Année agenda',cattributes => 'BGCOLOR="FFCC33"');
        htp.tableheader('Nombre événements',cattributes => 'BGCOLOR="FFCC33"');
        for agenda in lst_agenda loop 
            htp.tableRowOpen; 
            htp.tableData(agenda.nom_agenda, cattributes => 'BGCOLOR="FFFF33"');
            htp.tableData(agenda.annee_agenda, cattributes => 'BGCOLOR="FFFF33"');
            htp.tableData('<font-color="#000000">' || htf.anchor('agenda_user_home.ag_aff_lst_evenement?var_num_agenda=' || agenda.num_agenda, agenda.nb || ' événements')
            || '</font>', cattributes => 'BGCOLOR="#FFFF33"');
        end loop ; 
        htp.tableRowClose; 
        htp.tableRowOpen; 
        htp.tableRowClose;
    /*end if; */
    htp.br;
    htp.bodyClose;
    htp.htmlClose;
        
END AG_AFF_LST_AGENDA;

procedure AG_AFF_LST_EVENEMENT(var_num_agenda number) AS 
    cursor lst_evenement is 
    select 
         evt.libelle_evenement
        ,evt.date_deb_evenement
        ,evt.date_fin_evenement
        ,evt.type_evenement
        ,evt.num_evenement
        ,count(occ.num_occurrence) as nb_occ
    from 
        evenement evt inner join occurrence occ
            on evt.num_evenement = occ.num_evenement
    where 
        evt.num_agenda = var_num_agenda 
    group by 
         evt.libelle_evenement
        ,evt.date_deb_evenement
        ,evt.date_fin_evenement
        ,evt.type_evenement
        ,evt.num_evenement
    order by 2 desc ;  
begin
   /* var_nom_agenda varchar2;
    select nom_agenda into var_nom_agenda 
    from agenda 
    where num_agenda = var_num_agenda ;*/ 
    
    agenda_user_home.aff_menu; 
    htp.print('Liste des événements de l"agenda : ' || var_num_agenda);
    htp.br;
    htp.tableOpen(cattributes => 'TRUE COLS=2 CELLSPACING=2 CELLSPADDING=2 WIDTH="50%"');
    htp.tableheader('Nom événement',cattributes => 'BGCOLOR="FFCC33"');
    htp.tableheader('Date de début',cattributes => 'BGCOLOR="FFCC33"');
    htp.tableheader('Date de fin',cattributes => 'BGCOLOR="FFCC33"');
    htp.tableheader('Type',cattributes => 'BGCOLOR="FFCC33"');
    htp.tableheader('Occurrence(s)',cattributes => 'BGCOLOR="FFCC33"');
    for evenement in lst_evenement loop 
        htp.tableRowOpen; 
        htp.tableData(evenement.libelle_evenement, cattributes => 'BGCOLOR="FFFF33"');
        htp.tableData(evenement.date_deb_evenement, cattributes => 'BGCOLOR="FFFF33"');
        htp.tableData(evenement.date_fin_evenement, cattributes => 'BGCOLOR="FFFF33"');
        htp.tableData(evenement.type_evenement, cattributes => 'BGCOLOR="FFFF33"');
        htp.tableData('<font-color="#000000">' || htf.anchor('agenda_user_home.ag_aff_lst_occurrence?var_num_evenement=' || evenement.num_evenement, evenement.nb_occ || ' occurrence(s)')
            || '</font>', cattributes => 'BGCOLOR="#FFFF33"');
        htp.tableRowClose; 
        htp.tableRowOpen; 
        htp.tableRowClose;
    end loop ;
    htp.br;
    htp.bodyClose;
    htp.htmlClose;
END AG_AFF_LST_EVENEMENT;

procedure AG_AFF_LST_OCCURRENCE(var_num_evenement number) IS 
    cursor lst_occurrence is 
    select 
         occ.date_occurrence
        ,occ.num_rue_occurrence
        ,occ.nom_rue_occurrence
        ,occ.comp_adr_occurrence
        ,occ.commune_occurrence
        ,occ.cp_occurrence
        ,occ.pays_occurrence
        ,occ.heure_deb_occurrence
        ,occ.heure_fin_occurrence
    from 
        occurrence occ
    where 
        occ.num_evenement = var_num_evenement
    order by 
        1 desc ;
begin 
    agenda_user_home.aff_menu; 
    htp.br;
    htp.print('Liste des occurrences de l"événement : ' || var_num_evenement);
    htp.br;
    htp.tableOpen(cattributes => 'TRUE COLS=2 CELLSPACING=2 CELLSPADDING=2 WIDTH="50%"');
    htp.tableheader('Date',cattributes => 'BGCOLOR="FFCC33"');
    htp.tableheader('Adresse',cattributes => 'BGCOLOR="FFCC33"');
    htp.tableheader('Heure de début',cattributes => 'BGCOLOR="FFCC33"');
    htp.tableheader('Heure de fin',cattributes => 'BGCOLOR="FFCC33"');
    for occurrence in lst_occurrence loop 
        htp.tableRowOpen; 
        htp.tableData(occurrence.date_occurrence, cattributes => 'BGCOLOR="FFFF33"');
        htp.tableData(occurrence.num_rue_occurrence || ' ' || occurrence.nom_rue_occurrence || ' ' || occurrence.comp_adr_occurrence 
        || ', ' || occurrence.cp_occurrence || ' ' || occurrence.commune_occurrence || ' ' || occurrence.pays_occurrence, 
        cattributes => 'BGCOLOR="FFFF33"');
        htp.tableData(occurrence.heure_deb_occurrence, cattributes => 'BGCOLOR="FFFF33"');
        htp.tableData(occurrence.heure_fin_occurrence, cattributes => 'BGCOLOR="FFFF33"');
        htp.tableRowClose; 
        htp.tableRowOpen; 
        htp.tableRowClose;
    end loop; 
END AG_AFF_LST_OCCURRENCE; 

END AGENDA_USER_HOME;