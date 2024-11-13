# SAS Notes
#### Re: Help with "Filter Table Row" in SAS OnDemand
```
If thus variable contains SAS date values (count of days starting at 1960-01-01), you must use a valid date literal: sale_date >= '01sep2019'd
Note the DATE9 format and the trailing **d** which makes this a date literal. Both are mandatory.

```
#### Converting negative Quantity values using proc sql and abs function.
```
proc sql;
    /* Update existing columns with absolute values */
    UPDATE returns
    SET quantity = ABS(quantity),
        total_sales = ABS(total_sales);
quit;
```
#### Convert dates to SAS format 2 examples
```
proc sql;
CREATE TABLE work.sales AS
SELECT * FROM esales.import WHERE Quantity >0;
quit;

data work.sales_import;
set work.sales;
format SalesDate date9.; /* Format for readability as DDMMMYYYY */
run;

proc datasets nolist lib=esales ;
  modify import;
    format SalesDate date9.;
  run;
quit;
```
