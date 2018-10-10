create or replace function getDateReceivable(
 cart_ID in number)
	return date
	is
	receivableDate date;

BEGIN

	IF cart_ID < 0 then
		RAISE excep_invalid_cart;	

	select date_receivable into receivableDate from cart where cart_id = cart_ID;
	return receivableDate;

EXCEPTION
	When no_data_found then
		DBMS_OUTPUT.PUT_LINE('No Data Found');
	When excep_invalid_cart then
		DBMS_OUTPUT.PUT_LINE('Cart Id can not be negative');
	When others then
		DBMS_OUTPUT.PUT_LINE('Something wrong happened');
END;
/