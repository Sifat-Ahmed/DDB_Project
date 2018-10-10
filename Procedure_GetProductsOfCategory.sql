create or replace procedure getProductsOfCategory(
	category_id in integer)
	is
	
	prodID product_id%TYPE := prod_id;
	prodName product_name%TYPE;
	prodDescription product_description%TYPE;
	prodPrice price%TYPE;
	prodQuantity quantity%TYPE;
	prodCategoryID cat_id%TYPE;
	prodCategoryName category_name%TYPE;
	
	cursor product_cur is
	select product_name , product_description, price , contains.cat_id, category.category_name 
	from product inner join contains on product.product_id = contains.pro_id 
	inner join  category on category.category_id = contains.cat_id 
	where category.cat_id = category_id;  
	
	
BEGIN
	open product_cur;
	loop
		fetch product_cur into prodName, prodDescription, prodPrice, prodQuantity, prodCategoryID, prodCategoryName;
		/*
			If user click any product then system will catch the product_id and 
			this procedure will be called to get the details of the selected product.
		*/
		exit when product_cur%notfound;
	end loop;
	close product_cur;

EXCEPTION
	When no_data_found then
		DBMS_OUTPUT.PUT_LINE('No Data Found');
	When others then
		DBMS_OUTPUT.PUT_LINE('Something wrong happened');
END;
/