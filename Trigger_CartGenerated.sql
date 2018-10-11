SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER display_cart_insert 
BEFORE INSERT cart 
FOR EACH ROW 
WHEN (NEW.prod_id > 0) 
DECLARE 
   
BEGIN 

   dbms_output.put_line('New Item added in the cart'); 

END; 
/ 