proc sql;

CREATE VIEW esales.sales AS
SELECT *,(quantity * price) as total_price
FROM esales.import;
quit;

proc SQL;

CREATE TABLE esales.returns AS
SELECT * 
FROM esales.sales
WHERE quantity <=0;
quit;

proc sql;
    /* Update existing columns with absolute values */
    UPDATE esales.returns
    SET quantity = ABS(quantity),
        total_price = ABS(total_price);
quit;

proc SQL;

CREATE TABLE esales.sales_trans AS
SELECT * 
FROM esales.sales
WHERE quantity >0;
quit;