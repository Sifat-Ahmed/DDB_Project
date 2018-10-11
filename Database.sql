
--
-- Database: `shop2`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorises`
--

clear screen;


DROP TABLE authorises CASCADE CONSTRAINTS;
DROP TABLE authorized_staff CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE causes CASCADE CONSTRAINTS;
DROP TABLE chooses CASCADE CONSTRAINTS;
DROP TABLE contains CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;
DROP TABLE delivery CASCADE CONSTRAINTS;
DROP TABLE generates CASCADE CONSTRAINTS;
DROP TABLE issues CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE transaction CASCADE CONSTRAINTS;
DROP TABLE category CASCADE CONSTRAINTS;


CREATE TABLE authorises (
  staff_id int,
  delivery_id int,
  date_receivable date
);

--
-- Dumping data for table `authorises`
--

INSERT INTO authorises (staff_id,delivery_id,date_receivable) VALUES (1, 1, '15-feb-2018');
INSERT INTO authorises (staff_id,delivery_id,date_receivable) VALUES (3, 2, '16-apr-2018');
INSERT INTO authorises (staff_id,delivery_id,date_receivable) VALUES (4, 4, '18-aug-2017');

-- --------------------------------------------------------

--
-- Table structure for table `authorized_staff`
--

CREATE TABLE authorized_staff (
  staff_id int,
  product_id int,
  staff_name varchar(30),
  company_name varchar(20),
  address varchar(50),
  PRIMARY KEY (staff_id)
) ;

--
-- Dumping data for table `authorized_staff`
--

INSERT INTO authorized_staff (staff_id, product_id, staff_name, company_name, address) VALUES (1, 11, 'hasib', 'fresh meat com.', 'kalabagan');
INSERT INTO authorized_staff (staff_id, product_id, staff_name, company_name, address) VALUES (2, 12, 'jawad', 'fresh meat com.', 'kalabagan');
INSERT INTO authorized_staff (staff_id, product_id, staff_name, company_name, address) VALUES (3, 13, 'arnob', 'country fish com.', 'mirpur');
INSERT INTO authorized_staff (staff_id, product_id, staff_name, company_name, address) VALUES (4, 14, 'sujan', 'desi chaal com.', 'rampura');
INSERT INTO authorized_staff (staff_id, product_id, staff_name, company_name, address) VALUES (5, 15, 'mollik', 'suresh com.', 'niketon');
INSERT INTO authorized_staff (staff_id, product_id, staff_name, company_name, address) VALUES (6, 16, 'sadeeb', 'fresh meat com.', 'kalabagan');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE cart (
  cart_id int,
  product_name varchar(20),
  quantity int,
  unit_price number,
  total_price number,
  PRIMARY KEY (cart_id)
);

--
-- Dumping data for table `cart`
--

INSERT INTO cart (cart_id, product_name, quantity, unit_price, total_price) VALUES (1, 'beef', 5, 400, 2000);
INSERT INTO cart (cart_id, product_name, quantity, unit_price, total_price) VALUES (2, 'mutton', 6, 550, 3300);
INSERT INTO cart (cart_id, product_name, quantity, unit_price, total_price) VALUES (3, 'sword fish', 6, 700, 4200);
INSERT INTO cart (cart_id, product_name, quantity, unit_price, total_price) VALUES (4, 'rice', 7, 60, 420);
INSERT INTO cart (cart_id, product_name, quantity, unit_price, total_price) VALUES (5, 'olive-oil', 2, 50, 100);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE category (
  category_id int,
  category_name varchar(15),
  PRIMARY KEY (category_id)
);

--
-- Dumping data for table `category`
--

INSERT INTO category (category_id, category_name) VALUES (2, 'Fish');
INSERT INTO category (category_id, category_name) VALUES (1, 'Meat');
INSERT INTO category (category_id, category_name) VALUES (4, 'Oil');
INSERT INTO category (category_id, category_name) VALUES (3, 'Rice');

-- --------------------------------------------------------

--
-- Table structure for table `causes`
--

CREATE TABLE causes(
  cart_id int,
  delivery_id int
);

--
-- Dumping data for table `causes`
--

INSERT INTO causes (cart_id,delivery_id) VALUES (1, 1);
INSERT INTO causes (cart_id,delivery_id) VALUES (2, 2);
INSERT INTO causes (cart_id,delivery_id) VALUES (3, 4);
INSERT INTO causes (cart_id,delivery_id) VALUES (4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `chooses`
--

CREATE TABLE chooses(
  time timestamp,
  customer_id int,
  cat_id int
);

--
-- Dumping data for table `chooses`
--

INSERT INTO chooses (time, customer_id, cat_id) VALUES (TO_TIMESTAMP('2017-01-11 18:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 1, 1);
INSERT INTO chooses (time, customer_id, cat_id) VALUES (TO_TIMESTAMP('2018-04-16 10:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 2, 2);
INSERT INTO chooses (time, customer_id, cat_id) VALUES (TO_TIMESTAMP('2018-05-12 08:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 5, 3);
INSERT INTO chooses (time, customer_id, cat_id) VALUES (TO_TIMESTAMP('2017-01-11 13:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'), 7, 4);

-- --------------------------------------------------------

--
-- Table structure for table `contains`
--

CREATE TABLE contains (
  cat_id int,
  pro_id int
);

--
-- Dumping data for table `contains`
--

INSERT INTO contains (cat_id, pro_id) VALUES (1, 11);
INSERT INTO contains (cat_id, pro_id) VALUES (1, 12);
INSERT INTO contains (cat_id, pro_id) VALUES (2, 13);
INSERT INTO contains (cat_id, pro_id) VALUES (3, 14);
INSERT INTO contains (cat_id, pro_id) VALUES (4, 15);
INSERT INTO contains (cat_id, pro_id) VALUES (1, 16);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE customer (
  customer_id int,
  username varchar(20),
  name varchar(30),
  email varchar(30),
  phone varchar(14),
  password varchar(20),
  registration_date date,
  PRIMARY KEY (customer_id)
);

--
-- Dumping data for table `customer`
--

INSERT INTO customer (customer_id, username, name, email, phone, password, registration_date) VALUES (1, 'Ezio95', 'Md.Muhyasim Jawad', 'muhtasimjawad007@gmail.com', '01716964695', 'lalala', '15-feb-2017');
INSERT INTO customer (customer_id, username, name, email, phone, password, registration_date) VALUES (2, 'sifat', 'Sifat Anmed', 'sifat@hotmail.com', '01712286430', 'ajadkjs', '14-jan-2018');
INSERT INTO customer (customer_id, username, name, email, phone, password, registration_date) VALUES (5, 'salva', 'Salvi faravi', 'salvi@gmail.com', '01713044451', 'aaddbb', '15-feb-2018');
INSERT INTO customer (customer_id, username, name, email, phone, password, registration_date) VALUES (6, 'rumu', 'Rumu biswas', 'pudu@gmail.com', '01521494014', 'hello', '26-feb-2018');
INSERT INTO customer (customer_id, username, name, email, phone, password, registration_date) VALUES (7, 'anni', 'Mash anni', 'anni@gmail.com', '01521432375', 'wow', '2-aug-2016');
INSERT INTO customer (customer_id, username, name, email, phone, password, registration_date) VALUES (8, 'salman', 'Salman sadid', 'salman@gmail.com', '01716964695', 'nooo', '23-mar-2018');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE delivery(
  delivery_id int,
  customer_name varchar(30),
  address varchar(50),
  date_receivable date,
  PRIMARY KEY (delivery_id)
);

--
-- Dumping data for table `delivery`
--

INSERT INTO delivery (delivery_id, customer_name, address, date_receivable) VALUES (1, 'sifat', 'world', '2-aug-2018');
INSERT INTO delivery (delivery_id, customer_name, address, date_receivable) VALUES (2, 'salva', 'gulshan', '3-aug-2018');
INSERT INTO delivery (delivery_id, customer_name, address, date_receivable) VALUES (3, 'rumu', 'dhanmondi', '4-aug-2018');
INSERT INTO delivery (delivery_id, customer_name, address, date_receivable) VALUES (4, 'anni', 'kachpur', '5-aug-2018');
INSERT INTO delivery (delivery_id, customer_name, address, date_receivable) VALUES (5, 'Ezio95', 'niketon', '6-aug-2018');

-- --------------------------------------------------------

--
-- Table structure for table `generates`
--

CREATE TABLE generates (
  customer_id int,
  cart_id int,
  gdate date
);

--
-- Dumping data for table `generates`
--

INSERT INTO generates (customer_id, cart_id, gdate) VALUES (1, 1, '6-feb-2018');
INSERT INTO generates (customer_id, cart_id, gdate) VALUES (2, 2, '7-feb-2018');
INSERT INTO generates (customer_id, cart_id, gdate) VALUES (4, 3, '8-feb-2018');
INSERT INTO generates (customer_id, cart_id, gdate) VALUES (2, 4, '9-feb-2018');

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE issues(
  cart_id int,
  itime timestamp
);

--
-- Dumping data for table `issues`
--

INSERT INTO issues (cart_id, itime) VALUES (1, TO_TIMESTAMP('2018-01-11 18:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO issues (cart_id, itime) VALUES (2, TO_TIMESTAMP('2018-02-12 18:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO issues (cart_id, itime) VALUES (3, TO_TIMESTAMP('2018-03-13 18:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'));
INSERT INTO issues (cart_id, itime) VALUES (4, TO_TIMESTAMP('2018-04-15 18:00:00.00', 'YYYY-MM-DD HH24:MI:SS.FF'));

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE payment(
  payment_no int,
  customer_id int,
  cart_id int,
  method varchar(15),
  PRIMARY KEY (payment_no)
);

--
-- Dumping data for table `payment`
--

INSERT INTO payment (payment_no,customer_id,cart_id,method) VALUES (1, 1, 1, 'after');
INSERT INTO payment (payment_no,customer_id,cart_id,method) VALUES (2, 2, 2, 'before');
INSERT INTO payment (payment_no,customer_id,cart_id,method) VALUES (3, 5, 3, 'after');
INSERT INTO payment (payment_no,customer_id,cart_id,method) VALUES (4, 7, 4, 'after');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE product(
  product_id int,
  product_name varchar(20),
  product_description varchar(50),
  price number,
  quantity int,
  PRIMARY KEY (product_id)
) ;

--
-- Dumping data for table `product`
--

INSERT INTO product (product_id, product_name, product_description, price, quantity) VALUES (11, 'Beef', 'It is cow meat', 400, 100);
INSERT INTO product (product_id, product_name, product_description, price, quantity) VALUES (12, 'Mutton', 'It is goat meat.', 550, 100);
INSERT INTO product (product_id, product_name, product_description, price, quantity) VALUES (13, 'sword fish', 'it is a sea fish.', 700, 200);
INSERT INTO product (product_id, product_name, product_description, price, quantity) VALUES (14, 'rice', 'it is kalijira-rice.', 60, 500);
INSERT INTO product (product_id, product_name, product_description, price, quantity) VALUES (15, 'olive-oil', 'it is olive oil from fresh olives.', 50, 100);
INSERT INTO product (product_id, product_name, product_description, price, quantity) VALUES (16, 'chicken', 'it is fresh chicken meat.', 300, 400);
-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE transaction(
  product_id int,
  cart_id int,
  quantity int,
  tdate date
) ;

--
-- Dumping data for table `transaction`
--

INSERT INTO transaction (product_id, cart_id, quantity, tdate) VALUES (11, 1, 5, '6-mar-2018');
INSERT INTO transaction (product_id, cart_id, quantity, tdate) VALUES (12, 1, 6, '7-mar-2018');
INSERT INTO transaction (product_id, cart_id, quantity, tdate) VALUES (13, 2, 6, '8-mar-2018');
INSERT INTO transaction (product_id, cart_id, quantity, tdate) VALUES (14, 3, 7, '9-mar-2018');
INSERT INTO transaction (product_id, cart_id, quantity, tdate) VALUES (15, 4, 2, '12-mar-2018');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authorises`
--
ALTER TABLE authorises
  ADD CONSTRAINT fk_delID FOREIGN KEY (delivery_id) REFERENCES delivery(delivery_id);

