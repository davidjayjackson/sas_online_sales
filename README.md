# SAS Notes
#### Re: Help with "Filter Table Row" in SAS OnDemand
```
If thus variable contains SAS date values (count of days starting at 1960-01-01), you must use a valid date literal: sale_date >= '01sep2019'd
Note the DATE9 format and the trailing **d** which makes this a date literal. Both are mandatory.

```
