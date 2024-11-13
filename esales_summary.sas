proc sql;
   CREATE TABLE esales.daily_sales AS
   SELECT Date AS sale_date, /* Alias to avoid conflicts with reserved words */
          COUNT(*) AS order_count,
          SUM(Quantity) AS total_quantity,
          SUM(total_price) AS total_sales
   FROM esales.sales
   GROUP BY Date
   ORDER BY Date;
quit;

proc sql;
   CREATE TABLE esales.customer_sales AS
   SELECT 
      CustomerNo, /* Alias to avoid conflicts with reserved words */
          COUNT(*) AS order_count,
          SUM(Quantity) AS total_quantity,
          SUM(total_price) AS total_sales
   FROM esales.sales
   GROUP BY CustomerNo
   ORDER BY CustomerNo;
quit;

proc sql;
   CREATE TABLE esales.product_sales AS
   SELECT 
      ProductName, /* Alias to avoid conflicts with reserved words */
          COUNT(*) AS order_count,
          SUM(Quantity) AS total_quantity,
          SUM(total_price) AS total_sales
   FROM esales.sales
   GROUP BY ProductName
   ORDER BY ProductName;
quit;
