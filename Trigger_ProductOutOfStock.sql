SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER ShowProductQuantity 
BEFORE DELETE OR INSERT OR UPDATE ON product 
FOR EACH ROW 
WHEN (NEW.quantity < 2) 
DECLARE 
    
BEGIN 
   dbms_output.put_line('Only one product remaining before out of stock!'); 
END; 
/ 