use om;
select * from customers;

drop trigger if exists CustomerState_before_update;

DELIMITER //
create trigger CustomerState_before_update
 before update on customers
 for each row
	BEGIN
    set new.customer_state = upper(new.customer_state);
END //

DELIMITER ;
show triggers;
update customers set customer_state = "nY" where customer_id = 2;
select * from customers;


