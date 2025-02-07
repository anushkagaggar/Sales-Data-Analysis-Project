-- create db
create database sales;

-- use db
use sales;

-- display customers table
select * from customers;

-- display products table
select * from products;

-- display orders table
select * from orders;

-- display order_items table
select * from order_items;

-- checking duplicate customers
select count(customer_id) from customers
group by customer_id
order by customer_id desc;

--  checking duplicate customers based on email
select email, count(*) from customers
group by email
having count(*)>1;

-- finding null or missing values
select count(*) as  missing_1stname from customers
where first_name is null or first_name="";

select count(*) as  missing_lastname from customers
where last_name is null or last_name="";

select 
	sum(case when customer_id is null then 1 else 0 end) as missing_custid,
    sum(case when first_name is null or first_name='' then 1 else 0 end) as missing_firstname,
    sum(case when last_name is null or last_name='' then 1 else 0 end) as missing_lastname,
    sum(case when email is null  or email='' then 1 else 0 end) as missing_email,
    sum(case when phone is null then 1 else 0 end) as missing_phone,
    sum(case when city is null  or city='' then 1 else 0 end) as missing_city,
    sum(case when state is null or state=''  then 1 else 0 end) as missing_state,
    sum(case when country is null  or country='' then 1 else 0 end) as missing_country,
    sum(case when registration_date is null then 1 else 0 end) as missing_regdate
from customers;

select
	sum(case when product_id is null then 1 else 0 end) as missing_prodid,
    sum(case when product_name is null or product_name='' then 1 else 0 end) as missing_prodname,
    sum(case when category is null or category ='' then 1 else 0 end) as missing_category,
    sum(case when price is null then 1 else 0 end) as missing_price,
    sum(case when stock_quantity is null then 1 else 0 end) as missing_stockquantity
from products;

select
	sum(case when order_id is null then 1 else 0 end) as missing_orderid,
    sum(case when payment_method is null or payment_method='' then 1 else 0 end) as missing_payment_method,
    sum(case when customer_id is null then 1 else 0 end) as missing_customerid,
    sum(case when order_date is null then 1 else 0 end) as missing_orderdate,
    sum(case when total_amount is null then 1 else 0 end) as missing_totalamount
from orders;

select
	sum(case when order_id is null then 1 else 0 end) as missing_orderid,
    sum(case when order_item_id is null then 1 else 0 end) as missing_orderitemid,
    sum(case when product_id is null then 1 else 0 end) as missing_productid,
    sum(case when quantity is null then 1 else 0 end) as missing_quantity,
    sum(case when subtotal is null then 1 else 0 end) as missing_subtotal
from order_items;

-- standarizing data
update customers
set email=lower(email);

select * from customers
where email not like "%@%.%";

-- Find total revenue generated.
select round(sum(subtotal),2) from order_items;

-- Identify the top 5 best-selling products.
select product_name, round(sum(subtotal),2) as total from products p
join order_items oi
on p.product_id=oi.product_id
group by product_name
order by total desc
limit 5;

-- Analyze the monthly sales trend.
select date_format(order_date, "%Y-%m") as months, sum(total_amount) as total from orders
group by months
order by months;

-- Determine the most valuable customers (highest total spending).
select first_name, round(sum(total_amount),2) as spending from customers c
join orders o
on c.customer_id=o.customer_id
group by first_name
order by first_name desc
limit 10;

-- List products with low stock (less than 10 units).
select * from products
where stock_quantity<10
order by stock_quantity
;

-- Find the most profitable product category.
select product_name, sum(subtotal) as total from products p
join order_items oi
on p.product_id=oi.product_id
group by product_name
order by product_name desc
limit 1;