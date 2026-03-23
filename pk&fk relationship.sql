create table geographic_location(
country_name varchar(37) primary key,
sub_region varchar(25),
region varchar(32),
land_area numeric(10,2)
);

insert into geographic_location (country_name, sub_region, region, land_area)
select country_name,
	   sub_region,
       region,
       land_area
from access_to_basic_services;



insert into geographic_location (country_name, sub_region, region, land_area)
select country_name,
	   sub_region,
       region,
      avg(land_area)
from access_to_basic_services
group by country_name,
         sub_region,
         Region;
         
         

create table basic_services(
   country_name varchar(37),
   time_period int,
   pct_managed_drinking_water_services numeric(5,2),
   pct_managed_sanitation_services numeric(5,2),
   primary key (country_name, time_period),
   foreign key (country_name) references geographic_location(country_name)
   );
   
   insert into basic_services (country_name, time_period, pct_managed_drinking_water_services, pct_managed_sanitation_services)
   select country_name,
          time_period,
          pct_manage_drinking_water_services, 
          pct_manage_sanitation_service
   from access_to_basic_services;
   
   
   create table economic_indicators(
      country_name varchar(37),
      time_period int,
      est_gdp_in_billions numeric (10,2),
      est_population_in_millions numeric(11,2),
      pct_unemployment numeric (5,2),
       primary key (country_name, time_period),
   foreign key (country_name) references geographic_location(country_name)
   );
   
   insert into economic_indicators ( country_name, time_period, est_gdp_in_billions, est_population_in_millions, pct_unemployment)
   select country_name,
          time_period,
          est_gdp_in_billions,
          est_population_in_millions,
          pct_unemployment
   from access_to_basic_services