--
-- Constraints for table `authorized_staff`
--
ALTER TABLE authorized_staff
  ADD CONSTRAINT fk_proID4 FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Constraints for table `causes`
--
ALTER TABLE causes ADD CONSTRAINT causes_ibfk_1 FOREIGN KEY (cart_id) REFERENCES cart(cart_id);
ALTER TABLE causes ADD CONSTRAINT fk_delID2 FOREIGN KEY (delivery_id) REFERENCES delivery(delivery_id);

--
-- Constraints for table `chooses`
--
ALTER TABLE chooses ADD CONSTRAINT fk_catID2 FOREIGN KEY (cat_id) REFERENCES category(category_id);
ALTER TABLE chooses ADD CONSTRAINT fk_cusID3 FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

--
-- Constraints for table `contains`
--
ALTER TABLE contains ADD CONSTRAINT fk_cat1 FOREIGN KEY (cat_id) REFERENCES category(category_id);
ALTER TABLE contains ADD CONSTRAINT fk_pro1 FOREIGN KEY (pro_id) REFERENCES product(product_id);

--
-- Constraints for table `issues`
--
ALTER TABLE issues
  ADD CONSTRAINT issues_ibfk_1 FOREIGN KEY (cart_id) REFERENCES cart(cart_id);

--
-- Constraints for table `payment`
--
ALTER TABLE payment ADD CONSTRAINT fk_cartid FOREIGN KEY (cart_id) REFERENCES cart(cart_id);
ALTER TABLE payment  ADD CONSTRAINT fk_cusid FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

--
-- Constraints for table `transaction`
--
ALTER TABLE transaction ADD CONSTRAINT fk_cartID3 FOREIGN KEY (cart_id) REFERENCES cart(cart_id);
ALTER TABLE transaction ADD CONSTRAINT fk_proID3 FOREIGN KEY (product_id) REFERENCES product(product_id);

