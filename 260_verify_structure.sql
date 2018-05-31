-- Procédure pour vérifier nombre de tables 
create or replace PROCEDURE VERIFY_STRUCTURE AS 
    nb_tables number := 0; 
    invalid_structure EXCEPTION;
    PRAGMA EXCEPTION_INIT(invalid_structure, -20001); 
BEGIN
    select 
        count(*) into nb_tables
    from 
        user_tables ;
    if(nb_tables <> 10) then 
        raise invalid_structure;
    end if ;
    Exception
        when invalid_structure then
            RAISE_APPLICATION_ERROR (-20001, 'Toutes les tables n"ont pas été créées.'); 
END VERIFY_STRUCTURE;