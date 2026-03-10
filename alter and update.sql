use united_nation;
CREATE TABLE access_to_basic_services(
Region  varchar(32),
sub_region varchar(25),
country_name integer not null,
time_period integer not null,
pct_manage_drinking_water_services numeric(5,2),
pct_manage_sanitation_service numeric,
est_population_in_millions numeric,
est_gdp_in_billions numeric,
land_area numeric,
pct_unemployment numeric
);


alter table access_to_basic_services
modify column country_name varchar(37) not null;

alter table access_to_basic_services
add column gini_index float;

alter table access_to_basic_services
drop column gini_index;


set sql_safe_updates = 0;

update access_to_basic_services
set pct_unemployment = 6
where country_name = 'china'
and time_period = 2017