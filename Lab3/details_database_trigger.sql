select * from details;
DROP trigger if exists insert_into_audit_after_delete;


DELIMITER //

create trigger insert_into_audit_after_delete
	after delete on details
    for each row
	BEGIN
    INSERT INTO audit values
    (old.id, old.firstName, old.lastName, old.age, old.gender, old.position, old.department, old.rate, old.hours);
    
    END //
    
    delete from details where id = 13;
    
select * from audit;