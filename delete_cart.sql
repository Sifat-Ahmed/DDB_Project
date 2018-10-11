create or replace procedure delCart(c_id in cart.cart_id%type) is
   begin
      DELETE FROM cart 
      WHERE cart_id = c_id; 
   end;
   / 