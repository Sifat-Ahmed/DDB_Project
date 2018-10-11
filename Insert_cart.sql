create or replace procedure insertCart
(c_productname in out cart.product_name%type,
   c_quantity in out cart.quantity%type,
   c_unitprice in out cart.unit_price%type
)
is

c_id cart.cart_id%type;
c_totalprice cart.total_price%type; 

CURSOR c_cart is 
      select cart_id from cart;

begin

OPEN c_cart; 

   LOOP 
   FETCH c_cart into c_id;
      EXIT WHEN c_cart%notfound;
   c_id := c_id + 1;
   c_totalprice := c_quantity * c_unitprice;    
   INSERT INTO cart
   (cart_id,product_name,quantity,unit_price,total_price)
   VALUES
   (c_id,c_productname,c_quantity,c_unitprice,c_totalprice);    
   END LOOP;

CLOSE c_cart; 
end;
/