/* Calculate quantiles, mean, min, and max by sex */
proc means data=SASHELP.class noprint;
   class sex;  /* Group by sex */
   var weight;
   output out=class_summary
       min=Min_Weight
       max=Max_Weight
       mean=Mean_Weight
       median=Median_Weight
       p25=Q_25
       p50=Q_50
       p75=Q_75;
run;

/* Display the output */
proc print data=class_summary;
run;
