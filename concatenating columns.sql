select
   distinct country_name,
   time_period,
   est_population_in_millions,
   concat(
   country_name,
   time_period,
   est_population_in_millions
   ) as country_id
from
   access_to_basic_services;
   
   select
   distinct country_name,
   time_period,
   est_population_in_millions,
   concat(
   ifnull(country_name,'UNKNOWN'),
   ifnull(time_period,'UNKNOWN'),
   ifnull(est_population_in_millions,'UNKNOWN')
   ) as country_id
from
   access_to_basic_services;
   
    select
   distinct country_name,
   time_period,
   est_population_in_millions,
   concat(
   substring(upper(ifnull(country_name,'UNKNOWN')),1,4),
   substring(ifnull(time_period,'UNKNOWN'),1,4),
   ifnull(est_population_in_millions,'UNKNOWN')
   ) as country_id
from
   access_to_basic_services