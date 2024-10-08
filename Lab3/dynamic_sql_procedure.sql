drop procedure if exists select_scripts;
DELIMITER //
create procedure select_scripts
(
min_script_date_param DATE,
drug_id_param INT(11)
)
BEGIN
	DECLARE select_clause VARCHAR(200);
    DECLARE where_clause VARCHAR(200);
    
    SET select_clause = "select drug_id, date_perscribed from thedocs.prescriptions";
    SET where_clause = " where ";
    
    if min_script_date_param IS NOT NULL THEN
		set where_clause = CONCAT(where_clause, " date_perscribed > '", min_script_date_param, "'");
	end if;
    
    if drug_id_param IS NOT NULL THEN
		if where_clause != " where " then
			set where_clause = CONCAT(where_clause, " AND ");
		end if;
        set where_clause = CONCAT(where_clause, " drug_id = ", drug_id_param);
	end if;
    
    if where_clause = " where " then
		set @dynamic_sql = select_clause;
	else
		set @dynamic_sql = CONCAT(select_clause, where_clause);
        select @dynamic_sql;
	end if;
    
    prepare select_scripts_statement from @dynamic_sql;
    
    execute select_scripts_statement;
    deallocate prepare select_scripts_statement;
    
END //
DELIMITER ;

call select_scripts('2012-7-01', null);