select
   country_name,
   round(land_area/ (select
						sum(land_area)
					 from geographic_location
					 where sub_region = "middle africa") * 100) as pct_regional_land
from geographic_location
where sub_region = "middle africa";


select 
   sub_region,
   sum(land_area) as totallandarea
from geographic_location
group by sub_region


select
   geoloc.country_name,
   geoloc.land_area,
   geoloc.sub_region,
   (geoloc.land_area/ land_per_region.totallandarea) * 100 as pctofregionland
from geographic_location as geoloc
join (select 
   sub_region,
   sum(land_area) as totallandarea
from geographic_location
group by sub_region) as land_per_region



select
   country_name,
   avg(est_gdp_in_billions) as avg_gdp,
   avg(est_population_in_millions) as avg_population
from
    ( select
   country_name,
   est_gdp_in_billions,
   est_population_in_millions
from
   economic_indicators
where
   pct_unemployment > 5
   and time_period = 2020) as filteredcountryname
group by country_name	



select
   econ.country_name,
   econ.time_period,
   econ.est_gdp_in_billions,
   service.pct_managed_drinking_water_services
   
from
   economic_indicators as econ
inner join
   basic_services as service
on
   econ.country_name = service.country_name
   and econ.time_period = service.time_period
where
   econ.time_period = 2020
   and service.pct_managed_drinking_water_services < 90
   and econ.est_gdp_in_billions > (select
								   avg(est_gdp_in_billions)
								   from
                                     economic_indicators
                                   where
                                     time_period = 2020)