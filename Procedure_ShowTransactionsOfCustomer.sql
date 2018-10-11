create or replace procedure showProductDetails(
	Customer_id in integer)
	is
	
	Cart_Id cart.cart_id%TYPE := prod_id;
	quantity cart.quantity%TYPE;
	totalAmount cart.total_price%TYPE;
	transaction_date cart.date%TYPE;

	cursor customer_cur is
	select cart_id , quantity, total_price , gdate
	from customer inner join generates on customer.customer_id = generates.cust_id 
	inner join cart on cart.cart_id = generates.cart_id 
	where customer.customer_id = Cutomer_Id;  
	
	
BEGIN
	open customer_cur;
	loop
		fetch customer_cur into Cart_Id, quantity, totalAmount, date;
		/*
			This will find all the transaction history of a particular user.
		*/
		exit when customer_cur%notfound;
	end loop;
	close customer_cur;

EXCEPTION
	When no_data_found then
		DBMS_OUTPUT.PUT_LINE('No Data Found');
	When others then
		DBMS_OUTPUT.PUT_LINE('Something wrong happened');
END;
/