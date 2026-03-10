select
   sub_region,
   country_name,
   land_area,
  round(land_area/ sum(land_area) over (
   partition by sub_region) * 100) as pct_sub_region_land_area
from
   access_to_basic_services
where
   time_period = 2020
   and land_area is not null;
   
   
select
   sub_region, 
   country_name,
   time_period,
   est_population_in_millions,
   round(avg(est_population_in_millions) over (
   partition by sub_region order by time_period ), 4) as running_avg_population
from
   access_to_basic_services
where
   est_population_in_millions is not null;


select
   country_name,
   time_period,
   pct_manage_drinking_water_services,
   rank() over(partition by time_period
   order by pct_manage_drinking_water_services asc) as rank_of_water_services
from 
   access_to_basic_services;


select
   country_name,
   time_period,
   pct_manage_drinking_water_services,
   lag(pct_manage_drinking_water_services) over(partition by country_name order by time_period asc) as prev_year_pct_manage_drinking_water_services,
   pct_manage_drinking_water_services -  lag(pct_manage_drinking_water_services) over(partition by country_name order by time_period asc) as growth_rate
from 
   access_to_basic_services