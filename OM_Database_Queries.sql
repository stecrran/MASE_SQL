# OM Database
USE om;
# Q1
select * from om.orders where shipped_date - order_date > 10;

# Q2
select orders.order_id, concat(customers.customer_first_name, ' ', customers.customer_last_name) as name from om.orders inner join om.customers on customers.customer_id = orders.customer_id where orders.order_id = 70;

# Q3
select items.title from om.items inner join om.order_details on items.item_id = order_details.item_id where order_id = 264;

# Q4
drop function if exists order_days;
DELIMITER //
create function order_days(set_order_id int)
returns int
deterministic

BEGIN
	DECLARE order_days_var int;
		select DATEDIFF(orders.shipped_date, orders.order_date) into order_days_var from om.orders where order_id = set_order_id;
        return order_days_var;

END //

select om.order_days(392);
select * from orders;
#SHOW FUNCTION STATUS WHERE Db = 'om';
    

