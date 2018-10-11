
create or replace function getCompanyName(
 location in varchar)
	return varchar
	is
	NameofCompany varchar;

BEGIN
	
	select company_name from authorized_staff inner join customer on authorized_staff.address = 
	customer.location where authorized_staff.address = location;

EXCEPTION
	When no_data_found then
		DBMS_OUTPUT.PUT_LINE('No Data Found');
	When others then
		DBMS_OUTPUT.PUT_LINE('Something wrong happened');
END;
/