CREATE PACKAGE cart_operation AS 
  PROCEDURE insertCart(c_productname in out cart.product_name%type,c_quantity in out cart.quantity%type,c_unitprice in out cart.unit_price%type);
  PROCEDURE delCart(c_id in cart.cart_id%type);
  PROCEDURE showCart(c_id in out number);
END cust_sal; 
/