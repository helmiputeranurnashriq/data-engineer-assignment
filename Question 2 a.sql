CREATE DATABASE if not exists bookstore_pos;

USE bookstore_pos;

CREATE TABLE if not exists customers (
	id int primary key,
    name varchar(80) not null,
    email varchar(80),
    tel varchar(15),
    create_at timestamp default current_timestamp not null,
    updated_at timestamp default current_timestamp on update current_timestamp not null
);

CREATE TABLE if not exists invoices (
	id int primary key not null,
    number int(8) not null,
    sub_total decimal(8,2) not null,
    tax_total decimal(5,2) not null,
    total decimal(8,2) not null,
    customer_id int references customers(id),
    create_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp
);

CREATE TABLE if not exists invoice_lines (
	id int primary key not null,
    description varchar(200) not null,
    unit_price decimal(5,2)not null,
    quantity int not null,
    sub_total decimal(8,2) not null,
    tax_total decimal(5,2) not null,
    total decimal(8,2) not null,
    tax_id int null,
    sku_id int not null,
    invoice_id int references invoices(id)
);

INSERT INTO customers (
	id,
    name,
    email,
    tel,
    create_at,
    updated_at
) VALUE 
(1, "Irfan Bakti", "irfan88@example.com", "+60123456789", "2019-08-07 08:13:21", "2019-08-07 08:13:21"),
(2, 'Jack Smmith', 'jack.smmith@acme.io', '+60132456781', '2019-08-07 08:13:21', '2019-08-07 08:13:21'),
(3, 'Nazir','','+601185434012', '2019-08-07 08:13:21', '2019-08-07 08:13:21'),
(4, 'Faiz Ma', 'faiz.ma@jholow.cn', '+6019772002', '2019-08-07 08:13:21', '2019-08-07 08:13:21'),
(5, 'Isham Rais', 'isham@pmo.gov.my', '+60135482020', '2019-08-07 08:13:21', '2019-08-07 08:13:21'),
(6, 'Shanon Teoh', 'shahnon.teoh@st.com.sg','','2019-08-07 08:13:21', '2019-08-07 08:13:21')
;

INSERT INTO invoices (
	id,
    number,
    sub_total,
    tax_total,
    total,
    customer_id,
    create_at,
    updated_at
) VALUE 
(1, 20190001, 30.00, 0.00, 30.00, 1, "2019-08-07 08:13:21", "2019-08-07 08:13:21"),
(2, 20190002, 150.00, 0.00, 150.00, 2, '2019-08-07 08:13:21', '2019-08-07 08:13:21'),
(3, 20190003, 30.55, 0.00, 30.00, 2, '2019-09-15 08:13:21', '2019-08-07 08:13:21'),
(4, 20190004, 55.45, 0.00, 55.00, 3, '2019-09-15 08:13:21', '2019-08-07 08:13:21'),
(5, 20190005, 450.00, 0.00, 00.00, 6, '2019-09-15 08:13:21', '2019-08-07 08:13:21')
;

INSERT INTO invoice_lines (
	id,
    description,
    unit_price,
    quantity,
    sub_total,
    tax_total,
    total,
    tax_id,
    sku_id,
    invoice_id
) VALUE 
(1, 'Book #1', 30.00, 1, 30.00, 0.00, 30.00, NULL, 1, 1),
(2, 'Book #2', 25.00, 4, 100.00, 0.00, 100.00, NULL, 2, 2),
(3, 'Book #3', 50.00, 1, 50.00, 0.00, 50.00, NULL, 3, 2),
(4, 'Book #4', 30.00, 1, 30.00, 0.00, 30.00, NULL, 1, 3),
(5, 'Book #5', 30.00, 1, 30.00, 0.00, 30.00, NULL, 1, 4),
(6, 'Book #6', 25.00, 1, 25.00, 0.00, 25.00, NULL, 2, 4),
(7, 'Book #7', 30.00, 5, 150.00, 0.00, 150.00, NULL, 1, 5),
(8, 'Book #8', 50.00, 6, 300.00, 0.00, 300.00, NULL, 3, 5)
;

