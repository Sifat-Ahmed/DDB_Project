create or replace function CountCartItems(
 cart_ID in number)
	return number
	is
	counter number;

BEGIN
	IF cart_ID < 0 then
		RAISE excep_invalid_cart;	
	ELSE
		select count(product_name) into counter from cart where cart_id = cart_ID;
	
		if counter = 0
		then return 0;
		elsif counter > 0
		then return (counter - 1);
		end if;

EXCEPTION
	When no_data_found then
		DBMS_OUTPUT.PUT_LINE('No Data Found');
	When excep_invalid_cart then
		DBMS_OUTPUT.PUT_LINE('Cart Id can not be negative');
	When others then
		DBMS_OUTPUT.PUT_LINE('Something wrong happened');
END;
/