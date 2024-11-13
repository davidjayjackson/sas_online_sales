libname party xlsx "/home/u64077777/My SAS File/Party.xlsx";


proc sql;
	drop table invites_summary;
	CREATE TABLE invites_summary AS
	SELECT City,count(*) as city_count
		FROM Party.contacts
		GROUP BY City;
quit;

proc sort data=invites_summary out=sorted_invites_summary;
    by descending city_count;
run;

proc sgplot data=sorted_invites_summary;
    hbar City / response=city_count;
    xaxis label="City";
    yaxis label="Number of People Invited";
run;


