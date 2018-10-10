SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER display_product_update 
BEFORE DELETE OR INSERT OR UPDATE ON product 
FOR EACH ROW 
WHEN (NEW.prod_id > 0) 
DECLARE 
   difference number; 
BEGIN 

   difference := :NEW.quantity  - :OLD.quantity; 
   dbms_output.put_line('Before Update' || :OLD.quantity); 
   dbms_output.put_line('After Update: ' || :NEW.quantity); 
   dbms_output.put_line('New product Added: ' || difference); 

END; 
/ 