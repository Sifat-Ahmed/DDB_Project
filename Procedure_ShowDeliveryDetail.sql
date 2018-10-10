create or replace procedure deliveryDetails(
	cart_id in integer)
	is
	
	cartID cart_id%TYPE := cart_id;
	deliveryID delivery_id%TYPE;
	staffID staff_id%TYPE;
	dateReceivable date_receivable%TYPE;
    staffName staff_name%TYPE;
    CustomerAddress address%TYPE:

	cursor transaction_cur is
	select authorises.date_receivable, authorized.staff_name, delivery.address 
    from causes 
    inner join authorises on causes.delivery_id = authorises.delivery_id
    inner join delivery on authorises.delivery_id = delivery.delivery_id
    inner join authorized_staff on authorises.staff_id = authorized_staff.staff_id
    where causes.cart_id = cartID;



BEGIN
	open delivery_cur;
	loop
		fetch delivery_cur into dateReceivable, staffName, CustomerAddress;
		/*
			Through this procedure delivery history of a specific cart can be checked.
		*/
		exit when delivery_cur%notfound;
	end loop;
	close delivery_cur;

EXCEPTION
	When no_data_found then
		DBMS_OUTPUT.PUT_LINE('No Data Found');
	When others then
		DBMS_OUTPUT.PUT_LINE('Something wrong happened');

END;
/