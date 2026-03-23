select *
from geographic_location as geo
left join
united_nation.economic_indicators as econ
on geo.country_name = econ.country_name
left join 
basic_services as svc
on geo.country_name = svc.country_name
and econ.time_period = svc.time_period;


select loc.country_name
from geographic_location as loc
where region like "central and southern asia";

select loc.country_name,
       eco.time_period,
       ifnull(pct_unemployment,19.59) as pct_unemployment_inputed
from geographic_location as loc
left join
economic_indicators as eco
on eco.country_name = loc.country_name
where region like "%central and southern asia%"

union

select loc.country_name,
       eco.time_period,
       ifnull(pct_unemployment,22.64) as pct_unemployment_inputed
from geographic_location as loc
left join
economic_indicators as eco
on eco.country_name = loc.country_name
where region like "%esatern and south-eastern asia%"

union

select loc.country_name,
       eco.time_period,
       ifnull(pct_unemployment,24.43) as pct_unemployment_inputed
from geographic_location as loc
left join
economic_indicators as eco
on eco.country_name = loc.country_name
where region like "%europe and northern america%"

union

select loc.country_name,
       eco.time_period,
       ifnull(pct_unemployment,24.23) as pct_unemployment_inputed
from geographic_location as loc
left join
economic_indicators as eco
on eco.country_name = loc.country_name
where region like "%latin america and the caribbean%"

union

select loc.country_name,
       eco.time_period,
       ifnull(pct_unemployment,17.84) as pct_unemployment_inputed
from geographic_location as loc
left join
economic_indicators as eco
on eco.country_name = loc.country_name
where region like "%northern africa and western asia%"

union

select loc.country_name,
       eco.time_period,
       ifnull(pct_unemployment,4.98) as pct_unemployment_inputed
from geographic_location as loc
left join
economic_indicators as eco
on eco.country_name = loc.country_name
where region like "%oceania%"

union

select loc.country_name,
       eco.time_period,
       ifnull(pct_unemployment,33.65) as pct_unemployment_inputed
from geographic_location as loc
left join
economic_indicators as eco
on eco.country_name = loc.country_name
where region like "%sub-saharan africa%"