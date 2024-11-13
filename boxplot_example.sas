data sample_data;
    do group = "A", "B", "C";
        do i = 1 to 20;
            if group = "A" then values = rand("Normal", 5, 1);
            else if group = "B" then values = rand("Normal", 6, 1.2);
            else if group = "C" then values = rand("Normal", 7, 0.8);
            output;
        end;
    end;
run;

proc sgplot data=sample_data;
    vbox values / category=group fillattrs=(color=lightblue);
    title "Boxplot of Values by Group";
    xaxis label="Group";
    yaxis label="Values";
run;
