SET SERVEROUTPUT ON; 

create or replace procedure doFragment
(loc in out varchar(50))
is

as_sid authorized_staff.staff_id%type;
as_pid authorized_staff.product_id%type;
as_sname authorized_staff.staff_name%type;
as_cname authorized_staff.company_name%type;
as_address authorized_staff.address%type;

g_cid generates.cart_id%type;
a_did authorises.delivery_id%type;

cus_id customer.customer_id%type;
cus_uname customer.username%type;
cus_name customer.name%type;
cus_mail customer.email%type;
cus_phone customer.phone%type;
cus_loc customer.location%type;
cus_pass customer.password%type;
cus_reg customer.registration_date%type;

d_id delivery.delivery_id%type;
d_cusname delivery.customer_name%type;
d_add delivery.address%type;
d_date delivery.date_receivable%type;


c_cid cart.cart_id%type; 
c_pname cart.product_name%type;
c_quantity cart.quantity%type;
c_unitprice cart.unit_price%type;
c_totalprice cart.total_price%type;

CURSOR c_customer is
      select customer_id,username,name,email,phone,location,password,registration_date from customer where location = loc;

CURSOR g_gen(cusid in number) is 
      select cart_id from generates where cus_id = cusid;

CURSOR c_curt(cid in number) is 
      select cart_id,product_name,quantity,unit_price,total_price from cart where cart_id = cid;

CURSOR s_staff is
      select staff_id,product_id,staff_name,company_name,address from authorized_staff where address = loc;

CURSOR a_autho(staffid in number) is 
      select delivery_id from authorises where staff_id = staffid;

CURSOR d_deli(did in number) is 
      select delivery_id,customer_name,address,date_receivable from delivery where delivery_id = did;


begin

OPEN c_customer;

   LOOP  
      FETCH c_customer into cus_id,cus_uname,cus_name,cus_phone,cus_loc,cus_pass,cus_reg;
      EXIT WHEN c_customer%notfound;
      IF (cus_loc = 'niketon') THEN 
         INSERT INTO customer@site_link1 VALUES (cus_id,cus_uname,cus_name,cus_phone,cus_loc,cus_pass,cus_reg);

         OPEN g_gen(cus_id); 

         LOOP  
            FETCH g_gen into g_cid;
            OPEN c_curt(g_cid);
            LOOP 
               FETCH c_curt into c_cid,c_pname,c_quantity,c_unitprice,c_totalprice;
               INSERT INTO curt@site_link1 VALUES (c_cid,c_pname,c_quantity,c_unitprice,c_totalprice);
               EXIT WHEN c_curt%notfound;  
            END LOOP;

            CLOSE c_curt;

            EXIT WHEN g_gen%notfound;  
         END LOOP;

         CLOSE g_gen; 

      ELSIF (cus_loc = 'kalabagan') THEN 
         INSERT INTO customer@site_link2 VALUES (cus_id,cus_uname,cus_name,cus_phone,cus_loc,cus_pass,cus_reg);

         OPEN g_gen(cus_id); 

         LOOP  
            FETCH g_gen into g_cid;
            OPEN c_curt(g_cid);
            LOOP 
               FETCH c_curt into c_cid,c_pname,c_quantity,c_unitprice,c_totalprice;
               INSERT INTO curt@site_link2 VALUES (c_cid,c_pname,c_quantity,c_unitprice,c_totalprice);
               EXIT WHEN c_curt%notfound;  
            END LOOP;

            CLOSE c_curt;

            EXIT WHEN g_gen%notfound;  
         END LOOP;

         CLOSE g_gen; 

   ELSIF (cus_loc = 'mirpur') THEN 
         INSERT INTO customer@site_link3 VALUES (cus_id,cus_uname,cus_name,cus_phone,cus_loc,cus_pass,cus_reg);

         OPEN g_gen(cus_id); 

         LOOP  
            FETCH g_gen into g_cid;
            OPEN c_curt(g_cid);
            LOOP 
               FETCH c_curt into c_cid,c_pname,c_quantity,c_unitprice,c_totalprice;
               INSERT INTO curt@site_link3 VALUES (c_cid,c_pname,c_quantity,c_unitprice,c_totalprice);
               EXIT WHEN c_curt%notfound;  
            END LOOP;

            CLOSE c_curt;

            EXIT WHEN g_gen%notfound;  
         END LOOP;

         CLOSE g_gen; 
   END LOOP;

CLOSE c_customer;


OPEN s_staff;

   LOOP  
      FETCH s_staff into as_sid,as_pid,as_sname,as_cname,as_address;
      EXIT WHEN s_staff%notfound;
      IF (as_address = 'niketon') THEN 
         INSERT INTO authorized_staff@site_link1 VALUES (as_sid,as_pid,as_sname,as_cname,as_address);

         OPEN a_autho(as_sid); 

         LOOP  
            FETCH a_autho into a_did;
            OPEN d_deli(a_did);
            LOOP 
               FETCH d_deli into d_id,d_cusname,d_add,d_date;
               INSERT INTO delivery@site_link1 VALUES (d_id,d_cusname,d_add,d_date);
               EXIT WHEN d_deli%notfound;  
            END LOOP;

            CLOSE d_deli;

            EXIT WHEN a_autho%notfound;  
         END LOOP;

         CLOSE a_autho;

         ELSIF (as_address = 'kalabagan') THEN 
         INSERT INTO authorized_staff@site_link1 VALUES (as_sid,as_pid,as_sname,as_cname,as_address);

         OPEN a_autho(as_sid); 

         LOOP  
            FETCH a_autho into a_did;
            OPEN d_deli(a_did);
            LOOP 
               FETCH d_deli into d_id,d_cusname,d_add,d_date;
               INSERT INTO delivery@site_link1 VALUES (d_id,d_cusname,d_add,d_date);
               EXIT WHEN d_deli%notfound;  
            END LOOP;

            CLOSE d_deli;

            EXIT WHEN a_autho%notfound;  
         END LOOP;

         CLOSE a_autho; 

         ELSIF (as_address = 'mirpur') THEN 
         INSERT INTO authorized_staff@site_link1 VALUES (as_sid,as_pid,as_sname,as_cname,as_address);

         OPEN a_autho(as_sid); 

         LOOP  
            FETCH a_autho into a_did;
            OPEN d_deli(a_did);
            LOOP 
               FETCH d_deli into d_id,d_cusname,d_add,d_date;
               INSERT INTO delivery@site_link1 VALUES (d_id,d_cusname,d_add,d_date);
               EXIT WHEN d_deli%notfound;  
            END LOOP;

            CLOSE d_deli;

            EXIT WHEN a_autho%notfound;  
         END LOOP;

         CLOSE a_autho; 

   END LOOP;      
CLOSE c_customer;


end;
/