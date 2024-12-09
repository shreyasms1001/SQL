CREATE DATABASE inventory;
USE inventory;

create table brands(
 bid int(5),
 bname varchar(20)
 );
 
 alter table brands
 add primary key(bid); 
 
create table inv_user(
 user_id varchar(20),
 name varchar(20),
 password varchar(20),
 last_login timestamp,
 user_type varchar(10)
 );
 
  create table categories(
  cid int(5),
 category_name varchar(20)
 );
 
 alter table categories
 add primary key(cid); 
 
alter table inv_user
add primary key(user_id);

create table product(
pid int(5) primary key,
 cid int(5) references categories(cid),
 bid int(5) references brands(bid),
 sid int(5),
 pname varchar(20),
 p_stock int(5),
 price int(5),
 added_date date);
 
 create table stores(
 sid int(5),
 sname varchar(20),
 address varchar(20),
 mobno int(10)
 );
 
 alter table stores
add primary key(sid); 
 
 alter table product
add foreign key(sid)references stores(sid); 

create table provides(
bid int(5)references brands(bid),
 sid int(5)references stores(sid),
 discount int(5));
 
 create table customer_cart(
 cust_id int(5) primary key,
 name varchar(20),
 mobno int(10)
);

create table select_product(
 cust_id int(5) references customer_cart(cust_id),
 pid int(5)references product(pid),
 quantity int(4)
 );
 
 create table transaction(
 id int(5) primary key,
 total_amount int(5),
 paid int(5),
 due int(5),
 gst int(3),
 discount int(5),
 payment_method varchar(10),
 cart_id int(5) references customer_cart(cust_id)
 );

create table invoice(
 item_no int(5),
 product_name varchar(20),
 quantity int(5),
 net_price int(5),
 transaction_id int(5)references transaction(id)
 );
 
INSERT INTO brands (bid, bname) VALUES (1, 'Apple');
INSERT INTO brands (bid, bname) VALUES (2, 'Samsung');
INSERT INTO brands (bid, bname) VALUES (3, 'Nike');
INSERT INTO brands (bid, bname) VALUES (4, 'Fortune');

INSERT INTO inv_user (user_id, name, password, last_login, user_type) 
VALUES
('vidit@gmail.com', 'vidit', '1234', '2018-10-31 12:40:00', 'admin');

INSERT INTO inv_user (user_id, name, password, last_login, user_type) 
VALUES
('harsh@gmail.com', 'Harsh Khanelwal', '1111', '2018-10-30 10:20:00', 'Manager');

INSERT INTO inv_user (user_id, name, password, last_login, user_type) 
VALUES
('prashant@gmail.com', 'Prashant', '0011', '2018-10-29 10:20:00', 'Accountant');

INSERT INTO categories (cid, category_name) VALUES (1, 'Electronics');
INSERT INTO categories (cid, category_name) VALUES (2, 'Clothing');
INSERT INTO categories (cid, category_name) VALUES (3, 'Grocery');

INSERT INTO stores (sid, sname, address, mobno) VALUES
(1, 'Ram kumar', 'Katpadi vellore', '999999999');

INSERT INTO stores (sid, sname, address, mobno) VALUES
(2, 'Rakesh kumar', 'Chennai', '888855554');

INSERT INTO stores (sid, sname, address, mobno) VALUES
(3, 'Suraj', 'Haryana', '777755554');

-- Insert values into the `product` table
INSERT INTO product (pid, cid, bid, sid, pname, p_stock, price, added_date) VALUES 
(1, 1, 1, 1, 'IPHONE', 4, 45000, '2018-10-31');

INSERT INTO product (pid, cid, bid, sid, pname, p_stock, price, added_date) VALUES 
(2, 1, 1, 1, 'Airpods', 3, 19000, '2018-10-27');

INSERT INTO product (pid, cid, bid, sid, pname, p_stock, price, added_date) VALUES 
(3, 1, 1, 1, 'Smart Watch', 3, 19000, '2018-10-27');

INSERT INTO product (pid, cid, bid, sid, pname, p_stock, price, added_date) VALUES 
(4, 2, 3, 2, 'Air Max', 6, 7000, '2018-10-27');

INSERT INTO product (pid, cid, bid, sid, pname, p_stock, price, added_date) VALUES 
(5, 3, 4, 3, 'REFINED OIL', 6, 750, '2018-10-25');

-- Insert values into the `provides` table
INSERT INTO provides VALUES (1, 1, 12);
INSERT INTO provides VALUES (2, 2, 7);
INSERT INTO provides VALUES (3, 3, 15);
INSERT INTO provides VALUES (1, 2, 7);
INSERT INTO provides VALUES (4, 2, 19);
INSERT INTO provides VALUES (4, 3, 20);

-- Insert a record into the customer_cart table with explicit values
INSERT INTO customer_cart (cust_id, name, mobno) 
VALUES (1, 'Ram', '987654321');

-- Insert another record into the customer_cart table
INSERT INTO customer_cart (cust_id, name, mobno) 
VALUES (2, 'Shyam', '777777777');

-- Insert a third record into the customer_cart table
INSERT INTO customer_cart (cust_id, name, mobno) 
VALUES (3, 'Mohan', '777777777');

-- Insert values into the select_product table
INSERT INTO select_product (cust_id, pid, quantity) 
VALUES (1, 2, 2);

INSERT INTO select_product (cust_id, pid, quantity) 
VALUES (1, 3, 1);

INSERT INTO select_product (cust_id, pid, quantity) 
VALUES (2, 3, 3);

INSERT INTO select_product (cust_id, pid, quantity) 
VALUES (3, 2, 1);

-- Insert data into the `transaction` table
INSERT INTO transaction (id, total_amount, paid, due, gst, discount, payment_method, cart_id)
VALUES
(1, 57000, 20000, 5000, 350, 350, 'card', 1);

INSERT INTO transaction (id, total_amount, paid, due, gst, discount, payment_method, cart_id)
VALUES
(2, 57000, 57000, 0, 570, 570, 'cash', 2);

INSERT INTO transaction (id, total_amount, paid, due, gst, discount, payment_method, cart_id)
VALUES
(3, 19000, 17000, 2000, 190, 190, 'cash', 3);

