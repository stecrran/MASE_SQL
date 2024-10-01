# update the department for a given employee id e.g. call update_department(2, 'Engineering');
DELIMITER //
create procedure update_department
(
set_id int,
set_department varchar(20)
)
BEGIN
	start transaction;
    update details
    set department = set_department
    where id = set_id;
commit;

END //

select * from lab2.details;
call update_department(2, "Science");

DELIMITER //

CREATE PROCEDURE update_rate_position
(
    IN set_position VARCHAR(15),
    IN set_rate DECIMAL(7,2),
    OUT update_count INT
)
BEGIN
	DECLARE sql_error TINYINT default FALSE;
    
    DECLARE CONTINUE HANDLER FOR sqlexception
		SET sql_error = TRUE;
        
    START TRANSACTION;
    
    UPDATE details
    SET rate = set_rate
    WHERE position = set_position;
   
   IF sql_error = FALSE THEN
   select count(*) from lab2.details where position = set_position into update_count;
    COMMIT;
    
   ELSE
	set update_count = 0;
    rollback;
   END IF;
END //
    
	# this correctly returns row_count() = 3
    #UPDATE details
    #SET rate = 91
    #WHERE position = "Head";
    #select row_count(); 

# this returns @update_count = 1 or row_count() = 0
#call update_rate_position("Head", 60, @update_count);
#select @update_count;

# this returns 1 for update_count. When executed, '4' flashes up but returns to '1'
call update_rate_position("Lecturer", 30, @update_count);
#select count(*) from lab2.details where position = "Researcher";
#select @update_count;
#select * from lab2.details;


    