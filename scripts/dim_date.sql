INSERT INTO adw_datawh.dim_date (
    
    date_key,
    date_value,
    day_of_week,
    month_number,
    month_name,
    year4,
    year_month_number
)
SELECT
    datekey,
    datevalue,
    dayofweek,
    monthnumber,
    monthname,
    year4,
    yearmonthnumber
FROM adventureworks.dimdate;