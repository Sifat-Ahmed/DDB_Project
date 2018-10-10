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
	select prod_name, prod_description, price, quantity where product_id = prodId;

BEGIN
	
	
END;
/