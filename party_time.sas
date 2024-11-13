libname party xlsx "/home/u64077777/My SAS File/Party.xlsx";

title: "Party Invitation Contact Info";

proc sql;
	
	SELECT City,count(*) as city_count
		FROM Party.contacts
		GROUP BY City
		Order by city_count desc;
quit;

proc sgplot data=invites_summary;
    vbar City / response=city_count;
    xaxis label="City";
    yaxis label="Number of People Invited";
run;
