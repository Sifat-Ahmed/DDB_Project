SET SERVEROUTPUT ON; 

create or replace procedure showCart
(c_id in out number)
is

g_cid generates.cart_id%type;

c_cid cart.cart_id%type; 
c_pname cart.product_name%type;
c_quantity cart.quantity%type;
c_unitprice cart.unit_price%type;
c_totalprice cart.total_price%type;

CURSOR g_gen is 
      select cart_id from generates where cus_id = c_id;

CURSOR c_curt(cid in number) is 
      select cart_id,product_name,quantity,unit_price,total_price from cart where cart_id = cid;

begin

 dbms_output.put_line('cart_id    product_name    quantity    unit_price    total_price');

OPEN g_gen; 

   LOOP  
      FETCH g_gen into g_cid;
      OPEN c_curt(g_cid);

      LOOP 
         FETCH c_curt into c_cid,c_pname,c_quantity,c_unitprice,c_totalprice;
         dbms_output.put_line(c_cid || '    ' || c_pname  || '    ' || c_quantity  || '    ' || c_unitprice  || '    ' || c_totalprice );
         EXIT WHEN c_curt%notfound;  
      END LOOP;

      CLOSE c_curt;


      EXIT WHEN g_gen%notfound;  
   END LOOP;

CLOSE g_gen; 
end;
/