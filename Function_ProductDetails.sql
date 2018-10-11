 create or replace function getProductDetails(
 prodId in number);

	prodID product_id%TYPE := prodId;
	prodName product_name%TYPE;
	prodDescription product_description%TYPE;
	prodPrice price%TYPE;
	prodQuantity quantity%TYPE;
	prodCategoryID cat_id%TYPE;
	prodCategoryName category_name%TYPE;

	cursor product_cur is 
	select prod_name, prod_description, price, quantity from product@site_link where product_id = prodId;

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
	
END;
/