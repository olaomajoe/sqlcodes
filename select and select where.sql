use united_nation;
select distinct country_name
from access_to_basic_services;


create table
 country_list(country_name varchar (225)
 );
 
 insert into 
 country_list(
 country_name
 )
 select distinct
 country_name
 from
 access_to_basic_services;
 
 
select 
country_name,
time_period,
pct_manage_drinking_water_services as pct_access_water
from 
access_to_basic_services
where
time_period= 2020