proc sql ;
CREATE TABLE daily_sales AS
SELECT
	SalesDate,
	count(*) as order_count,
	sum(quantity) as total_quantity,
	avg(quantity) as avg_quantity
	FROM esales.sales_trans
	GROUP BY SalesDate;
quit;

proc sql ;

CREATE TABLE esales.cust_summary AS
SELECT
	CustomerNo,
	count(*) as order_count,
	sum(quantity) as total_quantity,
	round(avg(quantity),2) as avg_quantity,
	sum(total_price) as total_price,
	round(avg(total_price),2) as avg_price
	FROM esales.sales_trans
	GROUP BY CustomerNo;
quit;


proc sql ;

CREATE TABLE product_sold AS
SELECT
	productname,
	count(*) as order_count,
	sum(quantity) as total_quantity,
	round(avg(quantity),2) as avg_quantity,
	sum(total_price) as total_price,
	round(avg(total_price),2) as avg_price
	FROM esales.sales_trans
	GROUP BY productname;
quit;